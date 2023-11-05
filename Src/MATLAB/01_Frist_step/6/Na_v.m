% Poorya Aghaomidi
% 9961391001
% Question_6 , Function_1
% Goal : calculate the current response of a Na+ channel

function Ina = Na_v(t , V)
% function arguments : t and V
% t   : a time interval to study the current response
% V   : a holding potential that causes the current response
% Ina : the current response of a Na+ channel

g_Na_avg = 120 ;
E_Na = 52.4 ;
% Attribute defult values to required parameters
% Source : BIOELECTRICITY:AQUANTITATIVE APPROACH _ Table 13.2 

time = [0:0.1:t] ;
% Set the time array

m_o = 0 ;
h_o = 1 ;
% Set the initial condition

m = ode_euler_modified(@m_prime, time, m_o, V);
% Call ode_euler_modified function to calculate the dm

h = ode_euler_modified(@h_prime, time, h_o, V);
% Call ode_euler_modified function to calculate the dh

n3 = m.^3 ;
% Calculate n^4

% calculate the current response of a K+ channel :
Ina = g_Na_avg * ( n3 .* h ) * (V - E_Na);

