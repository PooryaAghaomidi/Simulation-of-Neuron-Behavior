% Poorya Aghaomidi
% 9961391001

clc;clear all; 
close all;
load('D:\Data\Doros\master\1st term\Electrophisiology\HW\7\150805.mat');
Y = unique(Event.mgs.codes(:,5));

y1 = find(Event.mgs.codes(:,5) == Y(1));
y2 = find(Event.mgs.codes(:,5) == Y(2));
y3 = find(Event.mgs.codes(:,5) == Y(3));
y4 = find(Event.mgs.codes(:,5) == Y(4));
y5 = find(Event.mgs.codes(:,5) == Y(5));
y6 = find(Event.mgs.codes(:,5) == Y(6));

for i=1:numel(y1)
    z1(i,:) = spike{4, 1}.mgs(y1(i),:);
end

for i=1:numel(y2)
    z2(i,:) = spike{4, 1}.mgs(y2(i),:);
end

for i=1:numel(y3)
    z3(i,:) = spike{4, 1}.mgs(y3(i),:);
end

for i=1:numel(y4)
    z4(i,:) = spike{4, 1}.mgs(y4(i),:);
end

for i=1:numel(y5)
    z5(i,:) = spike{4, 1}.mgs(y5(i),:);
end

for i=1:numel(y6)
    z6(i,:) = spike{4, 1}.mgs(y6(i),:);
end
%%
Q = unique(z1);
z1 = z1';
z4 = z4';

yek_in= find(z1 == Q(2));
W= unique(z4);
yek_out = find(z4 == W(2));

myrasterplot(yek_in,73,4701)
title('Rasterplot IN')
figure;
myrasterplot(yek_out,64,4701)
title('Rasterplot OUT')

[ph_in,hh,rr] = psth(yek_in, 10, 1000, 73, 4701) ;
title('psth IN')
xlabel('time (ms)')
ylabel('spike summation')
[ph_out,hho,rro] = psth(yek_out, 10, 1000, 64, 4701) ;
ylim([0 160])
title('psth OUT')
xlabel('time (ms)')
ylabel('spike summation')