% Poorya Aghaomidi
% 9961391001
% Question_3 , main
% Goal : calculate the current response of a K+ channel at t = 10 & V = -20

clear all; close all; clc;

Ik = K_v(10 , -20);
% Call K_v function to calculate the current response of a K+ channel

t=[0:0.1:10];
% Set the time values to display the Ik_time curve

figure; 
plot(t,Ik),title('the current response of a K+ channel at t = 10 & V = -20')
xlabel('time axis'),ylabel('current response of a K+ channel');
% Plot Ik_time curve

savefig('Ik_time.fig');
% Save the curve in current folder