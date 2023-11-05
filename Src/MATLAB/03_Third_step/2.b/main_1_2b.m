%% information

          %        Poorya Aghaomidi           %
          %           9961391001              %
          %   Neuroscience project - part 1   %

%% get ready!
clc;
clear all; 
close all;

load('D:\Data\Doros\master\2nd term\Neuroscience\HW\2\150805.mat');

%% initialize
locations = squeeze(Event.mgs.codes(:,5)) ;
neuron = spike{4,1} ;

c51 = 0; c52 = 0; c53 = 0;
c54 = 0; c55 = 0; c56 = 0;

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


%% gaussian filter

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
        sigma = 0.05;
        edge =(-3*sigma:.001:3*sigma);
        kernel = normpdf(edge,0,sigma);
        kernel = kernel*.001;
        A6(j,:)=conv(r(j,:),kernel,'same');
    end
    y_SDF{i} = A6;

end

figure ;
plot(mean(y_SDF{1}),'DisplayName','location 51'); hold on
plot(mean(y_SDF{2}),'DisplayName','location 52'); hold on
plot(mean(y_SDF{3}),'DisplayName','location 53'); hold on
plot(mean(y_SDF{4}),'DisplayName','location 54'); hold on
plot(mean(y_SDF{5}),'DisplayName','location 55'); hold on
plot(mean(y_SDF{6}),'DisplayName','location 56'); hold on 
xlabel('time (ms)'); 
ylabel('frequency (sample/ms)');
legend ;
hold off


%% HalfNormal

for i=1:numel(Y)
    r = y_spike{i};
    for j=1:size(r,1)
        pd = makedist('HalfNormal','mu',0,'sigma',1000);
        x = 0:100 ;
        pdf_k = pdf(pd,x);
        A6(j,:)=conv(r(j,:),pdf_k,'same');
    end
    y_SDF{i} = A6*20;
    clear A6
    clear r
end

figure ;
plot(smooth(mean(y_SDF{1})),'DisplayName','location 51'); hold on
plot(smooth(mean(y_SDF{2})),'DisplayName','location 52'); hold on
plot(smooth(mean(y_SDF{3})),'DisplayName','location 53'); hold on
plot(smooth(mean(y_SDF{4})),'DisplayName','location 54'); hold on
plot(smooth(mean(y_SDF{5})),'DisplayName','location 55'); hold on
plot(smooth(mean(y_SDF{6})),'DisplayName','location 56'); hold on 
xlabel('time (ms)'); 
ylabel('frequency (sample/ms)');
legend ;
hold off