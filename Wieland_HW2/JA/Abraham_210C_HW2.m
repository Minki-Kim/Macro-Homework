% Title: Econ 210C Homework 2
% Author: Justin Abraham
% Notes: Log-linearized RBC model

clear; clc;
tic

%%%%%%%%%
% Setup %
%%%%%%%%%

reps = 5000;
shockt = round(reps*0.98);

alpha = 0.33;
beta = 0.99;
delta = 0.076;
rho = 0.95;
sigma = 0.007;

KYbar = 3.32;
CKbar = (1/KYbar) - delta;
YCbar = (1/KYbar) / CKbar;

gamma = 1/beta + 1 - CKbar*(1 - beta * (1 - delta))*(alpha - 1);

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reduced form solutions %
%%%%%%%%%%%%%%%%%%%%%%%%%%

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

    C(t) = nu_ck*K(t-1) + nu_cz*Z(t-1);
    K(t) = nu_kk*K(t-1) + nu_kz*Z(t-1);
    I(t) = (1/delta)*(K(t) - (1-delta)*K(t-1));
    Y(t) = Z(t) + alpha*K(t-1);
    w(t) = Z(t) + alpha*K(t-1);

end

subplot(2, 2, 1), plot(C(shockt:end, 1))

hold on
subplot(2, 2, 1), plot(K(shockt:end, 1))
subplot(2, 2, 1), plot(I(shockt:end, 1))
subplot(2, 2, 1), plot(Y(shockt:end, 1))
subplot(2, 2, 1), plot(w(shockt:end, 1))
hold off

title('rho = 0.95, alpha = 0.33'); xlabel('Time since shock'); legend('Consumption', 'Capital', 'Investment', 'Output', 'Wage', 'Location','northeast');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rho = 0.95, alpha = 0.66 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alpha = 0.66;
beta = 0.99;
delta = 0.076;
rho = 0.95;
sigma = 0.007;

KYbar = 3.32;
CKbar = (1/KYbar) - delta;
YCbar = (1/KYbar) / CKbar;

gamma = 1/beta + 1 - CKbar*(1 - beta * (1 - delta))*(alpha - 1);

nu_kk = (gamma - sqrt(gamma^2 - (4/beta))) / 2;
nu_ck = (CKbar^(-1))*((1/beta) - nu_kk);
nu_kz = (YCbar * (1-rho) + (1-beta*(1-delta))*rho) / ((CKbar^(-1))*(1-rho) + (CKbar^(-1))*((1/beta) - nu_kk) - (1-beta*(1-delta))*(alpha-1));
nu_cz = YCbar - ((CKbar^(-1)) * nu_kz);

epsilon = sigma*randn(reps, 1);

C = zeros(reps, 1);
K = zeros(reps, 1);
I = zeros(reps, 1);
Y = zeros(reps, 1);
w = zeros(reps, 1);
r = zeros(reps, 1);

for t = 2:reps

    C(t) = nu_ck*K(t-1) + nu_cz*Z(t-1);
    K(t) = nu_kk*K(t-1) + nu_kz*Z(t-1);
    I(t) = (1/delta)*(K(t) - (1-delta)*K(t-1));
    Y(t) = Z(t) + alpha*K(t-1);
    w(t) = Z(t) + alpha*K(t-1);

end

subplot(2, 2, 2), plot(C(shockt:end, 1))

hold on
subplot(2, 2, 2), plot(K(shockt:end, 1))
subplot(2, 2, 2), plot(I(shockt:end, 1))
subplot(2, 2, 2), plot(Y(shockt:end, 1))
subplot(2, 2, 2), plot(w(shockt:end, 1))
hold off

title('rho = 0.95, alpha = 0.66'); xlabel('Time since shock'); legend('Consumption', 'Capital', 'Investment', 'Output', 'Wage', 'Location','northeast');

%%%%%%%%%%%%%%%%%%%%%%%%%
% rho = 1, alpha = 0.33 %
%%%%%%%%%%%%%%%%%%%%%%%%%

alpha = 0.33;
beta = 0.99;
delta = 0.076;
rho = 1;
sigma = 0.007;

KYbar = 3.32;
CKbar = (1/KYbar) - delta;
YCbar = (1/KYbar) / CKbar;

