%% information

          %        Poorya Aghaomidi           %
          %           9961391001              %
          %   Neuroscience project - part 2   %

%% get ready!
clc;
clear all; 
close all;

load('D:\Data\Doros\master\2nd term\Neuroscience\HW\2\150805.mat');

%% initialize
locations = unique(Event.mgs.codes(:,5));
neuron_number = 4
neuron = spike{neuron_number, 1} ;

for i = 1:numel(locations)
    L{i} = find(Event.mgs.codes(:,5) == locations(i));
end

for j = 1:numel(locations)
    for i = 1:numel(L{j})
        spike_1{j}(1,i) = numel(find(neuron.mgs(L{j}(i,1),1:1000) == 1));
        spike_2{j}(1,i) = numel(find(neuron.mgs(L{j}(i,1),1000:2000) == 1));
        spike_3{j}(1,i) = numel(find(neuron.mgs(L{j}(i,1),2500:3000) == 1));
    end
end


%% 0 to 1000
in_condition = spike_1{1} ;
out_condition = spike_1{4} ;

len = min(numel(in_condition),numel(out_condition)) ;

[p,h] = signrank(in_condition(1,1:len),out_condition(1,1:len))

%% 1000 to 2000
in_condition = spike_2{1} ;
out_condition = spike_2{4} ;

len = min(numel(in_condition),numel(out_condition)) ;

[p,h] = signrank(in_condition(1,1:len),out_condition(1,1:len))

%% 2500 to 3000
in_condition = spike_3{1} ;
out_condition = spike_3{4} ;

len = min(numel(in_condition),numel(out_condition)) ;

[p,h] = signrank(in_condition(1,1:len),out_condition(1,1:len))