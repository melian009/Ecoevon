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

%Trait distribution resource========================================================
for s = 4;
                Zr = -1.5*s:1e-1:1.5*s;%Tuning s to change initial abundance and std
                mu = 0;
                ZrB = normpdf(Zr, mu, s);%Frequency each phenotype
                %----type help normpdf ------
                Zr = Zr + abs(min(Zr));%Move everything to positive trait values
                
%Plotting trait distribution---
subplot(2,2,1)
hr1 = plot(Zr,ZrB,'g',"markersize", 12);
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',4);
%title('Resource',"fontsize",10)
xlabel('Trait resource species',"fontsize",14)
ylabel('Frequency',"fontsize",14)
set(gca,'fontsize',14);

end
%===================================================================================

%Trait distribution consumer========================================================
for s = 4;
                Zc = -1.5*s:1e-1:1.5*s;%Tuning s to change initial abundance and std
                ZrC = normpdf(Zc, mu, s);%Frequency each phenotype
                %----type help normpdf ------
                Zc = Zc + abs(min(Zc));%Move everything to the right to positive trait values
                %SCB = repmat(Zc, [10,1,10]);
                
%Plotting trait distributions---
subplot(2,2,3)
hold on
hr2 = plot(Zc,ZrC,'r',"markersize", 12);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr2,'color',[a b c]);
set(hr2,'LineWidth',4);
%title('Consumer',"fontsize",10)
xlabel('Trait consumer species',"fontsize",14)
ylabel('Frequency',"fontsize",14)
set(gca,'fontsize',14);
end
%===================================================================================

%Fitness function for resources==================================================================
gamma = 5;%Strength of interaction between resource (trait value Zr) and consumer (trait value Zc)
for pB = 1:length(Zr);
WB(pB,2) = 1/(1 + exp(-gamma*(Zr(1,pB) - mean(Zc))^2));
WB(pB,1) = Zr(1,pB) - mean(Zc);
end
subplot(2,2,2)
hr1 = plot(WB(:,1),WB(:,2),'g',"markersize", 12);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',4);
%title('Resource',"fontsize",10)
xlabel('Trait matching',"fontsize",14)
ylabel('Fitness',"fontsize",14)
set(gca,'fontsize',14);
%=================================================================================== 


%Fitness function for consumers==================================================================
gamma = 5;%Strength of interaction between resource (trait value Zr) and consumer (trait value Zc)
for pB = 1:length(Zr);
    WB(pB,2) = exp(-gamma*(Zr(1,pB) - mean(Zc))^2);
    WB(pB,1) = Zr(1,pB) - mean(Zc);
end
subplot(2,2,4)
hr1 = plot(WB(:,1),WB(:,2),'r',"markersize", 12);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',4);
%title('Consumer',"fontsize",10)
xlabel('Trait matching',"fontsize",14)
ylabel('Fitness',"fontsize",14)
set(gca,'fontsize',14);
%===================================================================================  

%Print figure===================
%print -color -F:30 tdr.eps
%===============================
