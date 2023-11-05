% Poorya Aghaomidi
% 9961391001
% Question_1 , main
% Goal : calculate the df at ( 1 < x < 10 ) and x_o = 1 for f(x) = x^2 + 1

clear all; close all; clc;

x=[1:0.1:10];
% Set x values

f=ode_euler(@f_prime, x, 1);
% Call ode_euler function to calculate the df

figure; 
plot(x,f),title('df to dx curve for f(x) = x^2 + 1')
xlabel('x axis'),ylabel('df to dx');
% Display df to dx curve for f(x) = x^2 + 1

savefig('example curve.fig');
% Save df to dx curve for f(x) = x^2 + 1 in current folder