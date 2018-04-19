% Econ 210C Homework 2
% Justin Abraham

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------
% y = output (in log terms)
% c = consumption (in log terms)

var Y I K Z C w r;
varexo e;

parameters alpha beta delta rho sigma;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

alpha = 0.33;
beta = 0.99;
delta = 0.076;
rho = 0.95;
sigma = 0.007;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------
% can also use the log-lineariZed system (Dynare will do this for you)
% index by (-1) has Dynare treat as state variable

model;

exp(C(+1))/exp(C) = beta*(1+exp(r(+1)));
exp(Y) = exp(Z)*exp(K(-1))^alpha;
exp(Y) = exp(C) + exp(I);
exp(K) = exp(K(-1))*(1-delta) + exp(I);
exp(Z) = (exp(Z(-1))^rho)*exp(e);
exp(w) = (1-alpha)*exp(K(-1))^alpha;
exp(r) = alpha*exp(Z)*exp(K(-1))^(alpha-1) - delta;

end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;

K = log(30);
Y = log(3);
I = log(.5);
C = log(2.5);
r = (1/beta)-1;
w = log(1);
Z = log(1);

end;

shocks;

var e = sigma^2;

end;

steady;

stoch_simul(order=1, irf=50) C K I Y;
