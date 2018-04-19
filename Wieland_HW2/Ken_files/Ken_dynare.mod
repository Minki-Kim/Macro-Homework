% ECON 210C PS2 Q6 Dynare problem
 
% Churn Ken Lee
 

 
%-----------------
 
% Define variables 
 
%-----------------
 

 
var c y w k z i;
 
varexo e;
 

 

 
%---------------
 
% Set parameters
 
%---------------
 

 
parameters alpha beta delta rho sigma;
 

 
alpha = 1/3;
 
beta = 0.99;
 
delta = 0.02;
 
rho = 0.95;
 
sigma = 0.007;
 

 
%-------------
 
% Define model
 
%-------------
 

 
model;
 

 
exp(w) = (1-alpha)*exp(y);
 
exp(c(+1)) = exp(c)*beta*(alpha*exp(y(+1))/exp(k) + 1 - delta);
 
exp(y) = exp(z)*exp(k(-1))^alpha;
 
exp(y) = exp(c) + exp(i);
 
exp(k) = (1-delta)*exp(k(-1)) + i;
 
z = rho*z(-1) + e;
 

 
end;
 

 
%--------------------
 
% Steady state values
 
%--------------------
 

 
initval;
 

 
k = log(36.8);
 
c = log(2.2);
 
y = log(3.3);
 
i = log(0.74);
 
z = log(1);
 
w = log(2.2);
 

 
end;
 

 
%-------
 
% Shocks
 
%-------
 

 
shocks;
 

 
var e = sigma^2;
 

 
end;
 

 
steady;
 

 
stoch_simul(order=1, relative_irf);