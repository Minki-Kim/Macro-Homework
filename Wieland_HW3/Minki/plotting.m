clear;

load eta1;
load eta2;
load eta5;

FigHandle = figure('Position', [250, 300, 1000, 300]); set(0,'defaultlinelinewidth',2);
subplot(1,3,1); plot(eta5.irfs.y_epsilon, '-r'); hold on; plot(eta1.irfs.y_epsilon, '-b'); hold on; plot(eta2.irfs.y_epsilon, '-k'); title('Output','FontSize',20); legend({'\eta=0.5','\eta=1','\eta=2'},'FontSize',15);
subplot(1,3,2); plot(eta5.irfs.c_epsilon, '-r'); hold on; plot(eta1.irfs.c_epsilon, '-b'); hold on; plot(eta2.irfs.c_epsilon, '-k'); title('Consumption','FontSize',20); legend({'\eta=0.5','\eta=1','\eta=2'},'FontSize',15);
subplot(1,3,3); plot(eta5.irfs.l_epsilon, '-r'); hold on; plot(eta1.irfs.l_epsilon, '-b'); hold on; plot(eta2.irfs.l_epsilon, '-k'); title('Hours worked','FontSize',20); legend({'\eta=0.5','\eta=1','\eta=2'},'FontSize',15);

Variables = {'Output';'Consumption';'Hours worked'};
eta_5 = [sqrt(eta5.var(2,2)); sqrt(eta5.var(1,1)); sqrt(eta5.var(8,8))];
eta_1 = [sqrt(eta1.var(2,2)); sqrt(eta1.var(1,1)); sqrt(eta1.var(8,8))];
eta_2 = [sqrt(eta2.var(2,2)); sqrt(eta2.var(1,1)); sqrt(eta2.var(8,8))];

T = table(Variables, eta_5, eta_1, eta_2);
disp(T);