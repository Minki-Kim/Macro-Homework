%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'Minki_dynare_5';
M_.dynare_version = '4.5.1';
oo_.dynare_version = '4.5.1';
options_.dynare_version = '4.5.1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Minki_dynare_5.log');
M_.exo_names = 'epsilon_z';
M_.exo_names_tex = 'epsilon\_z';
M_.exo_names_long = 'epsilon_z';
M_.exo_names = char(M_.exo_names, 'epsilon_nu');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsilon\_nu');
M_.exo_names_long = char(M_.exo_names_long, 'epsilon_nu');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'ynat');
M_.endo_names_tex = char(M_.endo_names_tex, 'ynat');
M_.endo_names_long = char(M_.endo_names_long, 'ynat');
M_.endo_names = char(M_.endo_names, 'ygap');
M_.endo_names_tex = char(M_.endo_names_tex, 'ygap');
M_.endo_names_long = char(M_.endo_names_long, 'ygap');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'nu');
M_.endo_names_tex = char(M_.endo_names_tex, 'nu');
M_.endo_names_long = char(M_.endo_names_long, 'nu');
M_.endo_partitions = struct();
M_.param_names = 'betaa';
M_.param_names_tex = 'betaa';
M_.param_names_long = 'betaa';
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'phi_pi');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pi');
M_.param_names_long = char(M_.param_names_long, 'phi_pi');
M_.param_names = char(M_.param_names, 'phi_y');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y');
M_.param_names_long = char(M_.param_names_long, 'phi_y');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'rho_nu');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_nu');
M_.param_names_long = char(M_.param_names_long, 'rho_nu');
M_.param_names = char(M_.param_names, 'sigma_epsilon_z');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_epsilon\_z');
M_.param_names_long = char(M_.param_names_long, 'sigma_epsilon_z');
M_.param_names = char(M_.param_names, 'sigma_epsilon_nu');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_epsilon\_nu');
M_.param_names_long = char(M_.param_names_long, 'sigma_epsilon_nu');
M_.param_names = char(M_.param_names, 'Theta');
M_.param_names_tex = char(M_.param_names_tex, 'Theta');
M_.param_names_long = char(M_.param_names_long, 'Theta');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'kappadot');
M_.param_names_tex = char(M_.param_names_tex, 'kappadot');
M_.param_names_long = char(M_.param_names_long, 'kappadot');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 9;
M_.param_nbr = 15;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('Minki_dynare_5_static');
erase_compiled_function('Minki_dynare_5_dynamic');
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 0 3 12;
 0 4 0;
 0 5 0;
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 13;
 1 10 0;
 2 11 0;]';
M_.nstatic = 5;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(15, 1);
M_.NNZDerivatives = [27; -1; -1];
M_.params( 1 ) = 0.98;
betaa = M_.params( 1 );
M_.params( 2 ) = 0.33;
alpha = M_.params( 2 );
M_.params( 3 ) = 1;
psi = M_.params( 3 );
M_.params( 6 ) = 0.75;
theta = M_.params( 6 );
M_.params( 4 ) = 3;
sigma = M_.params( 4 );
M_.params( 5 ) = 3.79;
eta = M_.params( 5 );
M_.params( 7 ) = 1.5;
phi_pi = M_.params( 7 );
M_.params( 8 ) = 1;
phi_y = M_.params( 8 );
M_.params( 9 ) = 0.9;
rho_z = M_.params( 9 );
M_.params( 10 ) = 0.9;
rho_nu = M_.params( 10 );
M_.params( 11 ) = 0.01;
sigma_epsilon_z = M_.params( 11 );
M_.params( 12 ) = 0.01;
sigma_epsilon_nu = M_.params( 12 );
M_.params( 13 ) = (1-M_.params(2))/(1-M_.params(2)+M_.params(2)*M_.params(4));
Theta = M_.params( 13 );
M_.params( 14 ) = (1-M_.params(6))*(1-M_.params(6)*M_.params(1))/M_.params(6)*M_.params(13);
kappa = M_.params( 14 );
M_.params( 15 ) = M_.params(14)*(M_.params(3)+(M_.params(2)+1/M_.params(5))/(1-M_.params(2)));
kappadot = M_.params( 15 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = 100*M_.params(12);
resid(1);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 40;
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
save('Minki_dynare_5_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Minki_dynare_5_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Minki_dynare_5_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Minki_dynare_5_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Minki_dynare_5_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('Minki_dynare_5_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('Minki_dynare_5_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
