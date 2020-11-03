#----------------------------------------------------------------------
#This is a basic example to plot rarefied curves from biodiversity data
#Following 
#Sanders, Howard L. "Marine Benthic Diversity: A Comparative Study". (1968). 
#The American Naturalist. 102 (925): 243. doi:10.1086/282541
#CJ Melian, OCT 2020
#----------------------------------------------------------------------

%------------------------------------------------------ 
%Baldo & Melian, JULY 2020, Horw, CH


%Hill Numbers based on 

%Gotelli, N. J., Hsieh, T. C., Sander, E. L., & Colwell, R. K. (2014). Rarefaction and Extrapolation with Hill Numbers: A Framework for Sampling and Estimation in Species Diversity Studies The Harvard community has made this article openly available. Ecological Monographs, 84(1), 45–67. https://doi.org/10.1890/13-0133.1
%------------------------------------------------------

pkg load statistics
pkg load dataframe
pkg load symbolic

%DATA ---------------------
fid = fopen('Matrix complete_2020.csv');
in = fscanf(fid,'%c');
fclose(fid);
linesR = regexp(in,'(^,|)([^\n]+)', 'match');
All = char(linesR);
Forest = cell(length(All),1);
wR = unique_no_sort(linesR);

%1. Print raw data ----------------------------
R = char(wR);
%pause
%----------------------------

#categorize forest type
for k = 1:length(All);
    wHF = regexp(All(k,:),',');
    Forest(k,1) = All(k,1:wHF(1,1)-1);
end


%2. List sampled sites ----------------------------------------------
wF = unique_no_sort(Forest)
%pause
%----------------------------------------------

for n = 2:length(wF); 
TypeOutput = zeros(length(R),4);
Type = zeros(1,1);
ForestType = zeros(1,1);
xR = zeros(1,1);
wHR1 = zeros(1,1);

wF(1,n);
    cR = cellstr(wF(1,n));
    xR = regexpcell(linesR,cR);
    ForestType = cell(length(xR),1);
    
    for j = 1:length(xR);
        wHR1 = regexp(All(xR(1,j),:),',');
        ForestType(j,1) = All(xR(1,j),wHR1(1,2)+1:wHR1(1,3)-1);
        
    
        %cH = cellstr(ForestType)
        %xH = regexpcell(wF,cH)
        %ForestOutput(j,1) = xH 
         %pause
    
    end
    
%.3 Size each site -------------------------------------------
wF(1,n)
%Type = unique(ForestType)
N = length(ForestType)
wFcom(1,n) = N;
%pause
%----------------------------------------------    
    
%end  

%4. Rarefaction: 
%A. Pick up more-sampled site
%B. Obtain n-subsamplings of size of less-sampled site
%C. Compare curves along subsamplings of different sizes



%A. More sampled site  
%wFcom = wFcom(wFcom~=0);
%MIN = min(wFcom);%365
MIN=365;
%pause

%B. Obtain n subsamplings
%R = 10;
%for rep = 1:R
    %more-sampled site
    
    
    %less-sampled site



%end

%C. Compare curves

%for m = 1:length(wFcom);
%N = zeros(1,1);
Type = unique(ForestType);
%N = length(ForestType)
UNI = length(Type)
    
red=unifrnd(0,1); green=unifrnd(0,1); blue=unifrnd(0,1);
clf;
labels = {};
colororder = get (gca, "colororder");  
  
R=10;
for rep = 1:R; 
      U = zeros(1,2);
      for r = 1:MIN;
          S = unidrnd(length(xR),r,1)';%R replicates
          L = unique(ForestType(S(1,1:r)));
          U(r,1) = r;
          U(r,2) = length(L);  
      end
      hold on
      h = plot(U(:,1),U(:,2),'k','color',[red green blue],'Markersize',36)
end%rep 
 hold on;
 set (h, "color", colororder(n,:));
 labels = {labels{:}, ["Signal ", num2str(n)]};

%pause   

   %if r == MIN;%N
   %U(:,2) = UNI;
   %plot(U(:,1),U(:,2),'k-','color',[red green blue],'Markersize',42)
   %end
   %pause   
end

set(gca,'FontSize',20)
xlabel('Number Individuals Sampled ','fontsize',22)
ylabel('Species Number','fontsize',22)
legend (labels, "location", "southoutside");
%h = legend ({"Difundito"}, "La Paja", "Cinco cerros", "Barrosa", "Amarante", "Difuntos", "La Chata", "Piedra Alta", "Vigilancia", "Volcan", "La Brava", "El Morro");
%legend (h, "location", "northeastoutside");
%set (h, "fontsize", 20);





