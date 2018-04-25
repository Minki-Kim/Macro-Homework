function [residual, g1, g2, g3] = Abraham_210C_HW3_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(8, 1);
T24 = exp(y(8))*exp(y(6))^(1/params(4));
T36 = exp(y(7))*exp(y(1))^params(1);
T38 = exp(y(6))^(1-params(1));
T58 = exp(y(2))^params(5)*exp(x(it_, 1));
lhs =exp(y(11))/exp(y(8));
rhs =params(2)*(1+exp(y(12)));
residual(1)= lhs-rhs;
lhs =T24;
rhs =exp(y(9));
residual(2)= lhs-rhs;
lhs =exp(y(3));
rhs =T36*T38;
residual(3)= lhs-rhs;
lhs =exp(y(3));
rhs =exp(y(8))+exp(y(4));
residual(4)= lhs-rhs;
lhs =exp(y(5));
rhs =exp(y(4))+exp(y(1))*(1-params(3));
residual(5)= lhs-rhs;
lhs =exp(y(7));
rhs =T58;
residual(6)= lhs-rhs;
lhs =exp(y(9));
rhs =(1-params(1))*exp(y(3))/exp(y(6));
residual(7)= lhs-rhs;
lhs =exp(y(10));
rhs =params(1)*exp(y(3))/exp(y(1))-params(3);
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 13);

  %
  % Jacobian matrix
  %

  g1(1,8)=(-(exp(y(11))*exp(y(8))))/(exp(y(8))*exp(y(8)));
  g1(1,11)=exp(y(11))/exp(y(8));
  g1(1,12)=(-(params(2)*exp(y(12))));
  g1(2,6)=exp(y(8))*exp(y(6))*getPowerDeriv(exp(y(6)),1/params(4),1);
  g1(2,8)=T24;
  g1(2,9)=(-exp(y(9)));
  g1(3,3)=exp(y(3));
  g1(3,1)=(-(T38*exp(y(7))*exp(y(1))*getPowerDeriv(exp(y(1)),params(1),1)));
  g1(3,6)=(-(T36*exp(y(6))*getPowerDeriv(exp(y(6)),1-params(1),1)));
  g1(3,7)=(-(T36*T38));
  g1(4,3)=exp(y(3));
  g1(4,4)=(-exp(y(4)));
  g1(4,8)=(-exp(y(8)));
  g1(5,4)=(-exp(y(4)));
  g1(5,1)=(-(exp(y(1))*(1-params(3))));
  g1(5,5)=exp(y(5));
  g1(6,2)=(-(exp(x(it_, 1))*exp(y(2))*getPowerDeriv(exp(y(2)),params(5),1)));
  g1(6,7)=exp(y(7));
  g1(6,13)=(-T58);
  g1(7,3)=(-((1-params(1))*exp(y(3))/exp(y(6))));
  g1(7,6)=(-((1-params(1))*(-(exp(y(6))*exp(y(3))))/(exp(y(6))*exp(y(6)))));
  g1(7,9)=exp(y(9));
  g1(8,3)=(-(params(1)*exp(y(3))/exp(y(1))));
  g1(8,1)=(-(params(1)*(-(exp(y(3))*exp(y(1))))/(exp(y(1))*exp(y(1)))));
  g1(8,10)=exp(y(10));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,169);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,2197);
end
end
end
end
