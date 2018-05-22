clear;
clc;

% Technology shock 
dynare Minki_dynare_5.mod

time = [0:20];
FigHandle = figure('Position', [250, 300, 800, 600]); set(0,'defaultlinelinewidth',2);
subplot(2,2,1); plot(time,oo_.irfs.ygap_epsilon_z, '-b'); title('Output gap','FontSize',14); 
subplot(2,2,2); plot(time,oo_.irfs.pi_epsilon_z, '-b'); title('Inflation','FontSize',14); 
subplot(2,2,3); plot(time,oo_.irfs.y_epsilon_z, '-b'); title('Output','FontSize',14); 
subplot(2,2,4); plot(time,oo_.irfs.n_epsilon_z, '-b'); title('Labor','FontSize',14); 


% Monetary policy shock
dynare Minki_dynare_5.mod

time = [0:20];
FigHandle = figure('Position', [250, 300, 800, 600]); set(0,'defaultlinelinewidth',2);
subplot(2,2,1); plot(time,oo_.irfs.nu_epsilon_nu, '-b'); title('Monetary policy shock','FontSize',14); 
subplot(2,2,2); plot(time,oo_.irfs.ygap_epsilon_nu, '-b'); title('Output gap','FontSize',14); 
subplot(2,2,3); plot(time,oo_.irfs.pi_epsilon_nu, '-b'); title('Inflation','FontSize',14); 
subplot(2,2,4); plot(time,oo_.irfs.r_epsilon_nu, '-b'); title('Real interest rate','FontSize',14); 
