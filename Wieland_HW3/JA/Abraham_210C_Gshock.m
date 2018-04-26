% Title: Econ 210C Homework 3
% Author: Justin Abraham
% Notes: Log-linearized RBC model with G shocks

clear; clc;
tic

%%%%%%%%%%%%%%
% Initialize %
%%%%%%%%%%%%%%

reps = 5000;
shockt = round(reps*0.98);

alpha = 0.33;
beta = 0.99;
delta = 0.076;
rho = 0.95;
sigma = 0.007;

KYbar = 1/((1/alpha)*(1/beta + delta - 1));
CKbar = (1/KYbar) - delta;
YCbar = (1/KYbar) / CKbar;

gamma = 1/beta + 1 - CKbar*(1 - beta * (1 - delta))*(alpha - 1);

%%%%%%%%%%%%%%%%%%%%%%
% Solve reduced form %
%%%%%%%%%%%%%%%%%%%%%%

nu_kk = (gamma - sqrt(gamma^2 - (4/beta))) / 2;
nu_ck = (CKbar^(-1))*((1/beta) - nu_kk);
nu_kz = (YCbar * (1-rho) + (1-beta*(1-delta))*rho) / ((CKbar^(-1))*(1-rho) + (CKbar^(-1))*((1/beta) - nu_kk) - (1-beta*(1-delta))*(alpha-1));
nu_cz = YCbar - ((CKbar^(-1)) * nu_kz);

%%%%%%%%%%%%%%%%%%%%%%
% Initialize vectors %
%%%%%%%%%%%%%%%%%%%%%%

epsilon = sigma*randn(reps, 1);

Z = zeros(reps, 1);
C = zeros(reps, 1);
K = zeros(reps, 1);
I = zeros(reps, 1);
Y = zeros(reps, 1);
w = zeros(reps, 1);
r = zeros(reps, 1);

%%%%%%%%%%%%%%
% Simulation %
%%%%%%%%%%%%%%

for t = 2:reps

    if t == shockt
        Z(t) = Z(t-1) + 1;
    else
        Z(t) = rho*Z(t-1) + epsilon(t);
    end

    C(t) = nu_ck*K(t-1) + nu_cz*Z(t);
    K(t) = nu_kk*K(t-1) + nu_kz*Z(t);
    I(t) = (1/delta)*(K(t) - (1-delta)*K(t-1));
    Y(t) = Z(t) + alpha*K(t-1);
    % Y(t) = (1/YCbar)*C(t) + delta*KYbar*I(t);
    w(t) = Z(t) + alpha*K(t-1);

end

%%%%%%%%
% Plot %
%%%%%%%%

subplot(2, 2, 1), plot(C(shockt-1:end, 1))

hold on
subplot(2, 2, 1), plot(K(shockt-1:end, 1))
subplot(2, 2, 1), plot(I(shockt-1:end, 1))
subplot(2, 2, 1), plot(Y(shockt-1:end, 1))
subplot(2, 2, 1), plot(w(shockt-1:end, 1))
hold off

title('rho = 0.95, alpha = 0.33'); xlabel('Time since shock'); legend('Consumption', 'Capital', 'Investment', 'Output', 'Wage', 'Location','northeast');
