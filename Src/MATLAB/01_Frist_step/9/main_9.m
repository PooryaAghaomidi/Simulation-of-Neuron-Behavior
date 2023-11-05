% Poorya Aghaomidi
% 9961391001
% Question_9 , main
% Goal : calculate the value of voltage with different I_inj

clear all; close all; clc;

v1 = hodgkin_huxley(50, 5);
% Call hodgkin_huxley function to calculate voltage when I_inj = 5

v1plus = hodgkin_huxley(100, 5);
% Call hodgkin_huxley function to calculate voltage when I_inj = 5

v2 = hodgkin_huxley(100, 10);
% Call hodgkin_huxley function to calculate voltage when I_inj = 10

v3 = hodgkin_huxley(100, 15);
% Call hodgkin_huxley function to calculate voltage when I_inj = 15

time1 = [0.01:0.01:50];
% Set the time array when t = 50

time2 = [0.01:0.01:100];
% Set the time array when t = 100

figure ;
subplot(2,2,1),plot(time1,v1),title('I inj = 5'),xlabel('Time axis'),ylabel('Membrane Potential');
subplot(2,2,2),plot(time2,v2),title('I inj = 10'),xlabel('Time axis'),ylabel('Membrane Potential');
subplot(2,2,3),plot(time2,v3),title('I inj = 15'),xlabel('Time axis'),ylabel('Membrane Potential');
subplot(2,2,4),plot(time2,v1plus,time2,v2,time2,v3)
title('merge all curves at one figure'),xlabel('Time axis'),ylabel('Membrane Potential');
% Display time_voltage curve with axis details

savefig('time_voltage.fig');
% Save time_voltage curve in current folder