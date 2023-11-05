% Poorya Aghaomidi
% 9961391001
% Question_2 , Function_2
% Goal : calculate dn/dt

function dn_dt = n_prime(time, n_o, V)
% function arguments : t and n_o and V
% t     : a vector that specifies the time points that the n should be approximated for
% n_o   : the initial condition
% V     : membrane potential
% dn_dt : representing ( dn / dt )

Vrest = -85 ;
% Assume that the amount of rest potential is -85

[ alfa_n , beta_n ] = transition_rate_n(V , Vrest) ;
% Calling transition_rate_n function to calculate alfa and beta for n

TAW_n = 1 / (alfa_n + beta_n) ;
INF_n = alfa_n / (alfa_n + beta_n) ;
% Calculating required parameters to achieve dn/dt value

syms n(t);
% Define n as a function of t

n(t) = INF_n - (INF_n - n_o)*exp((-t)/TAW_n) ;
% Define the equation for n(t)

diffn = diff(n,t) ;
% Derivative of the function n(t)

% Calculate dn/dt :
dn_dt = diffn(time) ;