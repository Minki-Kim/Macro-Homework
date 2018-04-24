// Econ 210C HW2
// Solving inelastic labor model using dynare
// Minki Kim

var
c y i w z k r l
;

varexo
epsilon
;

parameters
betaa alpha delta rho eta sigma_epsilon
;

alpha = 0.33;
delta = 0.076;
betaa = 0.976;
k_y = 3.32;
rho = 0.95;
sigma_epsilon = 1;
eta = 0.5;

model;
exp(c(+1))/exp(c) = betaa*(1+exp(r(+1)));
exp(y) = exp(z)*(exp(k(-1))^alpha)*(exp(l)^(1-alpha));
exp(y) = exp(c) + exp(i);
exp(k) = exp(k(-1))*(1-delta) + exp(i);
exp(z) = (exp(z(-1))^rho)*exp(epsilon);
exp(w) = (1-alpha)*exp(y)/exp(l);
exp(c)*(exp(l)^(1/eta)) = exp(w);
exp(r) = alpha*exp(y)/exp(k) - delta;
end;

initval;
k = log(20);
y = log(3);
i = log(.5);
c = log(2.5);
l = log(1.5);
r = (1/betaa)-1;
w = log(2);
z = log(1);
end;

shocks;
var epsilon = sigma_epsilon;
end;

steady;

stoch_simul(order=1, hp_filter = 1600, periods = 2000, drop = 500, irf=40, nograph); 
 

