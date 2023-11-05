% Poorya Aghaomidi
% 9961391001

clear all; clc; close all;

%%
load('D:\Data\Doros\master\TMU\terms\1st term\Electrophisiology\HW\7\150805.mat')
locations = squeeze(Event.mgs.codes(:,5)) ;

neuron = spike{4,1} ;

c51 = 0;
c52 = 0;
c53 = 0;
c54 = 0;
c55 = 0;
c56 = 0;

for i = 1:422
    if locations(i,1) == 51
        c51 = c51 + 1 ;
        l51(c51,:) = neuron.mgs(i,:) ;
    elseif locations(i,1) == 52
        c52 = c52 +1 ;
        l52(c52,:) = neuron.mgs(i,:) ;
    elseif locations(i,1) == 53
        c53 = c53 +1 ;
        l53(c53,:) = neuron.mgs(i,:) ;
    elseif locations(i,1) == 54
        c54 = c54 +1 ;
        l54(c54,:) = neuron.mgs(i,:) ;
    elseif locations(i,1) == 55
        c55 = c55 +1 ;
        l55(c55,:) = neuron.mgs(i,:) ;
    elseif locations(i,1) == 56
        c56 = c56 +1 ;
        l56(c56,:) = neuron.mgs(i,:) ;
    end
end

%%
zc = 0 ;
k = 1 ;
for i = 1:size(l51,1)
    for j = 1:1000
        if l51(i,j) == 0
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
coef = polyfit(x,mean(isi,1),2) ;
y = polyval(coef,x);
figure ;
plot(1:77:4697,y)
hold on
plot(1:77:4697,mean(isi,1))
xlabel('time (ms)')
ylabel('isi')
title(' 1 to 1000 interval')
hold off

%%
zc = 0 ;
k = 1 ;
for i = 1:size(l51,1)
    for j = 1000:2000
        if l51(i,j) == 0
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
coef = polyfit(x,mean(isi,1),2) ;
y = polyval(coef,x);
figure ;
plot(1:67:4690,y)
hold on
plot(1:67:4690,mean(isi,1))
xlabel('time (ms)')
ylabel('isi')
title(' 1000 to 2000 interval')
hold off

%%
zc = 0 ;
k = 1 ;
for i = 1:size(l51,1)
    for j = 1:size(l51,2)
        if l51(i,j) == 0
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
coef = polyfit(x,mean(isi,1),2) ;
y = polyval(coef,x);
figure ;
plot(1:19:4522,y)
hold on
plot(1:19:4522,mean(isi,1))
xlabel('time (ms)')
ylabel('isi')
title('total')
hold off
