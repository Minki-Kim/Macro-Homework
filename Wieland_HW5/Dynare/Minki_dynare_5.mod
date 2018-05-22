// Econ 210C HW5
// Basic New Keynesian model 
// Minki Kim


// ************************************************************************
// Declare variables
// ************************************************************************
var
c n y ynat ygap i pi z nu 
;

varexo
epsilon_z epsilon_nu
;


// ************************************************************************
// Parameters 
// ************************************************************************
parameters
betaa alpha psi sigma eta theta phi_pi phi_y rho_z rho_nu sigma_epsilon_z sigma_epsilon_nu
Theta kappa kappadot 
;

// Deep parameters
betaa = 0.98;
alpha = 0.33;  // Decreasing return to scale
psi = 1; // p.109
theta = 3/4; // In quarterly calibration, average price change duration is an year
sigma = 3; // Elasticity of substitution 
eta = 3.79; // Frisch elasticity of labor supply

// Taylor rule parameters
phi_pi = 1.5;
phi_y = 1;

// Persistence and variance of shocks 
rho_z = 0.9;
rho_nu = 0.9;
sigma_epsilon_z = 0.01;
sigma_epsilon_nu = 0.01;

// Auxiliary parameters
Theta = (1-alpha)/(1-alpha+(alpha*sigma));
kappa = (((1-theta)*(1-(betaa*theta)))/theta)*Theta;
kappadot = kappa*(psi + ((1/eta) + alpha) / (1-alpha));

// ************************************************************************
// Model
// ************************************************************************

model(linear);
// 1. National income identity
y = c;

// 2. Euler equation
c = c(+1) - (1/psi)*(i - pi(+1));

// 3. Production function
y = z+ (1-alpha)*n;

// 4. Taylor rule
i = phi_pi*pi + phi_y*ygap + nu;

// 5. NKPC
pi = betaa*pi(+1) + kappadot*ygap;

// 6. Definition of output gap;
ygap = y - ynat;

// 7. Natural level of output;
ynat = ((1 + (1/eta))/( (1-alpha)*psi + (1/eta) + alpha )) * z;

// 8. Technology shock
z = rho_z *z(-1) + epsilon_z;

// 9. Monetary policy shock
nu = rho_nu * nu(-1) + epsilon_nu;

end;


shocks;
//var epsilon_z = 100*sigma_epsilon_z;
var epsilon_nu = 100*sigma_epsilon_nu;
end;

resid(1);
steady;
check;

stoch_simul(order=1, irf=40); 
 

