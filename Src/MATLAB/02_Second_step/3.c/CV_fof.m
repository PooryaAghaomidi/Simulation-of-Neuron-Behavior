% Poorya Aghaomidi
% 9961391001

clear all; clc; close all;

%%
load('D:\Data\Doros\master\1st term\Electrophisiology\HW\7\150805.mat')

neuron = spike{4,1} ;
total_spike = neuron.mgs ;

%%
zc = 0 ;
k = 1 ;
for i = 1:422
    for j = 1:1000
        if total_spike(i,j) == 0
            zc = zc + 1 ;
        else
            isi(i,k) = zc ;
            zc = 0 ;
            k = k + 1 ;
        end
    end
    k = 1 ;
    zc = 0 ;
end

x = 1:size(isi,2) ;

for i = 1:422
   coef = polyfit(1:size(isi,2),isi(i,:),2) ;
   y = polyval(coef , 1:size(isi,2)) ;
   mean_isi_trial(1,i) = mean(y) ;
   CV(1,i) = sqrt(var(y)) / mean_isi_trial(1,i) ;
end

x = 10:0.1:20 ;
figure ;
subplot(1,2,1)
plot(x,sigmoid(x,13,2)*2)
hold on
scatter(mean_isi_trial,CV)
xlim([10 20])
xlabel('average isi')
ylabel('CV')
title('CV curve in 1 to 1000 interval')
hold on

%%
for i = 1:422
   
   y = total_spike(i,1:1000) ;
   mean_isi_trial(1,i) = mean(y) ;
   fof(1,i) = var(y) / mean_isi_trial(1,i) ;
    
end


subplot(1,2,2)
scatter(1:422,fof)
xlabel('trials')
ylabel('Fanofactor')
title('Fanofactor in 1 to 1000 interval')
hold off

%%
zc = 0 ;
k = 1 ;
for i = 1:422
    for j = 1000:2000
        if total_spike(i,j) == 0
            zc = zc + 1 ;
        else
            isi(i,k) = zc ;
            zc = 0 ;
            k = k + 1 ;
        end
    end
    k = 1 ;
    zc = 0 ;
end

x = 1:size(isi,2) ;

for i = 1:422
   coef = polyfit(1:size(isi,2),isi(i,:),2) ;
   y = polyval(coef , 1:size(isi,2)) ;
   mean_isi_trial(1,i) = mean(y) ;
   CV(1,i) = sqrt(var(y)) / mean_isi_trial(1,i) ;
end

x = 10:0.1:20 ;
figure ;
subplot(1,2,1)
plot(x,sigmoid(x,12,2)*1.4)
hold on
scatter(mean_isi_trial,CV)
xlim([10 20])
xlabel('average isi')
ylabel('CV')
title('CV curve in 1000 to 2000 interval')
hold on

%%
for i = 1:422
   
   y = total_spike(i,1000:2000) ;
   mean_isi_trial(1,i) = mean(y) ;
   fof(1,i) = var(y) / mean_isi_trial(1,i) ;
    
end


subplot(1,2,2)
scatter(1:422,fof)
xlabel('trials')
ylabel('Fanofactor')
title('Fanofactor in 1000 to 2000 interval')
hold off

%%
zc = 0 ;
k = 1 ;
for i = 1:422
    for j = 1:4700
        if total_spike(i,j) == 0
            zc = zc + 1 ;
        else
            isi(i,k) = zc ;
            zc = 0 ;
            k = k + 1 ;
        end
    end
    k = 1 ;
    zc = 0 ;
end

x = 1:size(isi,2) ;

for i = 1:422
   coef = polyfit(1:size(isi,2),isi(i,:),2) ;
   y = polyval(coef , 1:size(isi,2)) ;
   mean_isi_trial(1,i) = mean(y) ;
   CV(1,i) = sqrt(var(y)) / mean_isi_trial(1,i) ;
end

x = 10:0.1:25 ;
figure ;
subplot(1,2,1)
plot(x,sigmoid(x,18.5,3)*1.5)
hold on
scatter(mean_isi_trial,CV)
xlim([15 25])
xlabel('average isi')
ylabel('CV')
title('CV curve in the whole interval')
hold on

%%
for i = 1:422
   
   y = total_spike(i,:) ;
   mean_isi_trial(1,i) = mean(y) ;
   fof(1,i) = var(y) / mean_isi_trial(1,i) ;
    
end


subplot(1,2,2)
scatter(1:422,fof)
xlabel('trials')
ylabel('Fanofactor')
title('Fanofactor in the whole interval')
hold off







%%
function y = sigmoid(x,c,a)

narginchk(1,3) 
if nargin<3
    a = 1; 
else
    assert(isscalar(a)==1,'a must be a scalar.') 
end
if nargin<2
    c = 0; 
else
    assert(isscalar(c)==1,'c must be a scalar.') 
end
y = 1./(1 + exp(-a.*(x-c)));
end
