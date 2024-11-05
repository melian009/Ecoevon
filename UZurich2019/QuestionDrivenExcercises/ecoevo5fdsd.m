%1. Initial trait distributions
mu = 0;%Mean
for s = 1;%Extend n-species:0.5:20;
r1 = -6*s:1e-1:6*s;  
yr1 = normpdf(r1, mu, s);
r1 = r1 + abs(min(r1));% Move everything to the right.
hr1 = plot(r1,yr1);%Visualize
a =unifrnd(0,1);
b =unifrnd(0,1);
c =unifrnd(0,1);
set(hr1,'color',[a b c]);
end

for s = 4;%Extend n-species:0.5:2;
p1 = -3*s:1e-1:3*s;  %smaller 5e-1
yp1 = normpdf(p1, mu, s);
p1 = p1 + abs(min(p1));% Move everything to the right.
end

%2. Compute W each phenotype
h = 0.8;%heritability
gamma = 0.01;%intensity selection

%Mean field scenario---------------------
%for gamma = 1:10;
NG = 5;%Number of generations
phi = 0.01;
for t = 1:NG;
  hold off
    %Wr = zeros(NG,length(r1));
    for i = 1:length(r1); 
        %Wr = abs(1/(1 + e^gamma*(r1(t,i) - mean(r1(t,:)))^2));%MeanField
        Wr = abs(e^gamma*((r1(t,i) - mean(r1(t,:))))^2);%FDS

        r1(t+1,i) = r1(t,i) + phi*(mean(r1(t,:)) - r1(t,i));% + randn(1)
        yr1(t+1,i) = yr1(t,i)*Wr+unifrnd(0.0001,0.001);   
    end
hr1 = semilogy(r1(t,:),yr1(t,:));%Visualize
a =unifrnd(0,1);
b =unifrnd(0,1);
c =unifrnd(0,1);
set(hr1,'color',[a b c]);
xlabel('Trait',"fontsize",14)
ylabel('Frequency',"fontsize",14)

    for i = 1:length(p1); 
        %Wp = abs(1/(1 + e^gamma*(p1(t,i) - mean(p1(t,:)))^2));
        Wp = abs(e^gamma*((p1(t,i) - mean(r1(t,:))))^2);%FDS
        p1(t+1,i) = p1(t,i) + phi*(mean(p1(t,:)) - p1(t,i));% + randn(1)
        yp1(t+1,i) = yp1(t,i)*Wp+unifrnd(0.0001,0.0025);
    end
hold on
hp1 = semilogy(p1(t,:),yp1(t,:));%Visualize
a =unifrnd(0,1);
b =unifrnd(0,1);
c =unifrnd(0,1);
set(hp1,'color',[a b c]);
%pause
end
