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
M_.fname = 'Minki_dynare_3';
M_.dynare_version = '4.5.1';
oo_.dynare_version = '4.5.1';
options_.dynare_version = '4.5.1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Minki_dynare_3.log');
M_.exo_names = 'epsilon';
M_.exo_names_tex = 'epsilon';
M_.exo_names_long = 'epsilon';
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_partitions = struct();
M_.param_names = 'betaa';
M_.param_names_tex = 'betaa';
M_.param_names_long = 'betaa';
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, 'eta');
M_.param_names_long = char(M_.param_names_long, 'eta');
M_.param_names = char(M_.param_names, 'sigma_epsilon');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_epsilon');
M_.param_names_long = char(M_.param_names_long, 'sigma_epsilon');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 8;
M_.param_nbr = 6;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('Minki_dynare_3_static');
erase_compiled_function('Minki_dynare_3_dynamic');
M_.orig_eq_nbr = 8;
M_.eq_nbr = 8;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 0 3 11;
 0 4 0;
 0 5 0;
 0 6 0;
 1 7 0;
 2 8 0;
 0 9 12;
 0 10 0;]';
M_.nstatic = 4;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(6, 1);
M_.NNZDerivatives = [25; -1; -1];
M_.params( 2 ) = 0.33;
alpha = M_.params( 2 );
M_.params( 3 ) = 0.076;
delta = M_.params( 3 );
M_.params( 1 ) = 0.976;
betaa = M_.params( 1 );
k_y = 3.32;
M_.params( 4 ) = 0.95;
rho = M_.params( 4 );
M_.params( 6 ) = 1;
sigma_epsilon = M_.params( 6 );
M_.params( 5 ) = 0.5;
eta = M_.params( 5 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 6 ) = 3.401197381662155;
oo_.steady_state( 2 ) = 1.09861228866811;
oo_.steady_state( 3 ) = (-0.6931471805599453);
oo_.steady_state( 1 ) = 0.9162907318741551;
oo_.steady_state( 8 ) = 0.4054651081081644;
oo_.steady_state( 7 ) = 1/M_.params(1)-1;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(6);
steady;
options_.drop = 500;
options_.hp_filter = 1600;
options_.irf = 40;
options_.nograph = 1;
options_.order = 1;
options_.periods = 2000;
var_list_ = char();
info = stoch_simul(var_list_);
save('Minki_dynare_3_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Minki_dynare_3_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Minki_dynare_3_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Minki_dynare_3_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Minki_dynare_3_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('Minki_dynare_3_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('Minki_dynare_3_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
