
%===================================================
%U Zurich BIO 365 Ecological Networks
%14 March -- 4 April, 2019
%@Jordi Bascompte
%---------------------------------
%Eco-evolutionary networks
%@Carlos Melian

%=================GOAL=================================================================================
%Illustation initial trait and fitness distributions for one resource and one consumer
%Concepts: Matching trait -- Interaction strength -- Frequency-dependent selection -- Neutral selection
%======================================================================================================

%Initial trait distribution
for s = 0.5;
mu = 0;%mean 
r1 = -6*s:1e-1:6*s;  
yr1 = normpdf(r1, mu, s);
r1 = r1 + abs(min(r1));% Move everything to the right.
hr1 = plot(r1,yr1,'r',"markersize", 14);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
%set(hr1,'LineWidth',4);
%set(gca,'fontsize',14);
end

for s = 1;
p1 = -3*s:1e-1:3*s;
yp1 = normpdf(p1, mu, s);
p1 = p1 + abs(min(p1));% Move everything to the right.
end

%2. Compute W each phenotype
for gamma = 1:5;
  Wr = zeros(length(r1));
for i = 1:length(r1); 
     r1(1,i);
     mean(r1);
     Wr(i,2) = abs(1/(1 + e^gamma*(r1(1,i) - mean(r1))^2));
     %Wr(i,2) = abs(e^gamma*((r1(1,i) - mean(r1)))^2);
     Wr(i,1) = abs(r1(1,i) - mean(r1));
end
hold on
ax = plotyy (p1, yp1, Wr(:,1), Wr(:,2));
xlabel('Trait Value/W decay with distance to mean','fontsize', 16)
ylabel(ax(2),'Frequency','fontsize', 16)
ylabel(ax(1),'W','fontsize', 16)
%set(hr1,'LineWidth',4);
%set(gca,'fontsize',14);
end
