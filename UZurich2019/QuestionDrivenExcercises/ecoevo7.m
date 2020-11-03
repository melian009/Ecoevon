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
for s = 25;
                Zr = -1.5*s:1e-1:1.5*s;%Tuning s to change initial abundance and std
                mu = 0;
                ZrB = normpdf(Zr, mu, s);%Frequency each phenotype
                %----type help normpdf ------
                Zr = Zr + abs(min(Zr));%Move everything to positive trait values
                
%Plotting trait distribution---
%subplot(2,2,1)
%hr1 = plot(Zr,ZrB,'g',"markersize", 12);
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
%set(hr1,'LineWidth',4);
%title('Resource',"fontsize",10)
%xlabel('Trait resource species',"fontsize",14)
%ylabel('Frequency',"fontsize",14)
%set(gca,'fontsize',14);

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
%subplot(2,2,3)
%hold on
%hr2 = plot(Zc,ZrC,'r',"markersize", 12);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr2,'color',[a b c]);
%set(hr2,'LineWidth',4);
%title('Consumer',"fontsize",10)
%xlabel('Trait consumer species',"fontsize",14)
%ylabel('Frequency',"fontsize",14)
%set(gca,'fontsize',14);
end
%===================================================================================

%Fitness function for resources==================================================================
gamma = 5;%Strength of interaction between resource (trait value Zr) and consumer (trait value Zc)
for pB = 1:length(Zr);
WB(pB,2) = 1/(1 + exp(-gamma*(Zr(1,pB) - mean(Zc))^2));
WB(pB,1) = Zr(1,pB) - mean(Zc);
end
%subplot(2,2,2)
%hr1 = plot(WB(:,1),WB(:,2),'g',"markersize", 12);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
%set(hr1,'LineWidth',4);
%title('Resource',"fontsize",10)
%xlabel('Trait matching',"fontsize",14)
%ylabel('Fitness',"fontsize",14)
%set(gca,'fontsize',14);
%=================================================================================== 


%Fitness function for consumers==================================================================
gamma = 5;%Strength of interaction between resource (trait value Zr) and consumer (trait value Zc)
for pB = 1:length(Zr);
    WB(pB,2) = exp(-gamma*(Zr(1,pB) - mean(Zc))^2);
    WB(pB,1) = Zr(1,pB) - mean(Zc);
end
%subplot(2,2,4)
%hr1 = plot(WB(:,1),WB(:,2),'r',"markersize", 12);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
%set(hr1,'LineWidth',4);
%title('Consumer',"fontsize",10)
%xlabel('Trait matching',"fontsize",14)
%ylabel('Fitness',"fontsize",14)
%set(gca,'fontsize',14);
%===================================================================================  

%Print figure===================
%print -color -F:30 tdr.eps
%===============================

%=========W function of trait value ==================================
%resource: mean max fitness
neutral = 0;
for pB = 1:length(Zr);
WBN(pB,2) = 1/(1 + exp(-neutral*(Zr(1,pB) - mean(Zc))^2));
WBN(pB,1) = Zr(1,pB);
end

Zo = mean(WBN(:,1))
COVo = cov(WBN(:,1),WBN(:,2))

subplot(3,1,1)
hr1 = plot(WBN(:,1),WBN(:,2),'g',"markersize", 18);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',8);
%title('Resource',"fontsize",10)
xlabel('Trait value',"fontsize",18)
ylabel('Fitness',"fontsize",18)
set(gca,'fontsize',18);
%===================


%resource: mean max fitness
for pB = 1:length(Zr);
WB(pB,2) = 1/(1 + exp(-gamma*(Zr(1,pB) - mean(Zc))^2));
WB(pB,1) = Zr(1,pB);
end
%subplot(2,2,2)
%hr1 = plot(WB(:,1),WB(:,2),'g',"markersize", 12);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
%set(hr1,'LineWidth',4);
%title('Resource',"fontsize",10)
%xlabel('Trait value',"fontsize",14)
%ylabel('Fitness',"fontsize",14)
%set(gca,'fontsize',14);
%===================

%resource:  max trait value max fitness
%a = 2;
%for pB = 1:length(Zr);
%WB(pB,2) = a *(Zr(1,pB)) ;
%WB(pB,1) = Zr(1,pB);
%end
%subplot(2,2,3)
%hr1 = plot(WB(:,1),WB(:,2),'g',"markersize", 12);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
%set(hr1,'LineWidth',4);
%title('Resource',"fontsize",10)
%xlabel('Trait value',"fontsize",14)
%ylabel('Fitness',"fontsize",14)
%set(gca,'fontsize',14);
%===================

%resource:  max trait value max fitness
%a = 2;
%for pB = 1:length(Zr);
%WB(pB,2) = a*(max(Zr(1,:)) - (Zr(1,pB))) ;
%WB(pB,1) = Zr(1,pB);
%end
%subplot(2,2,4)
%hr1 = plot(WB(:,1),WB(:,2),'g',"markersize", 12);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
%set(hr1,'LineWidth',4);
%title('Resource',"fontsize",10)
%xlabel('Trait value',"fontsize",14)
%ylabel('Fitness',"fontsize",14)
%set(gca,'fontsize',14);
%axis([0 12 0.2 0.8])
%===================

%Sampling cov(w,z)=========================
%NEUTRAL
for i = 1:50000;
s = zeros(1,1);b = zeros(1,1);d = zeros(1,1);

s = size(WBN(:,1)); 
%Birth
b = unidrnd(s(1,1));
%Death
d = unidrnd(s(1,1));

%Offspring in d=====Phenotypic evolution
nua=0.0001;%rate phenotypic change
nub=-0.0001;%rate phenotypic change
%==============================

%Change in w values for the new phenotype
wua = 0.0001;%rate w change
wub = -0.0001;%rate w change
%==============================

WBN(d,1) = WBN(b,1) + (nua + (nub-nua).*rand(1,1));
WBN(d,2) = WBN(b,2) +  (wua + (wub-wua).*rand(1,1));
end 

%===============
Z = mean(WBN(:,1))
COV = cov(WBN(:,1),WBN(:,2))


subplot(3,1,2)
hr1 = plot(WBN(:,1),WBN(:,2),'g.',"markersize", 16);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',4);
%title('Resource',"fontsize",10)
xlabel('Trait value',"fontsize",14)
ylabel('Fitness',"fontsize",14)
set(gca,'fontsize',14);
axis([0 80 0.2 0.8])

subplot(3,1,3)
hist(WBN(:,1))
%=======================================







