% Econ 210C Homework 3
% RBC with Variable Labor
% Justin Abraham

var Y I K L Z C w r;
varexo e;

parameters alpha beta delta eta rho sigma;

alpha = 0.33;
beta = 0.976;
delta = 0.076;
eta = 2;
rho = 0.95;
sigma = 1;

model;
exp(C(+1))/exp(C) = beta*(1+exp(r(+1)));               % Euler equation
exp(C)*(exp(L)^(1/eta)) = exp(w);                      % Labor supply
exp(Y) = exp(Z)*(exp(K(-1))^alpha)*(exp(L)^(1-alpha)); % Production
exp(Y) = exp(C) + exp(I);                              % National accounting
exp(K) = exp(K(-1))*(1-delta) + exp(I);                % Capital law of motion
exp(Z) = (exp(Z(-1))^rho)*exp(e);                      % Technology law of motion
exp(w) = (1-alpha)*(exp(Y)/exp(L));                    % Labor demand
exp(r) = alpha*(exp(Y)/exp(K(-1))) - delta;            % User cost equivalence
end;

initval;
K = log(20);
Y = log(3);
I = log(.5);
C = log(2.5);
L = log(1);
r = (1/beta)-1;
w = log(1.2);
Z = log(1);
end;

shocks;
var e = sigma^2;
end;

steady;

stoch_simul(order=1, hp_filter = 1600, periods = 2000, drop = 500, irf=40, nograph) C Y L;
