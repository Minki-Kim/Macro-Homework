// Econ 210C HW2
// Solving inelastic labor model using dynare
// Minki Kim

var
c y i w z k r
;

varexo
epsilon
;

parameters
betaa alpha delta rho sigma_epsilon
;

alpha = 0.33;
delta = 0.076;
betaa = 0.976;
k_y = 3.32;
rho = 0.95;
sigma_epsilon = 0.01;

model;
exp(c(+1))/exp(c) = betaa*(1+exp(r(+1)));
exp(y) = exp(z)*exp(k(-1))^alpha;
exp(y) = exp(c) + exp(i);
exp(k) = exp(k(-1))*(1-delta) + exp(i);
exp(z) = (exp(z(-1))^rho)*exp(epsilon);
exp(w) = (1-alpha)*exp(k(-1))^alpha;
exp(r) = alpha*exp(z)*exp(k(-1))^(alpha-1) - delta;
end;

initval;
k = log(30);
y = log(3);
i = log(.5);
c = log(2.5);
r = (1/betaa)-1;
w = log(1);
z = log(1);
end;

shocks;
var epsilon = sigma_epsilon;
end;

steady;

stoch_simul(order=1, irf=40) nograph;
 

