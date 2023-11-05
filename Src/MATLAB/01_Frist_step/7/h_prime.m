% Poorya Aghaomidi
% 9961391001
% Question_7 , Function_3
% Goal : calculate dh/dt

function dh_dt = h_prime(time, h_o, V)
% function arguments : t and h_o and V
% t     : a vector that specifies the time points that the h should be approximated for
% h_o   : the initial condition
% V     : membrane potential
% dm_dt : representing ( dh / dt )

Vrest = -85 ;
% Assume that the amount of rest potential is -85

[ alfa_h , beta_h ] = transition_rate_h(V , Vrest) ;
% Calling transition_rate_h function to calculate alfa and beta for h

TAW_h = 1 / (alfa_h + beta_h) ;
INF_h = alfa_h / (alfa_h + beta_h) ;
% Calculating required parameters to achieve dh/dt value

syms h(t);
% Define h as a function of t

h(t) = INF_h - (INF_h - h_o)*exp((-t)/TAW_h) ;
% Define the equation for h(t)

diffh = diff(h,t) ;
% Derivative of the function h(t)

% Calculate dh/dt :
dh_dt = diffh(time) ;