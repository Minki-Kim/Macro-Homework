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
psi = 0.1;
delta = 0;
K0 = 1.5;

nlsize = 3;
P = [.4 .5 .1; .2 .7 .1; .2 .1 .7];
epsilon = 0.25;
mu = 0.03;

tol_inner = 1e-6;
tol_outer = 1e-6;

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
disp(['Aggregate labor is = ', num2str(L)]);

%% 3. Discretizing asset grid 
% Discretizing asset grid
agrid = linspace(B,bmax,Nb); 
apgrid = linspace(B,bmax,Nb);
    % Shouldn't we check if this constraint is stricter than natural one? 


%% 4. Solving for the Stationary Equilibrium
% Initial guess of aggregate capital
K = K0;

% Outer Block: Iteration over aggeragate capital ================================================================== 
    for t = 1: 1000
        
    % (1) First Inner Block: Calculating prices and updating payoff matrix -----------------------------------------
        r = Z * alphaa * (K^(alphaa-1)) * (L^(1-alphaa));
        w = Z* (1-alphaa) * (K^alphaa) * (L^(-alphaa));
    
        % Creating utilgrid given prices (r,w)
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
        % Value function is V(a,z);
        V = zeros(Nb, nlsize);
        V_new = zeros(Nb, nlsize);
        ind = zeros(Nb, nlsize);
        
        % Iteration
        for i = 1:1000
            for a = 1:Nb
                for z = 1:nlsize
        
                [V_new(a,z),ind(a,z)] = ;
                error_inner = max(max(abs(V - V_new)))'
    
                end
            end
    
            if error_inner < tol_inner
                disp(['Converged at iteration count = ',num2str(i)])
                break
            end
    
        V = V_new; 
        end
    
    % (3) Third Inner Block: Simulation and getting new aggregate capital ------------------------------------------
        
        % Iteration for 2 to T  
        
        % Dropping first T/5 observation
    
    
    % (4) Fourth Inner Block: Checking convergence and updating ----------------------------------------------------
    
        K_update = psi*K_new + (1-psi)*K;
        error_outer = abs(K_update - K);
        if error < tol_outer
            disp(['Aggregate capital converged in outer loop count ', num2str(t)];
            break
        end
        
        % Updating capital 
        disp(['Outer loop iteration counting: ',num2str(t)]);
        K = K_update;
        
    end
    
% =================================================================================================================

%% 5. Plotting 


