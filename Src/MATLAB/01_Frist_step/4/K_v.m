% Poorya Aghaomidi
% 9961391001
% Question_4 , Function_1
% Goal : calculate the current response of a K+ channel

function Ik = K_v(t , V)
% function arguments : t and V
% t  : a time interval to study the current response
% V  : a holding potential that causes the current response
% Ik : the current response of a K+ channel

g_k_avg = 36 ;
E_k = -72.1 ;
% Attribute defult values to required parameters
% Source : BIOELECTRICITY:AQUANTITATIVE APPROACH _ Table 13.2 

time = [0:0.1:t] ;
% Set the time array

n_o = 0 ;
% Set the initial condition

n = ode_euler_modified(@n_prime, time, n_o, V);
% Call ode_euler_modified function to calculate the dn

n4 = n.^4 ;
% Calculate n^4

% calculate the current response of a K+ channel :
Ik = g_k_avg * n4 * (V - E_k);

