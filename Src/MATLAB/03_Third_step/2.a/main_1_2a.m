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
locations = unique(Event.mgs.codes(:,5));
neuron = spike{4, 1} ;

L51 = find(Event.mgs.codes(:,5) == locations(1));
L52 = find(Event.mgs.codes(:,5) == locations(2));
L53 = find(Event.mgs.codes(:,5) == locations(3));
L54 = find(Event.mgs.codes(:,5) == locations(4));
L55 = find(Event.mgs.codes(:,5) == locations(5));
L56 = find(Event.mgs.codes(:,5) == locations(6));

for i=1:numel(L51)
    spike_51(i,:) = neuron.mgs(L51(i),:);
end

for i=1:numel(L52)
    spike_52(i,:) = neuron.mgs(L52(i),:);
end

for i=1:numel(L53)
    spike_53(i,:) = neuron.mgs(L53(i),:);
end

for i=1:numel(L54)
    spike_54(i,:) = neuron.mgs(L54(i),:);
end

for i=1:numel(L55)
    spike_54(i,:) = neuron.mgs(L55(i),:);
end

for i=1:numel(L56)
    spike_55(i,:) = neuron.mgs(L56(i),:);
end


%% plot
Q = unique(spike_51);
spike_51 = spike_51';
spike_54 = spike_54';
W= unique(spike_54);

yek_in  = find(spike_51 == Q(2));
yek_out = find(spike_54 == W(2));

% raster plot
figure ;
subplot(211)
myrasterplot(yek_in,73,4701)
title('Rasterplot IN')
subplot(212)
myrasterplot(yek_out,64,4701)
title('Rasterplot OUT')

% psth
figure ;
subplot(211)
[ph_in,hh,rr] = psth(yek_in, 10, 1000, 73, 4701) ;
title('psth IN')
xlabel('time (ms)')
ylabel('spike summation')

subplot(212)
[ph_out,hho,rro] = psth(yek_out, 10, 1000, 64, 4701) ;
ylim([0 160])
title('psth OUT')
xlabel('time (ms)')
ylabel('spike summation')