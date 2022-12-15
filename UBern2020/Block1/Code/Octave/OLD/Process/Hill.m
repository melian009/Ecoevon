%------------------------------------------------------ 
%Baldo & Melian, JULY 2020, Horw, CH


%Hill Numbers based on 

%Gotelli, N. J., Hsieh, T. C., Sander, E. L., & Colwell, R. K. (2014). Rarefaction and Extrapolation with Hill Numbers: A Framework for Sampling and Estimation in Species Diversity Studies The Harvard community has made this article openly available. Ecological Monographs, 84(1), 45–67. https://doi.org/10.1890/13-0133.1
%------------------------------------------------------

pkg load statistics
pkg load dataframe


%DATA ---------------------

%--------------------------


%Numerical DATA IBD (abundance data)------------

%...The multinomial probability distribution is the most
%widely used model for the observed species sample frequencies (X1, X2, .. . , XS) for given S and ( p1, p2, ... , pS):
%n!

%for i = 1:10:100;
%    for S = 1:20;
%        x = unidrnd(i,S,1);
%        n = sum(x);
%        y = multcoef(n,x);
        %pause
%    end
%end

%Fig 1 ----
for i = 1:100;
    %if q == 1
    c = 0.193;
    N(i,1) = (c/i);
    
    %else %more dominant species
    c1 = 0.85;
    N1(i,1) = (c1/i)^2;
    %end
    C = sum(N(:,1));
    C1 = sum(N1(:,1)); 

    %equiprobability
    %c = 0.193;
    N2(i,1) = 0.01;

end    
    %Hills------- Loop for 1^D, 2^D,...,n^D
    for j = 0:10;
       D(j+1,1) = sum(N.^j)^(1/(1 - j));
       D1(j+1,1) = sum(N1.^j)^(1/(1 - j));
       D2(j+1,1) = sum(N2.^j)^(1/(1 - j));
       
       
       red=0.3; green=0.4; blue=0.6;
       hold on
       %plot(j,D(j+1,1),'k.','color',[red green blue],'Markersize',36)
       plot(j,D(j+1,1),'k','Markersize',36)
       
       hold on
       plot(j,D1(j+1,1),'r','Markersize',36)
       
       hold on
       plot(j,D2(j+1,1),'g','Markersize',36)
    end
    hold on
set(gca,'FontSize',20)
xlabel('Order q','fontsize',22)
ylabel('Hill number','fontsize',22)

%----------------------------------------------


