% Econ 210C Homework 2
% Justin Abraham

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------
% y = output (in log terms)
% c = consumption (in log terms)

var y I k a c w R r;
varexo e;

parameters alpha beta delta rho sigma sigmae;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

alpha   = 1/3;   // exponent on capital in the production function
beta    = 0.99;  // household's discount factor
delta   = 0.025;  // capital depreciation rate
rho     = 0.95;  // persistence of shock
sigma   = 1;     // degree of risk aversion
sigmae  = 0.01;   // std of productivity shock

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------
% can also use the log-linearized system (Dynare will do this for you)
% index by (-1) has Dynare treat as state variable

model;

exp(c)^(-sigma) = beta*(exp(c(+1))^(-sigma))*(alpha*exp(a(+1))*exp(k)^(alpha-1) + (1-delta));
exp(y)   = exp(a)*exp(k(-1))^alpha;
exp(k)   = exp(k(-1))*(1-delta) + exp(I);
exp(y)   = exp(c) + exp(I);
exp(R)   = alpha*exp(y)/exp(k(-1)) - delta;
exp(w)   = (1-alpha)*exp(y);
exp(c)^(-sigma) = beta*(exp(c(+1))^(-sigma))*(1+r);
a = rho*a(-1) + e;

end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;

k = log(30);
y = log(3);
I = log(0.5);
c = log(2.5);
a = 0;
r = (1/beta)-1;
R = log((1/beta)-(1-delta));
w = log(1);

end;

shocks;

var e = sigmae^2;

end;

steady;

stoch_simul(order=1, irf=20) c y k I r a;
