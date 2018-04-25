global rhog

rhog = 0.9;

coef = fsolve(@model, [0, 0, 0, 0])

%% (b)
k_ts(1) = 0;
g_ts(1) = 1;
T = 40;

vCK = coef(1);
vCG = coef(2);
vKK = coef(3);
vKG = coef(4);

vLK = alpha/(1/eta+alpha)-vCK/(1/eta+alpha);
vLG = -vCG/(1/eta+alpha);

delta = 0.02;
eta = 10;
alpha = 1/3;
beta = 0.99;
YKss = (1/beta-1+delta)/alpha;
KYss = 1/YKss;
IYss = delta*KYss;
YIss = 1/IYss;
GYss = 0.2;
CYss = 1-IYss-GYss;
    
for t=1:T
    g_ts(t+1) = rhog*g_ts(t);
    k_ts(t+1) = vKK*k_ts(t)+vKG*g_ts(t);
    c_ts(t) = vCK*k_ts(t)+vCG*g_ts(t);
    l_ts(t) = vLK*k_ts(t)+vLG*g_ts(t);
    w_ts(t) = alpha*k_ts(t) - alpha*l_ts(t);
    r_ts(t) = (alpha-1)*k_ts(t) - (alpha-1)*l_ts(t);
    y_ts(t) = alpha*k_ts(t) +(1- alpha)*l_ts(t);
    i_ts(t) = y_ts(t) -CYss*c_ts(t)- GYss*g_ts(t);
end
figure()
subplot(3, 3, 1)
plot(0:T-1, c_ts)
title('consumption')
subplot(3, 3, 2)
plot(0:T-1, y_ts)
title('output')
subplot(3, 3, 3)
plot(0:T-1, i_ts)
title('investment')
subplot(3, 3, 4)
plot(0:T-1, r_ts)
title('interest rate')
subplot(3, 3, 5)
plot(0:T-1, r_ts)
title('wage')
subplot(3, 3, 6)
plot(0:T, k_ts)
title('capital stock')
subplot(3, 3, 7)
plot(0:T, g_ts)
title('government spending')
h = gcf();
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,'Q5_IRF.pdf','-dpdf','-r0')

%% (c)
figure()
y_lev = y_ts * 1/(0.2);
plot(y_lev)
title('output (deviation in dollar)')
h = gcf();
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,'Q5_level.pdf','-dpdf','-r0')

%% (d)
rhog = 1;

coef = fsolve(@model, coef)

vCK = coef(1);
vCG = coef(2);
vKK = coef(3);
vKG = coef(4);

vLK = alpha/(1/eta+alpha)-vCK/(1/eta+alpha);
vLG = -vCG/(1/eta+alpha);
    
delta = 0.02;
eta = 10;
alpha = 1/3;
beta = 0.99;
YKss = (1/beta-1+delta)/alpha;
KYss = 1/YKss;
IYss = delta*KYss;
YIss = 1/IYss;
GYss = 0.2;
CYss = 1-IYss-GYss;
    
for t=1:T
    g_ts(t+1) = rhog*g_ts(t);
    k_ts(t+1) = vKK*k_ts(t)+vKG*g_ts(t);
    c_ts(t) = vCK*k_ts(t)+vCG*g_ts(t);
    l_ts(t) = vLK*k_ts(t)+vLG*g_ts(t);
    w_ts(t) = alpha*k_ts(t) - alpha*l_ts(t);
    r_ts(t) = (alpha-1)*k_ts(t) - (alpha-1)*l_ts(t);
    y_ts(t) = alpha*k_ts(t) +(1- alpha)*l_ts(t);
    i_ts(t) = y_ts(t) -CYss*c_ts(t)- GYss*g_ts(t);
end
figure()
subplot(3, 3, 1)
plot(0:T-1, c_ts)
title('consumption')
subplot(3, 3, 2)
plot(0:T-1, y_ts)
title('output')
subplot(3, 3, 3)
plot(0:T-1, i_ts)
title('investment')
subplot(3, 3, 4)
plot(0:T-1, r_ts)
title('interest rate')
subplot(3, 3, 5)
plot(0:T-1, r_ts)
title('wage')
subplot(3, 3, 6)
plot(0:T, k_ts)
title('capital stock')
subplot(3, 3, 7)
plot(0:T, g_ts)
title('government spending')
h = gcf();
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,'Q5_IRFrho1.pdf','-dpdf','-r0')

% repeat (c)
figure()
y_lev = y_ts * 1/(0.2);

plot(y_lev)
title('output (deviation in dollar)')
h = gcf();
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(h,'Q5_levelrho1.pdf','-dpdf','-r0')


%% function
function gap = model(coef)
    global rhog
    delta = 0.02;
    eta = 10;
    alpha = 1/3;
    beta = 0.99;
    YKss = (1/beta-1+delta)/alpha;
    KYss = 1/YKss;
    IYss = delta*KYss;
    YIss = 1/IYss;
    GYss = 0.2;
    CYss = 1-IYss-GYss;
    
    vCK = coef(1);
    vCG = coef(2);
    vKK = coef(3);
    vKG = coef(4);
    
    vLK = alpha/(1/eta+alpha)-vCK/(1/eta+alpha);
    vLG = -vCG/(1/eta+alpha);
    vCpK = vCK*vKK;
    vCpG = vCK*vKG + vCG*rhog;
    vLpK = vLK*vKK;
    vLpG = vLK*vKG + vLG*rhog;
    
    fixed = alpha*YKss/(alpha*YKss+1-delta);
    % model starts from here
    gapk(1) = 1-delta+delta*YIss*(alpha+(1-alpha)*vLK-CYss*vCK)-vKK;
    gapk(2) = fixed*((alpha-1)*vKK+(1-alpha)*vLpK)-(vCpK-vCK);
    gapg(1) = delta*YIss*((1-alpha)*vLG-CYss*vCG-GYss)-vKG;
    gapg(2) = fixed*((alpha-1)*vKG+(1-alpha)*vLpG)-(vCpG - vCG);
    gap = [gapk; gapg];
end