gamma = 1/beta + 1 - CKbar*(1 - beta * (1 - delta))*(alpha - 1);

nu_kk = (gamma - sqrt(gamma^2 - (4/beta))) / 2;
nu_ck = (CKbar^(-1))*((1/beta) - nu_kk);
nu_kz = (YCbar * (1-rho) + (1-beta*(1-delta))*rho) / ((CKbar^(-1))*(1-rho) + (CKbar^(-1))*((1/beta) - nu_kk) - (1-beta*(1-delta))*(alpha-1));
nu_cz = YCbar - ((CKbar^(-1)) * nu_kz);

epsilon = sigma*randn(reps, 1);

Z = zeros(reps, 1);
C = zeros(reps, 1);
K = zeros(reps, 1);
I = zeros(reps, 1);
Y = zeros(reps, 1);
w = zeros(reps, 1);
r = zeros(reps, 1);

for t = 2:reps

    if t == shockt
        Z(t) = Z(t-1) + 1;
    else
        Z(t) = rho*Z(t-1) + epsilon(t);
    end

    C(t) = nu_ck*K(t-1) + nu_cz*Z(t-1);
    K(t) = nu_kk*K(t-1) + nu_kz*Z(t-1);
    I(t) = (1/delta)*(K(t) - (1-delta)*K(t-1));
    Y(t) = Z(t) + alpha*K(t-1);
    w(t) = Z(t) + alpha*K(t-1);

end

subplot(2, 2, 3), plot(C(shockt:end, 1))

hold on
subplot(2, 2, 3), plot(K(shockt:end, 1))
subplot(2, 2, 3), plot(I(shockt:end, 1))
subplot(2, 2, 3), plot(Y(shockt:end, 1))
subplot(2, 2, 3), plot(w(shockt:end, 1))
hold off

title('rho = 1, alpha = 0.33'); xlabel('Time since shock'); legend('Consumption', 'Capital', 'Investment', 'Output', 'Wage', 'Location','southeast');

%%%%%%%%%%%%%%%%%%%%%%%%%
% rho = 1, alpha = 0.66 %
%%%%%%%%%%%%%%%%%%%%%%%%%

alpha = 0.66;
beta = 0.99;
delta = 0.076;
rho = 1;
sigma = 0.007;

KYbar = 3.32;
CKbar = (1/KYbar) - delta;
YCbar = (1/KYbar) / CKbar;

gamma = 1/beta + 1 - CKbar*(1 - beta * (1 - delta))*(alpha - 1);

nu_kk = (gamma - sqrt(gamma^2 - (4/beta))) / 2;
nu_ck = (CKbar^(-1))*((1/beta) - nu_kk);
nu_kz = (YCbar * (1-rho) + (1-beta*(1-delta))*rho) / ((CKbar^(-1))*(1-rho) + (CKbar^(-1))*((1/beta) - nu_kk) - (1-beta*(1-delta))*(alpha-1));
nu_cz = YCbar - ((CKbar^(-1)) * nu_kz);

epsilon = sigma*randn(reps, 1);

C = zeros(reps, 1);
K = zeros(reps, 1);
I = zeros(reps, 1);
Y = zeros(reps, 1);
w = zeros(reps, 1);
r = zeros(reps, 1);

for t = 2:reps

    C(t) = nu_ck*K(t-1) + nu_cz*Z(t-1);
    K(t) = nu_kk*K(t-1) + nu_kz*Z(t-1);
    I(t) = (1/delta)*(K(t) - (1-delta)*K(t-1));
    Y(t) = Z(t) + alpha*K(t-1);
    w(t) = Z(t) + alpha*K(t-1);

end

subplot(2, 2, 4), plot(C(shockt:end, 1))

hold on
subplot(2, 2, 4), plot(K(shockt:end, 1))
subplot(2, 2, 4), plot(I(shockt:end, 1))
subplot(2, 2, 4), plot(Y(shockt:end, 1))
subplot(2, 2, 4), plot(w(shockt:end, 1))
hold off

title('rho = 1, alpha = 0.66'); xlabel('Time since shock'); legend('Consumption', 'Capital', 'Investment', 'Output', 'Wage', 'Location','southeast');

set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0, 0.6, 0.8]);
