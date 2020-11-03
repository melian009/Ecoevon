%-------------------------------------------------------------------------
%Baldo & Melian, JULY-AUG 2020, Horw, CH


%Hill Numbers based on 

%Gotelli, N. J., Hsieh, T. C., Sander, E. L., & Colwell, R. K. (2014). Rarefaction and Extrapolation with Hill Numbers: A Framework for Sampling and Estimation in Species Diversity Studies The Harvard community has made this article openly available. Ecological Monographs, 84(1), 45–67. https://doi.org/10.1890/13-0133.1


%NM1
%Empirical estimations of S and N along equiprobable abundance distributions

%NM2
%Empirical estimations of S and N along dominance abundance distributions
%---------------------------------------------------------------------------

pkg load statistics
pkg load dataframe
pkg load symbolic

%DATA ---------------------

%https://stackoverflow.com/questions/28407344/reading-text-number-mixed-csv-files-as-tables-in-octave
data = dataframe ("abun.csv");
s = size(data);

%Estimation of N and S
for i = 1:s(1,1);
    S = find(data(i,7:s(1,2)) > 0);
    E(i,1) = length(S);
    C = sum(data(i,7:s(1,2)));
    E(i,2) = C(:);
    %pause
end

%Plot E
red=unifrnd(0,1); green=unifrnd(0,1); blue=unifrnd(0,1);
plot(E(:,2),E(:,1),'.','color',[red green blue],'Markersize',36)
set(gca,'FontSize',20)
xlabel('Number of Individuals','fontsize',22)
ylabel('Number of Species','fontsize',22)

%Estimators
for u = 1:1000;
    %Given S,N randomly chosen species abundance distribution
    n = E(unidrnd(length(E),1));
    SE = round(E(unidrnd(length(E),1),2));
    A = unifrnd(1,SE,1,n);%NM2 account for Dominance
    p = A/sum(A);
    [X Y] = multrnd(n,p,1)
    pause
    
    
    %Randomized Hill
    for j = 0:10
        if j == 0;
           D(j+1,1) = n;
           
        elseif j == 1;
           
           
        elseif j > 1;
           
        
        end
    end
    
end


%Empirical Hills
%s = size(data);
%for i = 1:s(1,1);
%    D = zeros(11,2);
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
