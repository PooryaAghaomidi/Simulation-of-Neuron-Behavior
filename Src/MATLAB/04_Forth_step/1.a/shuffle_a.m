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
neuron = spike{4, 2} ;

L51 = find(Event.mgs.codes(:,5) == locations(1));
L52 = find(Event.mgs.codes(:,5) == locations(2));
L53 = find(Event.mgs.codes(:,5) == locations(3));
L54 = find(Event.mgs.codes(:,5) == locations(4));
L55 = find(Event.mgs.codes(:,5) == locations(5));
L56 = find(Event.mgs.codes(:,5) == locations(6));

for k = 1:100
%% test
spikes = neuron.mgs ;
x = randperm(numel(spikes)) ;
spikes = reshape(spikes(x),size(spikes)) ;

%% spike count
for i=1:numel(L51)
    spike_count_51(1,i) = numel(find(spikes(L51(i),1000:2000) == 1));
end

for i=1:numel(L52)
    spike_count_52(1,i) = numel(find(spikes(L52(i),1000:2000) == 1));
end

for i=1:numel(L53)
    spike_count_53(1,i) = numel(find(spikes(L53(i),1000:2000) == 1));
end

for i=1:numel(L54)
    spike_count_54(1,i) = numel(find(spikes(L54(i),1000:2000) == 1));
end

for i=1:numel(L55)
    spike_count_55(1,i) = numel(find(spikes(L55(i),1000:2000) == 1));
end

for i=1:numel(L56)
    spike_count_56(1,i) = numel(find(spikes(L56(i),1000:2000) == 1));
end

%%  H noise
% 51
edge = [ min(spike_count_51) : (max(spike_count_51)-min(spike_count_51))/3: max(spike_count_51) ] ;
S_51_Prob = histogram(sort(spike_count_51),edge).Values ./ numel(spike_count_51) ;
S_51_Prob(S_51_Prob == 0) = [] ;
entropy_51 = - sum(S_51_Prob .* log2(S_51_Prob)) ; 

% 52
edge = [ min(spike_count_52) : (max(spike_count_52)-min(spike_count_52))/3: max(spike_count_52) ] ;
S_52_Prob = histogram(sort(spike_count_52),edge).Values ./ numel(spike_count_52) ;
S_52_Prob(S_52_Prob == 0) = [] ;
entropy_52 = - sum(S_52_Prob .* log2(S_52_Prob)) ;

% 53
edge = [ 5 : (36-5)/3 : 36 ] ;
S_53_Prob = histogram(sort(spike_count_53),edge).Values ./ numel(spike_count_53) ;
S_53_Prob(S_53_Prob == 0) = [] ;
entropy_53 = - sum(S_53_Prob .* log2(S_53_Prob)) ;

% 54
edge = [ min(spike_count_54) : (max(spike_count_54)-min(spike_count_54))/3: max(spike_count_54) ] ;
S_54_Prob = histogram(sort(spike_count_54),edge).Values ./ numel(spike_count_54) ;
S_54_Prob(S_54_Prob == 0) = [] ;
entropy_54 = - sum(S_54_Prob .* log2(S_54_Prob)) ;

% 55
edge = [ min(spike_count_55) : (max(spike_count_55)-min(spike_count_55))/3: max(spike_count_55) ] ;
S_55_Prob = histogram(sort(spike_count_55),edge).Values ./ numel(spike_count_55) ;
S_55_Prob(S_55_Prob == 0) = [] ;
entropy_55 = - sum(S_55_Prob .* log2(S_55_Prob)) ;

% 56
edge = [ min(spike_count_56) : (max(spike_count_56)-min(spike_count_56))/3: max(spike_count_56) ] ;
S_56_Prob = histogram(sort(spike_count_56),edge).Values ./ numel(spike_count_56) ;
S_56_Prob(S_56_Prob == 0) = [] ;
entropy_56 = - sum(S_56_Prob .* log2(S_56_Prob)) ;

total = numel(L51) + numel(L52) + numel(L53) + numel(L54) + numel(L55) + numel(L56) ;
H_noise = (entropy_51*numel(L51) + entropy_52*numel(L52) + entropy_53*numel(L53)  ...
         + entropy_54*numel(L54) + entropy_55*numel(L55) + entropy_56*numel(L56)) / total ;


%% Mutual Information
L = [L51;L52;L53;L54;L55;L56];
L = sort(L);
for i=1:numel(L)
    spike_count(1,i) = numel(find(neuron.mgs(L(i),1000:2000) == 1));
end
edge = [ min(spike_count) : (max(spike_count)-min(spike_count))/8: max(spike_count) ] ;
R_prob = histogram(spike_count,edge).Values ./ numel(spike_count) ;
H = - sum(R_prob .* log2(R_prob)) ;
close all


IM_shuffle(1,k) = H - H_noise ;

end

%% compare
load('IM_main')
IM_main = IM_main*ones(1,100) ;

[p,h] = signrank(IM_main,IM_shuffle)
