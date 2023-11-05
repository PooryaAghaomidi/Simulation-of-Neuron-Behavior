% Poorya Aghaomidi
% 9961391001

clear all; clc; close all;

%%
load('D:\Data\Doros\master\1st term\Electrophisiology\HW\7\150805.mat')
locations = squeeze(Event.mgs.codes(:,5)) ;

neuron = spike{5,1} ;

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

fr(1,1) = sum(mean(l51,1))/4701 ;
fr(1,2) = sum(mean(l52,1))/4701 ;
fr(1,3) = sum(mean(l53,1))/4701 ;
fr(1,4) = sum(mean(l54,1))/4701 ;
fr(1,5) = sum(mean(l55,1))/4701 ;
fr(1,6) = sum(mean(l56,1))/4701 ;

figure ;
scatter(51:56,fr)
hold on
coef = polyfit(51:56,fr,2) ;
y = polyval(coef,51:56) ;
plot(51:56,y)
xlabel('locations')
ylabel('average firing rate (sample/ms)')
title(' mgs tuning curve ')
hold off

%%
orientations = squeeze(Event.vgabor.codes(:,5)) ;

neuron = spike{4,1} ;

c51 = 0;
c52 = 0;
c53 = 0;
c54 = 0;
c55 = 0;
c56 = 0;
c57 = 0;
c58 = 0;
c59 = 0;
c60 = 0;
c61 = 0;
c62 = 0;
c63 = 0;
c64 = 0;
c65 = 0;
c66 = 0;

for i = 1:129
    if orientations(i,1) == 51
        c51 = c51 + 1 ;
        l51(c51,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 52
        c52 = c52 +1 ;
        l52(c52,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 53
        c53 = c53 +1 ;
        l53(c53,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 54
        c54 = c54 +1 ;
        l54(c54,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 55
        c55 = c55 +1 ;
        l55(c55,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 56
        c56 = c56 +1 ;
        l56(c56,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 57
        c57 = c57 +1 ;
        l57(c57,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 58
        c58 = c58 +1 ;
        l58(c58,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 59
        c59 = c59 +1 ;
        l59(c59,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 60
        c60 = c60 +1 ;
        l60(c60,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 61
        c61 = c61 +1 ;
        l61(c61,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 62
        c62 = c62 +1 ;
        l62(c62,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 63
        c63 = c63 +1 ;
        l63(c63,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 64
        c64 = c64 +1 ;
        l64(c64,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 65
        c65 = c65 +1 ;
        l65(c65,:) = neuron.mgs(i,:) ;
    elseif orientations(i,1) == 66
        c66 = c66 +1 ;
        l66(c66,:) = neuron.mgs(i,:) ;
    end
end

fr(1,1) = sum(mean(l51,1))/4701 ;
fr(1,2) = sum(mean(l52,1))/4701 ;
fr(1,3) = sum(mean(l53,1))/4701 ;
fr(1,4) = sum(mean(l54,1))/4701 ;
fr(1,5) = sum(mean(l55,1))/4701 ;
fr(1,6) = sum(mean(l56,1))/4701 ;
fr(1,7) = sum(mean(l57,1))/4701 ;
fr(1,8) = sum(mean(l58,1))/4701 ;
fr(1,9) = sum(mean(l59,1))/4701 ;
fr(1,10) = sum(mean(l60,1))/4701 ;
fr(1,11) = sum(mean(l61,1))/4701 ;
fr(1,12) = sum(mean(l62,1))/4701 ;
fr(1,13) = sum(mean(l63,1))/4701 ;
fr(1,14) = sum(mean(l64,1))/4701 ;
fr(1,15) = sum(mean(l65,1))/4701 ;
fr(1,16) = sum(mean(l66,1))/4701 ;

figure ;
scatter(51:66,fr)
hold on
coef = polyfit(51:66,fr,3) ;
y = polyval(coef,51:66) ;
plot(51:66,y)
xlabel('orientations')
ylabel('average firing rate (sample/ms)')
title(' vgabor tuning curve ')
hold off