function [residual, g1, g2, g3] = Abraham_210C_HW3_static(y, x, params)
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

residual = zeros( 8, 1);

%
% Model equations
%

T21 = exp(y(6))*exp(y(4))^(1/params(4));
T33 = exp(y(5))*exp(y(3))^params(1);
T35 = exp(y(4))^(1-params(1));
lhs =1;
rhs =params(2)*(1+exp(y(8)));
residual(1)= lhs-rhs;
lhs =T21;
rhs =exp(y(7));
residual(2)= lhs-rhs;
lhs =exp(y(1));
rhs =T33*T35;
residual(3)= lhs-rhs;
lhs =exp(y(1));
rhs =exp(y(6))+exp(y(2));
residual(4)= lhs-rhs;
lhs =exp(y(3));
rhs =exp(y(2))+exp(y(3))*(1-params(3));
residual(5)= lhs-rhs;
lhs =exp(y(5));
rhs =exp(y(5))^params(5)*exp(x(1));
residual(6)= lhs-rhs;
lhs =exp(y(7));
rhs =(1-params(1))*exp(y(1))/exp(y(4));
residual(7)= lhs-rhs;
lhs =exp(y(8));
rhs =params(1)*exp(y(1))/exp(y(3))-params(3);
residual(8)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(8, 8);

  %
  % Jacobian matrix
  %

  g1(1,8)=(-(params(2)*exp(y(8))));
  g1(2,4)=exp(y(6))*exp(y(4))*getPowerDeriv(exp(y(4)),1/params(4),1);
  g1(2,6)=T21;
  g1(2,7)=(-exp(y(7)));
  g1(3,1)=exp(y(1));
  g1(3,3)=(-(T35*exp(y(5))*exp(y(3))*getPowerDeriv(exp(y(3)),params(1),1)));
  g1(3,4)=(-(T33*exp(y(4))*getPowerDeriv(exp(y(4)),1-params(1),1)));
  g1(3,5)=(-(T33*T35));
  g1(4,1)=exp(y(1));
  g1(4,2)=(-exp(y(2)));
  g1(4,6)=(-exp(y(6)));
  g1(5,2)=(-exp(y(2)));
  g1(5,3)=exp(y(3))-exp(y(3))*(1-params(3));
  g1(6,5)=exp(y(5))-exp(x(1))*exp(y(5))*getPowerDeriv(exp(y(5)),params(5),1);
  g1(7,1)=(-((1-params(1))*exp(y(1))/exp(y(4))));
  g1(7,4)=(-((1-params(1))*(-(exp(y(4))*exp(y(1))))/(exp(y(4))*exp(y(4)))));
  g1(7,7)=exp(y(7));
  g1(8,1)=(-(params(1)*exp(y(1))/exp(y(3))));
  g1(8,3)=(-(params(1)*(-(exp(y(1))*exp(y(3))))/(exp(y(3))*exp(y(3)))));
  g1(8,8)=exp(y(8));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,64);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,512);
end
end
end
end
