cd '/Users/minki/Dropbox/Git repositories/Macro-Homework/Wieland_HW4/Minki'

% Romer 6.10
% when phi < 1
f = [0:0.1:1]';
K = 1;
phi = 0.5;
m = 5;
incen = zeros(1,length(f));

for i = 1:length(f)
    incen(i) = ( (phi*m) / (1 - f(i) + f(i)*phi) )^2;
end

% when phi > 1
phi = 1.5;
incen2 = zeros(1,length(f));

for i = 1:length(f)
    incen2(i) = ( (phi*m) / (1 - f(i) + f(i)*phi) )^2;
end

FigHandle = figure('Position', [250, 300, 700, 350]); set(0,'defaultlinelinewidth',2);
subplot(1,2,1); plot(f,incen); xlabel('Fraction'); ylabel('Incentive'); title('Incentive when \phi = 0.5','FontSize',15); 
subplot(1,2,2); plot(f,incen2); xlabel('Fraction'); ylabel('Incentive'); title('Incentive when \phi = 1.5','FontSize',15); 