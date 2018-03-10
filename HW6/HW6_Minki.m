% *************************************************************************
% Econ 210B Macroeconomics B HW6
% Minki Kim
% 2018. 3.7

% Solving Aiyagari model 

% <SUMMARY OF THE ENVIRONMENT>
% 1. States: Asset holding this period stochastic labor endowment
% 2. Actions: Asset holding in the next period (or consumption)
% 3. Rewards: Utility
% *************************************************************************

clear;
clc;

cd '/Users/minki/Dropbox/PhD Courses/2018 Winter Quarter/Macro B/HW6'

%% 1. Parameters
lvec = [0.1 1 1.25];
Z = 0.1;
alphaa = 0.3;
B = 0.1;
bmax = 2;
betaa = 0.95;
Nb = 501;
T = 20000;
psi = 0.0001;
delta = 0;
K0 = 0.40;

nlsize = 3;
P = [.4 .5 .1; .2 .7 .1; .2 .1 .7];
epsilon = 0.25;
mu = 0.03;

tol_inner = 1e-6;
tol_outer = 1e-6;
tol = 1e-6;

%% 2. Ergodic distribution and aggregate labor
% Ergodic density of individuals over productivity states
H = P;
for i = 1: 1000
    H_new = H*P;
    error = H - H_new;
    if error < tol
        disp(['Ergodic distribution obtained in iteration = ', num2str(i)])
    break
    end
    
    H = H_new;
end
F = H(1,:);

% Calculating aggegate labor 
L = F*lvec';    
disp(['Aggregate labor = ', num2str(L)]);
disp(' ');

%% 3. Discretizing asset grid 
% Discretizing asset grid
agrid = linspace(B,bmax,Nb); 
apgrid = linspace(B,bmax,Nb);
    % Shouldn't we check if this constraint is stricter than natural one? 


%% 4. Solving for the Stationary Equilibrium
% Initial guess of aggregate capital
K = K0;

% Outer Block: Iteration over aggeragate capital ================================================================== 
    for t_outer = 1: 1000
        
    % (1) First Inner Block: Calculating prices and updating payoff matrix -----------------------------------------
        r = Z * alphaa * (K^(alphaa-1)) * (L^(1-alphaa));
        w = Z* (1-alphaa) * (K^alphaa) * (L^(-alphaa));
    
        % Creating utilgrid given prices (r,w)
        % Utilgrid(a,ap,z)
        utilgrid = zeros(Nb,Nb,nlsize);
        cons = zeros(Nb,Nb,nlsize);
    
        for a = 1: Nb
            for ap = 1: Nb
                for l = 1: nlsize
                    cons(a,ap,l) = (1+r)*agrid(a) + w*lvec(l) - apgrid(ap);
                    if cons(a,ap,l) <= 0
                        % Penalizing negative consumption
                        utilgrid(a,ap,l) = -1000;
                    else
                        utilgrid(a,ap,l) = log(cons(a,ap,l));
                    end
                end
            end
        end
    
    % (2) Second Inner Block: Value function iteration for policy function -----------------------------------------
        % Value function is V(a,z). Initializing;
        V = zeros(Nb, nlsize);
        V_new = zeros(Nb, nlsize);
        index = zeros(Nb, nlsize);
        
        % Iteration
        for i = 1:1000
            for a = 1:Nb
                for z = 1:nlsize
        
                [V_new(a,z),index(a,z)] = max(utilgrid(a,:,z) + betaa.* mtimes(P(z,:),V'));
                                                % 1 x 501             % 1 x 501                           
                error_inner = max(max(abs(V - V_new)))';
    
                end
            end
            
            % Display internal iteration counter 
            if mod(i,50) == 0
                disp(['Internal VFI iteration counter: ',num2str(i), ', with error size: ',num2str(error_inner)]);
            end
    
            if error_inner < tol_inner
                disp(['Value function Converged at iteration count = ',num2str(i)])
                break
            end
    
        V = V_new; 
        end
        
        % Policy functions
        apolicy = agrid(index);
        cpolicy = (1+r).*repmat(agrid',1,3) + w.*lvec - apolicy;
    
    % (3) Third Inner Block: Simulation and getting new aggregate capital ------------------------------------------
        
        % Creating simulated path of productivity starting from lmin
        lsim = zeros(T,1);
        lsim(1) = lvec(2);
    
        % Iteration for 2 to T  
        for i = 2:T
            dist = P(lsim(i-1),:);
            cum_dist = cumsum(dist);
            
            r = rand();
            
            lsim(i) = find(cum_dist > r, 1);
        end
        
        % Simulating asset and capital 
        asim = zeros(1,Nb);
        asim(1) = agrid(250);
        asim_index = 250;
        
        for t = 2:T
            asim(t) = apolicy(asim_index, lsim(t));
            asim_index = find(agrid==asim(t));
        end
            
        % Dropping first T/5 observation
        asim = asim(T/5:end);
        
        % Defining aggregate capital
        ksim = asim;
        K_new = mean(ksim);
        
    % (4) Fourth Inner Block: Checking convergence and updating ----------------------------------------------------
    
        K_update = psi*K_new + (1-psi)*K;
        error_outer = abs(K_update - K);
        if error_outer < tol_outer
            r = Z * alphaa * (K^(alphaa-1)) * (L^(1-alphaa));
            w = Z* (1-alphaa) * (K^alphaa) * (L^(-alphaa));
            disp('')
            disp('************************************************************************')
            disp(['Aggregate capital converged in outer loop count ', num2str(t_outer)]);
            disp('')
            disp(['Aggregate capital = ',num2str(K_update)])
            disp(['Equilibrium wage = ',num2str(w)])
            disp(['Equilibrium rental rate = ',num2str(r)])
            disp('************************************************************************')
            
            save modeloutcome K w r;
            break
        end
        
        % Updating capital 
        disp(' ')
        disp(['Outer loop iteration counter: ',num2str(t_outer),', with aggregate capital error: ',num2str(error_outer)]);
        disp(' ')
        K = K_update;
        
    end
    
% =================================================================================================================

%% 5. Plotting 
FigHandle = figure('Position', [150, 150, 1000, 800]); set(0,'defaultlinelinewidth',1.5);
currentwealth = (1+r).*repmat(agrid',1,3) + w.*lvec;

% Value function
lines = {'--b'; '-k'; '-r'};
subplot(2,2,1);
for z = 1:3
    plot(currentwealth(:,z), V(:,z), lines{z}); grid on; hold on;
end
legend('Lmin','Lmid','Lhigh','Location','southeast'); xlim([-0.5 2.5]); title('Value Function','FontSize',16);

% Policy function for consumption
lines = {'--b'; '-k'; '-r'};
subplot(2,2,2);
for z = 1:3
    plot(currentwealth(:,z), cpolicy(:,z), lines{z}); grid on; hold on;
end
legend('Lmin','Lmid','Lhigh','Location','southeast'); xlim([-0.5 2.5]); title('Consumption policy','FontSize',16);

% Ergodic Distribution of asset

% Ergodic Distribution of consumption
