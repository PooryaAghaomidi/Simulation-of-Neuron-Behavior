% Poorya Aghaomidi
% 9961391001
% Question_2 , main
% Goal : calculate the dm and dh at ( 1 < t < 10 ) , V = -20 , m_o,h_o =0,1

clear all; close all; clc;

%% m :
t=[1:0.1:10];
% Set the time values

h1=ode_euler_modified(@m_prime, t, 0, -20);
% Call ode_euler_modified function to calculate the dm when m_o=0

h2=ode_euler_modified(@m_prime, t, 1, -20);
% Call ode_euler_modified function to calculate the dm when m_o=1

figure;
subplot(1,2,1), plot(t,h1), title('dm to dt when m_o=0'),xlabel('t axis'),ylabel('dm to dt');
subplot(1,2,2), plot(t,h2), title('dm to dt when m_o=1'),xlabel('t axis'),ylabel('dm to dt');
% Plot dm to dt curves with different initial values of m

savefig('m_t.fig');
% Save dm to dt curve in current folder

%% h :
h1=ode_euler_modified(@h_prime, t, 0, -20);
% Call ode_euler_modified function to calculate the dh when h_o=0

h2=ode_euler_modified(@h_prime, t, 1, -20);
% Call ode_euler_modified function to calculate the dh when h_o=1

figure;
subplot(1,2,1), plot(t,h1), title('dh to dt when h_o=0'),xlabel('t axis'),ylabel('dh to dt');
subplot(1,2,2), plot(t,h2), title('dh to dt when h_o=1'),xlabel('t axis'),ylabel('dh to dt');
% Plot dh to dt curves with different initial values of h

savefig('h_t.fig');
% Save dh to dt curve in current folder