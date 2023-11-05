% Poorya Aghaomidi
% 9961391001

clear all; clc; close all;
warning('off','all')
%%
load('D:\Data\Doros\master\TMU\terms\TA\150805.mat')

spikes = spike{4,1}.vodr ;
adrs = squeeze(Event.vodr.codes(:,10:17)) ;

delay = spikes(:,1:150) ;
prob{1,1} = spikes(:,151:351) ;
prob{1,2} = spikes(:,352:552) ;
prob{1,3} = spikes(:,565:765) ;
prob{1,4} = spikes(:,788:988) ;
prob{1,5} = spikes(:,990:1190) ;
prob{1,6} = spikes(:,1191:1391) ;
prob{1,7} = spikes(:,1400:1600) ;
prob{1,8} = spikes(:,1601:1801) ;

for k = 3:9
    for i = 1:7
        [r,c] = find(adrs == i + k*10) ;
        for m = 1:size(r,1)
            data(m,:) = prob{1,c(m,1)}(r(m,1),:) ;
        end
        answer(i,k-2) = sum(mean(data,1))/200 ;
    end
end

figure ;
subplot(1,2,1); contourf(answer)
subplot(1,2,2); surf(answer)

