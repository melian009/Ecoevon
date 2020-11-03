%------------------------------------------------------ 
%Baldo & Melian, JULY 2020, Horw, CH


%Hill Numbers based on 

%Gotelli, N. J., Hsieh, T. C., Sander, E. L., & Colwell, R. K. (2014). Rarefaction and Extrapolation with Hill Numbers: A Framework for Sampling and Estimation in Species Diversity Studies The Harvard community has made this article openly available. Ecological Monographs, 84(1), 45–67. https://doi.org/10.1890/13-0133.1
%------------------------------------------------------

pkg load statistics
pkg load dataframe
pkg load symbolic

%DATA ---------------------

%https://stackoverflow.com/questions/28407344/reading-text-number-mixed-csv-files-as-tables-in-octave
%data = dataframe ('Matrix complete_2020.csv');
%Data size
%SR = sum(data(:,4));%N flowers plants
%SR = size(data);SR = SR(1,1);%N plants
%SIE = (data(:, 'Sierra'));

fid = fopen('Matrix complete_2020.csv');
in = fscanf(fid,'%c');
fclose(fid);
linesR = regexp(in,'(^,|)([^\n]+)', 'match');
All = char(linesR);
Forest = cell(length(All),1);
wR = unique_no_sort(linesR);
R = char(wR);

#categorize forest type
for k = 1:length(All);
    wHF = regexp(All(k,:),',');
    Forest(k,1) = All(k,1:wHF(1,1)-1);
end
wF = unique_no_sort(Forest);

for n = 2:length(wF); 
TypeOutput = zeros(length(R),4);
Type = zeros(1,1);
ForestType = zeros(1,1);
xR = zeros(1,1);
wHR1 = zeros(1,1);

wF(1,n)   
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
   
    %Rarefaction 
    N = zeros(1,1);
    Type = unique(ForestType);N = length(ForestType)
    UNI = length(Type)
    
    red=unifrnd(0,1); green=unifrnd(0,1); blue=unifrnd(0,1);
    
    R=10;
  for rep = 1:R; 
      U = zeros(1,2);
   for r = 1:N;
       S = unidrnd(length(xR),r,1)';%100 replicates
       L = unique(ForestType(S(1,1:r)));
       U(r,1) = r;
       U(r,2) = length(L);  
       
   end
   hold on
       plot(U(:,1),U(:,2),'k','color',[red green blue],'Markersize',36)
  end%rep  
  pause   
end
set(gca,'FontSize',20)
xlabel('Sampling','fontsize',22)
ylabel('Species Number','fontsize',22)


%[~,idu] = unique(SIE(:,1))
%uniquerows = SIE(idu,:);
%[R,C] = find(data > 0); 

%Hill numbers Loop for 1^D, 2^D,...,n^D
%s = size(data);
%for i = 1:s(1,1);
%    D = zeros(11,2);
    %B = sym(2)
    %D = sym(zeros(11,1));
%    for j = 0:10;
%        if j == 0;
            %D(0)
%            S = find(data(i,7:s(1,2)) > 0);
%            D(j+1,1) = j;
%            D(j+1,2) = length(S);
%        elseif j == 1;
             
            %C = sum(data(i,7:s(1,2)));
            %N = data(i,7:s(1,2))/C;
            %M = log(N); 
            %P = -exp(N.*M); 
               %Check
               %https://stackoverflow.com/questions/35897723/removing-nans-from-vectors-in-matlab
               %xn = isnan(P)
               %P(xn) = []
             %D(j+1,1) = j;
             %D(j+1,2) = P(:);
             
%             D(j+1,1) = j;
%             D(j+1,2) = length(S)/2;
              
%        elseif j > 1;
            
            %D(2),...D(n)
%            C = sum(data(i,7:s(1,2)));
%            N = data(i,7:s(1,2))/C;
%            M = N.^j;
%            B = sum(M).^(1/(1 - j));
%            D(j+1,1) = j;
%            D(j+1,2) = B(:);
            %pause
            %D(j+1,1) = sum(N.^j)^(1/(1 - j));%Not for dataframe
            %D(j+1,1) = W;%Not for dataframe
%        end
%    end
%    red=unifrnd(0,1); green=unifrnd(0,1); blue=unifrnd(0,1);
%    hold on
%    plot(D(:,1),D(:,2),'-','color',[red green blue],'Markersize',36)
    %pause
    %plot(D(:,1),D(:,2),'k-','Markersize',36)
%end
%hold on
%set(gca,'FontSize',20)
%xlabel('Order q','fontsize',22)
%ylabel('Empirical Hill number','fontsize',22)
%--------------------------
