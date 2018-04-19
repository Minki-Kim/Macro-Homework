function [residual, g1, g2, g3] = Minki_dynare_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(7, 1);
T26 = exp(y(2))^params(2);
T46 = exp(y(1))^params(4)*exp(x(it_, 1));
T58 = exp(y(7))*params(2)*exp(y(2))^(params(2)-1);
lhs =exp(y(10))/exp(y(3));
rhs =params(1)*(1+exp(y(11)));
residual(1)= lhs-rhs;
lhs =exp(y(4));
rhs =exp(y(7))*T26;
residual(2)= lhs-rhs;
lhs =exp(y(4));
rhs =exp(y(3))+exp(y(5));
residual(3)= lhs-rhs;
lhs =exp(y(8));
rhs =exp(y(5))+exp(y(2))*(1-params(3));
residual(4)= lhs-rhs;
lhs =exp(y(7));
rhs =T46;
residual(5)= lhs-rhs;
lhs =exp(y(6));
rhs =T26*(1-params(2));
residual(6)= lhs-rhs;
lhs =exp(y(9));
rhs =T58-params(3);
residual(7)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(7, 12);

  %
  % Jacobian matrix
  %

T74 = exp(y(2))*getPowerDeriv(exp(y(2)),params(2),1);
  g1(1,3)=(-(exp(y(10))*exp(y(3))))/(exp(y(3))*exp(y(3)));
  g1(1,10)=exp(y(10))/exp(y(3));
  g1(1,11)=(-(params(1)*exp(y(11))));
  g1(2,4)=exp(y(4));
  g1(2,7)=(-(exp(y(7))*T26));
  g1(2,2)=(-(exp(y(7))*T74));
  g1(3,3)=(-exp(y(3)));
  g1(3,4)=exp(y(4));
  g1(3,5)=(-exp(y(5)));
  g1(4,5)=(-exp(y(5)));
  g1(4,2)=(-(exp(y(2))*(1-params(3))));
  g1(4,8)=exp(y(8));
  g1(5,1)=(-(exp(x(it_, 1))*exp(y(1))*getPowerDeriv(exp(y(1)),params(4),1)));
  g1(5,7)=exp(y(7));
  g1(5,12)=(-T46);
  g1(6,6)=exp(y(6));
  g1(6,2)=(-((1-params(2))*T74));
  g1(7,7)=(-T58);
  g1(7,2)=(-(exp(y(7))*params(2)*exp(y(2))*getPowerDeriv(exp(y(2)),params(2)-1,1)));
  g1(7,9)=exp(y(9));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,144);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],7,1728);
end
end
end
end
