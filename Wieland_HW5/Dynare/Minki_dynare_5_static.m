function [residual, g1, g2, g3] = Minki_dynare_5_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 9, 1);

%
% Model equations
%

T50 = (1+1/params(5))/(params(2)+1/params(5)+params(3)*(1-params(2)));
lhs =y(3);
rhs =y(1);
residual(1)= lhs-rhs;
lhs =y(1);
rhs =y(1)-1/params(3)*(y(6)-y(7));
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(8)+(1-params(2))*y(2);
residual(3)= lhs-rhs;
lhs =y(6);
rhs =y(7)*params(7)+params(8)*y(5)+y(9);
residual(4)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(1)+y(5)*params(15);
residual(5)= lhs-rhs;
lhs =y(5);
rhs =y(3)-y(4);
residual(6)= lhs-rhs;
lhs =y(4);
rhs =y(8)*T50;
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(9)+x(1);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =y(9)*params(10)+x(2);
residual(9)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(9, 9);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-1);
  g1(1,3)=1;
  g1(2,6)=1/params(3);
  g1(2,7)=(-(1/params(3)));
  g1(3,2)=(-(1-params(2)));
  g1(3,3)=1;
  g1(3,8)=(-1);
  g1(4,5)=(-params(8));
  g1(4,6)=1;
  g1(4,7)=(-params(7));
  g1(4,9)=(-1);
  g1(5,5)=(-params(15));
  g1(5,7)=1-params(1);
  g1(6,3)=(-1);
  g1(6,4)=1;
  g1(6,5)=1;
  g1(7,4)=1;
  g1(7,8)=(-T50);
  g1(8,8)=1-params(9);
  g1(9,9)=1-params(10);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,81);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,729);
end
end
end
end
