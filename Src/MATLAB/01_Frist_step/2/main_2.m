% Poorya Aghaomidi
% 9961391001
% Question_2 , main
% Goal : calculate the dn at ( 1 < t < 10 ) and V = -20 and different n_o

clear all; close all; clc;

t=[1:0.1:10];
% Set the time values

n1=ode_euler_modified(@n_prime, t, 0, -20);
% Call ode_euler_modified function to calculate the dn when n_o=0

n2=ode_euler_modified(@n_prime, t, 1, -20);
% Call ode_euler_modified function to calculate the dn when n_o=1

figure;
subplot(1,2,1), plot(t,n1), title('dn to dt when n_o=0'),xlabel('t axis'),ylabel('dn to dt');
subplot(1,2,2), plot(t,n2), title('dn to dt when n_o=1'),xlabel('t axis'),ylabel('dn to dt');
% Plot n_t curves with different initial values of n

savefig('n_t.fig');
% Save n_t curve in current folder