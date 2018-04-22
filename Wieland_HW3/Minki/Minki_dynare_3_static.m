function [residual, g1, g2, g3] = Minki_dynare_3_static(y, x, params)
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

T23 = exp(y(6))^params(2);
T28 = exp(y(8))^(1-params(2));
T29 = exp(y(5))*T23*T28;
T50 = exp(y(8))^(-params(2));
T56 = exp(y(1))*exp(y(8))^(1/params(5));
T63 = exp(y(5))*params(2)*exp(y(6))^(params(2)-1);
lhs =1;
rhs =params(1)*(1+exp(y(7)));
residual(1)= lhs-rhs;
lhs =exp(y(2));
rhs =T29;
residual(2)= lhs-rhs;
lhs =exp(y(2));
rhs =exp(y(1))+exp(y(3));
residual(3)= lhs-rhs;
lhs =exp(y(6));
rhs =exp(y(3))+exp(y(6))*(1-params(3));
residual(4)= lhs-rhs;
lhs =exp(y(5));
rhs =exp(y(5))^params(4)*exp(x(1));
residual(5)= lhs-rhs;
lhs =exp(y(4));
rhs =T23*(1-params(2))*T50;
residual(6)= lhs-rhs;
lhs =T56;
rhs =exp(y(2))*(1-params(2))/exp(y(8));
residual(7)= lhs-rhs;
lhs =exp(y(7));
rhs =T63-params(3);
residual(8)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(8, 8);

  %
  % Jacobian matrix
  %

T76 = exp(y(6))*getPowerDeriv(exp(y(6)),params(2),1);
  g1(1,7)=(-(params(1)*exp(y(7))));
  g1(2,2)=exp(y(2));
  g1(2,5)=(-T29);
  g1(2,6)=(-(T28*exp(y(5))*T76));
  g1(2,8)=(-(exp(y(5))*T23*exp(y(8))*getPowerDeriv(exp(y(8)),1-params(2),1)));
  g1(3,1)=(-exp(y(1)));
  g1(3,2)=exp(y(2));
  g1(3,3)=(-exp(y(3)));
  g1(4,3)=(-exp(y(3)));
  g1(4,6)=exp(y(6))-exp(y(6))*(1-params(3));
  g1(5,5)=exp(y(5))-exp(x(1))*exp(y(5))*getPowerDeriv(exp(y(5)),params(4),1);
  g1(6,4)=exp(y(4));
  g1(6,6)=(-(T50*(1-params(2))*T76));
  g1(6,8)=(-(T23*(1-params(2))*exp(y(8))*getPowerDeriv(exp(y(8)),(-params(2)),1)));
  g1(7,1)=T56;
  g1(7,2)=(-(exp(y(2))*(1-params(2))/exp(y(8))));
  g1(7,8)=exp(y(1))*exp(y(8))*getPowerDeriv(exp(y(8)),1/params(5),1)-(-(exp(y(8))*exp(y(2))*(1-params(2))))/(exp(y(8))*exp(y(8)));
  g1(8,5)=(-T63);
  g1(8,6)=(-(exp(y(5))*params(2)*exp(y(6))*getPowerDeriv(exp(y(6)),params(2)-1,1)));
  g1(8,7)=exp(y(7));
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
