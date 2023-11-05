% Poorya Aghaomidi
% 9961391001

clear all; clc; close all;

%%
load('D:\Data\Doros\master\1st term\Electrophisiology\HW\7\150805.mat')
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
fr51(1,1) = sum(mean(l51(:,1:1000),1))/1000 ;
fr54(1,1) = sum(mean(l54(:,1:1000),1))/1000 ;

fr51(1,2) = sum(mean(l51(:,1000:2000),1))/1000 ;
fr54(1,2) = sum(mean(l54(:,1000:2000),1))/1000 ;

fr51(1,3) = sum(mean(l51(:,2500:3500),1))/1000 ;
fr54(1,3) = sum(mean(l54(:,2500:3500),1))/1000 ;

fr51_t = sum(mean(l51(:,:),1))/4700 ;
fr54_t = sum(mean(l54(:,:),1))/4700 ;

x = [500,1500,2000] ;
figure ;
subplot(1,2,1); scatter(x,fr51,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5)
xlim([0 2500]); ylim([0.02 0.035]); str = sprintf('total firing rate of in location = %f', fr51_t); title(str);
xlabel('time (ms)'); ylabel('frequency (sample/ms)'); 
subplot(1,2,2); scatter(x,fr54,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5)
xlim([0 2500]); ylim([0.02 0.035]); str = sprintf('total firing rate of out location = %f', fr54_t); title(str);
xlabel('time (ms)'); ylabel('frequency (sample/ms)');

