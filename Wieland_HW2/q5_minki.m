% Impulse response for inelastic labor supply model 
% Econ 210C HW2
% Minki Kim

clear;
clc;

% Setting parameters
alpha = 0.33;
delta = 0.076;
betaa = 0.976;
rho = 0.95;
sigma_epsilon = 0.007; % To set std of TFP close to 2.29

y_k = (1/alpha)*(1/betaa + delta - 1);
k_y = 1/y_k;
c_k = y_k - delta;
k_c = 1/c_k;
y_c = y_k/c_k;
c_y = 1/y_c;
i_y = delta*k_y;
y_i = 1/i_y;
c_i = c_y / y_i;

gamma = 1/betaa + 1 - c_k*(1 - betaa*(1-delta))*(alpha - 1);
nu_kk = (gamma - sqrt(gamma^2 - 4/betaa))/2;
nu_kz = (y_c * (1-rho) + (1- betaa*(1-delta))*rho) / (k_c*(1-rho) + k_c*((1/betaa) - nu_kk) - ( 1 - betaa*(1-delta))*(alpha-1))   ;

nu_ck = k_c*(1/betaa - nu_kk);
nu_cz = y_c - k_c*nu_kz;

% Simluating the model 
simul_length = 1000;
rng(425);

epsilon_simul = normrnd(0,sigma_epsilon,[simul_length,1]);
z_simul = zeros(simul_length,1);
k_simul = zeros(simul_length,1);
c_simul = zeros(simul_length,1);
i_simul = zeros(simul_length,1);
y_simul = zeros(simul_length,1);

for i = 2:1000
    z_simul(i) = rho*z_simul(i-1) + epsilon_simul(i);
    k_simul(i) = nu_kk*k_simul(i-1) + nu_kz*z_simul(i);
    c_simul(i) = nu_ck*k_simul(i-1) + nu_cz*z_simul(i);
    i_simul(i) = k_simul(i)/delta - ((1-delta)/delta)*k_simul(i-1);
    y_simul(i) = c_y*c_simul(i) + i_y*i_simul(i);
end

FigHandle = figure('Position', [250, 300, 1200, 400]); set(0,'defaultlinelinewidth',1.3);
plot(k_simul(400:500)); hold on; plot(c_simul(400:500)); hold on; plot(i_simul(400:500)); hold on; plot(y_simul(400:500));
ylabel('Simulated values','FontSize',13); xlabel('time','FontSize',13); legend('Capital','Consumption','Investment','Output','Location','northeast'); xlim([0 100]); grid on;

format short;
disp(['Standard deviation of TFP is ', num2str(std(z_simul))]);
disp(['Standard deviation of output is ', num2str(std(y_simul))]);
disp(['Standard deviation of consumption is ', num2str(std(c_simul))]);
disp(['Standard deviation of investment is ', num2str(std(i_simul))]);

% Impulse response
epsilon_path = zeros(40,1);
epsilon_path(1) = 0.1;
z_path = zeros(40,1);
z_path(1) = 0.1;

c_path = zeros(40,1);
k_path = zeros(40,1);
i_path = zeros(40,1);
y_path = zeros(40,1);
w_path = zeros(40,1);

c_path(1) = nu_cz*z_path(1);
k_path(1) = nu_kz*z_path(1);
y_path(1) = z_path(1);
i_path(1) = k_path(1)/delta;
w_path(1) = alpha*k_path(1);


for i = 2:40
    z_path(i) = rho*z_path(i-1) + epsilon_path(i);
    k_path(i) = nu_kk*k_path(i-1) + nu_kz*z_path(i);
    c_path(i) = nu_ck*k_path(i-1) + nu_cz*z_path(i);
    i_path(i) = k_path(i)/delta - ((1-delta)/delta)*k_path(i-1);
    y_path(i) = c_y*c_path(i) + i_y*i_path(i);
    w_path(i) = alpha*k_path(i);
end

FigHandle = figure('Position', [250, 300, 1000, 400]); set(0,'defaultlinelinewidth',2);
plot(c_path); hold on; plot(y_path); hold on; plot(i_path); hold on; plot(w_path); hold on; plot(z_path);
ylabel('Deviation from steady state','FontSize',15); xlabel('Time','FontSize',15); 
legend({'Consumption','Output','Investment','Wage','Technology'},'FontSize',14,'Location','northeast'); xlim([1 40]); grid on;

% Comparing with dynare IRF

dynare Minki_dynare.mod
dynare_output = oo_.irfs;
save dynare_output dynare_output;

load dynare_output;
FigHandle = figure('Position', [250, 300, 1000, 800]); set(0,'defaultlinelinewidth',2);
subplot(2,2,1); plot(dynare_output.y_epsilon, '--rx'); hold on; plot(y_path, '--b'); title('Output','FontSize',20); legend({'Dynare IRF','Simulation IRF'},'FontSize',15);
subplot(2,2,2); plot(dynare_output.c_epsilon, '--rx'); hold on; plot(c_path, '--b'); title('Consumption','FontSize',20); legend({'Dynare IRF','Simulation IRF'},'FontSize',15);
subplot(2,2,3); plot(dynare_output.i_epsilon, '--rx'); hold on; plot(i_path, '--b'); title('Investment','FontSize',20); legend({'Dynare IRF','Simulation IRF'},'FontSize',15);
subplot(2,2,4); plot(dynare_output.w_epsilon, '--rx'); hold on; plot(w_path, '--b'); title('Wage','FontSize',20); legend({'Dynare IRF','Simulation IRF'},'FontSize',15);




