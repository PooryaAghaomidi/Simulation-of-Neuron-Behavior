% Poorya Aghaomidi
% 9961391001
% Question_6 , Function_4
% Goal : calculate dm/dt

function dm_dt = m_prime(time, m_o, V)
% function arguments : t and m_o and V
% t     : a vector that specifies the time points that the m should be approximated for
% m_o   : the initial condition
% V     : membrane potential
% dm_dt : representing ( dm / dt )

Vrest = -85 ;
% Assume that the amount of rest potential is -85

[ alfa_m , beta_m ] = transition_rate_m(V , Vrest) ;
% Calling transition_rate_m function to calculate alfa and beta for m

TAW_m = 1 / (alfa_m + beta_m) ;
INF_m = alfa_m / (alfa_m + beta_m) ;
% Calculating required parameters to achieve dm/dt value

syms m(t);
% Define m as a function of t

m(t) = INF_m - (INF_m - m_o)*exp((-t)/TAW_m) ;
% Define the equation for m(t)

diffm = diff(m,t) ;
% Derivative of the function m(t)

% Calculate dm/dt :
dm_dt = diffm(time) ;