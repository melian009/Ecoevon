%===================================================
%U Zurich BIO 365 Ecological Networks
%14 March -- 4 April, 2019
%@Jordi Bascompte
%---------------------------------
%Eco-evolutionary networks
%@Carlos Melian

%=================GOAL=================================================================================
%Illustation dynamic mean trait distribution
%Concepts: Matching trait -- Interaction strength -- Stabilizing selection -- Neutral selection
%======================================================================================================

%Initial trait distributions RC =========================================
for s = 0.5;%Extend n-species:0.5:20;
mu = 0;%mean
r1 = -6*s:1e-1:6*s;  
yr1 = normpdf(r1, mu, s);
r1 = r1 + abs(min(r1));% Move everything to the right.
hr1 = plot(r1,yr1);%Visualize
a =unifrnd(0,1);
b =unifrnd(0,1);
c =unifrnd(0,1);
set(hr1,'color',[a b c]);
end

for s = 1;%Extend n-species:0.5:2;
p1 = -3*s:1e-1:3*s;  %smaller 5e-1
yp1 = normpdf(p1, mu, s);
p1 = p1 + abs(min(p1));% Move everything to the right.
end

%Compute W each phenotype===========================================
h = 0.8;%heritability
gamma = 5;%intensity selection

%Mean field scenario---------------------
NG = 30;%Number of generations
phi = 0.25;%strength selection
for t = 1:NG;
  hold off
    for i = 1:length(r1); 
        Wr = abs(1/(1 + e^gamma*(r1(t,i) - mean(r1(t,:)))^2));
        r1(t+1,i) = r1(t,i) + phi*(mean(r1(t,:)) - r1(t,i));% + randn(1)
        yr1(t+1,i) = yr1(t,i)*Wr+unifrnd(0.01,0.1);   
    end
hr1 = plot(r1(t,:),yr1(t,:));%Visualize
a =unifrnd(0,1);
b =unifrnd(0,1);
c =unifrnd(0,1);
set(hr1,'color',[a b c]);
set(hr1,'LineWidth',4);
%title('Resource',"fontsize",10)
xlabel('Trait',"fontsize",14)
ylabel('Frequency',"fontsize",14)
set(gca,'fontsize',14);

    for i = 1:length(p1); 
        Wp = abs(1/(1 + e^gamma*(p1(t,i) - mean(p1(t,:)))^2));
        p1(t+1,i) = p1(t,i) + phi*(mean(p1(t,:)) - p1(t,i));% + randn(1)
        yp1(t+1,i) = yp1(t,i)*Wp+unifrnd(0.1,0.5);
    end
hold on
hp2 = plot(p1(t,:),yp1(t,:));%Visualize
a =unifrnd(0,1);
b =unifrnd(0,1);
c =unifrnd(0,1);
set(hp2,'color',[a b c]);
set(hp2,'LineWidth',4);
pause (.05)
end