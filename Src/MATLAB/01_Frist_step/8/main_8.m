% Poorya Aghaomidi
% 9961391001
% Question_8 , main
% Goal : calculate the value of voltage when t = 50 and I_inj = 5

clear all; close all; clc;

v = hodgkin_huxley(50, 5);
% Call hodgkin_huxley function to calculate voltage when t = 10 and I_inj = 5

time = [0.01:0.01:50];
% Set the time array when t = 10

figure ;
plot(time,v)
xlabel('Time axis');
ylabel('Membrane Potential');
title('(time voltage) curve when t = 50 and injection current = 5');
% Display time_voltage curve with axis details

savefig('time_voltage.fig');
% Save time_voltage curve in current folder