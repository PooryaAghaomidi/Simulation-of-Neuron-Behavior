% Poorya Aghaomidi
% 9961391001
% Question_6 , main
% Goal : calculate the current response of a Na+ channel at t = 10 & V = -20

clear all; close all; clc;

Ina = Na_v(10 , -20);
% Call Na_v function to calculate the current response of a Na+ channel

t=[0:0.1:10];
% Set the time values to display the INa_time curve

figure; plot(t,Ina),title('the current response of a Na+ channel at t = 10 & V = -20')
xlabel('time axis'), ylabel('current response of a Na+ channel');
% Plot Ina_time curve

savefig('Ina_time.fig');
% Save the curve in current folder