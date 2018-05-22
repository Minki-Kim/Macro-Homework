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
epsilon_z epsilon_m
;


// ************************************************************************
// Parameters 
// ************************************************************************
parameters
betaa alpha psi sigma eta theta phi_pi phi_y rho_z rho_m sigma_epsilon_z sigma_epsilon_m
;

// Deep parameters
alphaa = 0.33;  // Decreasing return to scale
psi = 1 // p.109
theta = 3/4; // In quarterly calibration, average price change duration is an year
sigma = 3; // Elasticity of substitution 
eta = 3.79; // Frisch elasticity of labor supply

// Taylor rule parameters
phi_pi = 1.5;
phi_y = 1;

// Persistence and variance of shocks 
rho_z = 0.9;
rho_m = 0.9;
sigma_epsilon_z = 0.01;
sigma_epsilon_m = 0.01;


// ************************************************************************
// Model
// ************************************************************************

model(linear);
// 1. National income identity
y = c;

// 2. Euler equation
c = c(+1) - (1\psi)*(i - pi(+1));

// 3. Production function
y = z*n^(1-alphaa);

// 4. Taylor rule
i = phi_pi*pi + phi_y*ygap + nu;

// 5. NKPC
pi = betaa*pi(+1) + kappadot*ygap;

// 6. Definition of output gap;
ygap = y - ynat;

// 7. Natural level of output;
ynat = ((1 + (1/eta))/( (1-alphaa)*psi + (1/eta) + alphaa )) z;

// 8. 

// . Technology shock

// . Monetary policy shock
end;


// ************************************************************************
// Initial values
// ************************************************************************
initval;

end;

shocks;
var epsilon_z = sigma_epsilon_z;
var epsilon_m = sigma_epsilon_m;
end;

steady;

stoch_simul(order=1, hp_filter = 1600, periods = 2000, drop = 500, irf=40, nograph); 
 

