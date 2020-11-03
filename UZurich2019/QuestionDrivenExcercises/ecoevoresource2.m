%===================================================
%U Zurich BIO 365 Ecological Networks
%14 March -- 4 April, 2019
%@Jordi Bascompte
%---------------------------------
%Eco-evolutionary networks
%@Carlos Melian
%===================================================

%=================GOAL=======================================================================================
%Illustation initial trait and fitness distributions for one resource and one consumer with three traits each
%Concepts: Matching trait -- Interaction strength -- Frequency-dependent selection -- Neutral selection
%============================================================================================================

%=============================RESOURCE==========================================
%ABIOTIC trait distribution============================================
Zm = 50;%Zm is the mean abiotic trait value
sigma = 10;
Zra = (Zm -  1*sigma) : (sigma / 100) : (Zm + 1*sigma); %n=1 change initial abundance
SRA = repmat(Zra, [10,1,10]);
pdfNormal = normpdf(Zra, Zm, sigma);

%Plot-----------------------------
subplot(3,2,1)
hr1 = plot(Zra, pdfNormal,'r',"markersize", 6);
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',2);
xlabel('Abiotic trait R species',"fontsize",12)
ylabel('Frequency',"fontsize",12)
set(gca,'fontsize',8);
%----------------------------------------
        
%Fitness function------------------------------------------------------------
gamma = 4;
munew = mean(SRA(1,:,1));
for pA = 1:length(Zra);
WA(pA,2) = exp(-gamma*(Zra(1,pA) - munew)^2);
WA(pA,1) = Zra(1,pA) - munew;
end
subplot(3,2,2)
hold on
hr1 = plot(WA(:,1),WA(:,2),'r',"markersize", 1);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',2);
xlabel('Trait matching',"fontsize",12)
ylabel('Fitness',"fontsize",12)
set(gca,'fontsize',8);
%===============================================================================

%DISPERSAL trait distribution=================================================
%SpatialMatrix;%
  L=1000; % size of the landscape
  P = 10;%number of sites 
  n = unifrnd(0,L,P,2);%positions of sites RGG
  Pd = zeros(P,P);
  Pdmean = zeros(P,P);
  for i = 1:P,
      for j = i+1:P,
          dx2 = (n(i,1) - n(j,1))^2;%Euclidean distance
          dy2 = (n(i,2) - n(j,2))^2;
          d(i,j) = sqrt(dx2 + dy2);%distance matrix
          Pd(i,j) = 1/d(i,j);%the lower the distance the higher the probability
          Pdmean(i,j) = d(i,j);%the lower the distance the higher the probability
      end
  end 
  Pd(P,P) = 0;
  Pdmean=Pdmean+Pdmean';
  D = nonzeros(triu(Pdmean,1));
  D = mean(D);%Optimum dispersal value

%Extract distribution from landscape values=====================================
mu = D; 
sigma = 2; 
Zi = (mu -  1*sigma) : (sigma / 100) : (mu + 1*sigma); 
pdfNormal = normpdf(Zi, mu, sigma);
%plot(x, pdfNormal/max(pdfNormal));
SRD = repmat(Zi, [10,1,10]);
%===============================================================================

subplot(3,2,3)       
hr1 = plot(Zi,pdfNormal,'b',"markersize", 6);%Visualize
%hr1 = plot(Zi, pdfNormal/max(pdfNormal)); 
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',2);
xlabel('Migration trait R species',"fontsize",12)
ylabel('Frequency',"fontsize",12)
set(gca,'fontsize',8);
    
%Fitness function--------------------------------------------------------------    
for pD = 1:length(Zi);
WD(pD,2) = exp(-gamma*(Zi(1,pD) - D)^2);
WD(pD,1) = Zi(1,pD) - D;
end
subplot(3,2,4)
hold on
hr1 = plot(WD(:,1),WD(:,2),'b',"markersize", 6);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',2);
xlabel('Trait matching',"fontsize",12)
ylabel('Fitness',"fontsize",12)
set(gca,'fontsize',8);
%===============================================================================
  
%BIOTIC trait distribution======================================================
%Resource
Zmr = 2;%Mean biotic trait of resource species
ro = 1;
sigma = 12;
Zrb = (Zmr -  ro*sigma) : (sigma / 100) : (Zmr + ro*sigma); 
pdfNormal = normpdf(Zrb, Zmr, sigma);

%Consumer
Zmc = 4;%Mean biotic trait of resource species
sigma = 1;
Zcb = (Zmc -  ro*sigma) : (sigma / 100) : (Zmc + ro*sigma); 
pdfNormal = normpdf(Zcb, Zmc, sigma);

%fitness function resource------------------------------------------------------
for pB = 1:length(Zrb);
WB(pB,2) = 1/(1 + exp(-gamma*(Zrb(1,pB) - mean(Zcb))^2));
WB(pB,1) = Zrb(1,pB) - mean(Zcb);
end

subplot(3,2,5)
hr1 = plot(Zrb, pdfNormal/max(pdfNormal),'k',"markersize", 6); 
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',2);
xlabel('Biotic trait R species',"fontsize",12)
ylabel('Frequency',"fontsize",12)
set(gca,'fontsize',8);

subplot(3,2,6)
hold on
hr1 = plot(WB(:,1),WB(:,2),'k',"markersize", 2);%Visualize
%a =unifrnd(0,1);
%b =unifrnd(0,1);
%c =unifrnd(0,1);
%set(hr1,'color',[a b c]);
set(hr1,'LineWidth',2);
xlabel('Trait matching',"fontsize",12)
ylabel('Fitness',"fontsize",12)
set(gca,'fontsize',8);

