% Impulse response for inelastic labor supply model 
% Econ 210C HW2
% Minki Kim

% Setting parameters
alpha = 0.33;
delta = 0.076;
k_y = 3.32;
betaa = 0.99;
rho = 0.95;
sigma_epsilon = 0.007;

c_k = (k_y)^(-1) - delta;
y_c = (1/k_y)/c_k;
gamma = 1/betaa + 1 - c_k*(1 - betaa*(1-delta))*(alpha - 1);
nu_kk = (gamma - sqrt(gamma^2 - 4/betaa))/2;
nu_kz = (y_c * (1-rho) + (1- betaa*(1-delta))*rho);

nu_ck = (1-c_k)*(1/betaa - nu_kk);
nu_cz = y_c - (1/c_k)*nu_kz;


