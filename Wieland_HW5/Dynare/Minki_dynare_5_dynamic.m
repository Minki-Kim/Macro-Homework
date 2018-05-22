function [residual, g1, g2, g3] = Minki_dynare_5_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(10, 1);
T52 = (1+1/params(5))/(params(2)+1/params(5)+params(3)*(1-params(2)));
lhs =y(5);
rhs =y(3);
residual(1)= lhs-rhs;
lhs =y(3);
rhs =y(13)-1/params(3)*(y(8)-y(14));
residual(2)= lhs-rhs;
lhs =y(5);
rhs =y(10)+(1-params(2))*y(4);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =params(7)*y(9)+params(8)*y(7)+y(11);
residual(4)= lhs-rhs;
lhs =y(9);
rhs =y(14)*params(1)+y(7)*params(15);
residual(5)= lhs-rhs;
lhs =y(7);
rhs =y(5)-y(6);
residual(6)= lhs-rhs;
lhs =y(6);
rhs =y(10)*T52;
residual(7)= lhs-rhs;
lhs =y(10);
rhs =params(9)*y(1)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(11);
rhs =params(10)*y(2)+x(it_, 2);
residual(9)= lhs-rhs;
lhs =y(12);
rhs =y(8)-y(14);
residual(10)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(10, 16);

  %
  % Jacobian matrix
  %

  g1(1,3)=(-1);
  g1(1,5)=1;
  g1(2,3)=1;
  g1(2,13)=(-1);
  g1(2,8)=1/params(3);
  g1(2,14)=(-(1/params(3)));
  g1(3,4)=(-(1-params(2)));
  g1(3,5)=1;
  g1(3,10)=(-1);
  g1(4,7)=(-params(8));
  g1(4,8)=1;
  g1(4,9)=(-params(7));
  g1(4,11)=(-1);
  g1(5,7)=(-params(15));
  g1(5,9)=1;
  g1(5,14)=(-params(1));
  g1(6,5)=(-1);
  g1(6,6)=1;
  g1(6,7)=1;
  g1(7,6)=1;
  g1(7,10)=(-T52);
  g1(8,1)=(-params(9));
  g1(8,10)=1;
  g1(8,15)=(-1);
  g1(9,2)=(-params(10));
  g1(9,11)=1;
  g1(9,16)=(-1);
  g1(10,8)=(-1);
  g1(10,14)=1;
  g1(10,12)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,256);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,4096);
end
end
end
end
