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

%% bins
j = 1;
for i = 1:150:4551
    fr51(1,j) = sum(mean((l51(:,i:i+150))))/150 ;
    fr52(1,j) = sum(mean((l52(:,i:i+150))))/150 ;
    fr53(1,j) = sum(mean((l53(:,i:i+150))))/150 ;
    fr54(1,j) = sum(mean((l54(:,i:i+150))))/150 ;
    fr55(1,j) = sum(mean((l55(:,i:i+150))))/150 ;
    fr56(1,j) = sum(mean((l56(:,i:i+150))))/150 ;
    j = j+1 ;
end

figure ;
subplot(2,3,1); stairs(1:150:4650,fr51); title('location 51'); ylim([0 0.055]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,2); stairs(1:150:4650,fr52); title('location 52'); ylim([0 0.055]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,3); stairs(1:150:4650,fr53); title('location 53'); ylim([0 0.055]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,4); stairs(1:150:4650,fr54); title('location 54'); ylim([0 0.055]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,5); stairs(1:150:4650,fr55); title('location 55'); ylim([0 0.055]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,6); stairs(1:150:4650,fr56); title('location 56'); ylim([0 0.055]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');

%% sliding window

j = 1;
for i = 1:15:4611
    fr51(1,j) = sum(mean((l51(:,i:i+90))))/90 ;
    fr52(1,j) = sum(mean((l52(:,i:i+90))))/90 ;
    fr53(1,j) = sum(mean((l53(:,i:i+90))))/90 ;
    fr54(1,j) = sum(mean((l54(:,i:i+90))))/90 ;
    fr55(1,j) = sum(mean((l55(:,i:i+90))))/90 ;
    fr56(1,j) = sum(mean((l56(:,i:i+90))))/90 ;
    j = j+1 ;
end

figure ;
subplot(2,3,1); stairs(1:15:4620,fr51); title('location 51'); ylim([0 0.07]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,2); stairs(1:15:4620,fr52); title('location 52'); ylim([0 0.07]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,3); stairs(1:15:4620,fr53); title('location 53'); ylim([0 0.07]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,4); stairs(1:15:4620,fr54); title('location 54'); ylim([0 0.07]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,5); stairs(1:15:4620,fr55); title('location 55'); ylim([0 0.07]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,6); stairs(1:15:4620,fr56); title('location 56'); ylim([0 0.07]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');

%% Normal

Y = unique(Event.mgs.codes(:,5));

y_index = cell([1 numel(Y)]);
for i=1:numel(Y)
   y_index{i} = find(Event.mgs.codes(:,5) == Y(i));
end

y_spike = cell([1 numel(Y)]);
for i=1:numel(Y)
    r = y_index{i};
    for j = 1:numel(y_index{i})
        z1(j,:) = spike{4, 1}.mgs(r(j),:);
    end
    y_spike{i} = z1;
    clear z1
    clear r
end

for i=1:numel(Y)
    r = y_spike{i};
    for j=1:size(r,1)
        sigma = 0.015;
        edge =(-3*sigma:.001:3*sigma);
        kernel = normpdf(edge,0,sigma);
        kernel = kernel*.001;
        A6(j,:)=conv(r(j,:),kernel,'same');
    end
    y_SDF{i} = A6;
    clear A6
    clear r
end

figure ;
subplot(2,3,1); plot(mean(y_SDF{1})); title('location 51'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,2); plot(mean(y_SDF{2})); title('location 52'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,3); plot(mean(y_SDF{3})); title('location 53'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,4); plot(mean(y_SDF{4})); title('location 54'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,5); plot(mean(y_SDF{5})); title('location 55'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,6); plot(mean(y_SDF{6})); title('location 56'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');

%% HalfNormal

for i=1:numel(Y)
    r = y_spike{i};
    for j=1:size(r,1)
        pd = makedist('HalfNormal','mu',0,'sigma',1000);
        x = 0:80 ;
        pdf_k = pdf(pd,x);
        A6(j,:)=conv(r(j,:),pdf_k,'same');
    end
    y_SDF{i} = A6*20;
    clear A6
    clear r
end

figure ;
subplot(2,3,1); plot(mean(y_SDF{1})); title('location 51'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,2); plot(mean(y_SDF{2})); title('location 52'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,3); plot(mean(y_SDF{3})); title('location 53'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,4); plot(mean(y_SDF{4})); title('location 54'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,5); plot(mean(y_SDF{5})); title('location 55'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
subplot(2,3,6); plot(mean(y_SDF{6})); title('location 56'); ylim([0 0.1]); xlabel('time (ms)'); ylabel('frequency (sample/ms)');
