// Econ 210C HW5
// Basic New Keynesian model 
// Minki Kim


// ************************************************************************
// Declare variables
// ************************************************************************
var
c n y ynat ygap i pi z nu r
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

// Calibration followed the values in p.121 
// Deep parameters
betaa = 0.98;
alpha = 1/3;  // Decreasing return to scale
psi = 1; // 
theta = 2/3; // In quarterly calibration, average price change duration is an year
sigma = 6; // Elasticity of substitution 
eta = 1; // Frisch elasticity of labor supply

// Taylor rule parameters
phi_pi = 1.5;
phi_y = 0.125;

// Persistence and variance of shocks 
// Persistence parameters are calibrated to generate IRFs close to those in the lecture note
rho_z = 0.75;
rho_nu = 0.75;
sigma_epsilon_z = 1;
sigma_epsilon_nu = 0.05;

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

// 10. Definition of real interest rate
r = i - pi(+1);

end;


shocks;
//var epsilon_z = sigma_epsilon_z;
var epsilon_nu = sigma_epsilon_nu;
end;

resid(1);
steady;
check;

stoch_simul(order=1, irf=21, nograph); 
