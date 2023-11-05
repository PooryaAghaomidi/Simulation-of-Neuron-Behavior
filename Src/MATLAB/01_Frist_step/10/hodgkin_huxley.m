% Poorya Aghaomidi
% 9961391001
% Question_10 , Function_1
% Goal : calculate the value of voltage at every point in time array

function V = hodgkin_huxley(t, I_inj)
% function arguments : t and I_inj
% t      : given time serie
% I_inj  : representing injected current
% V      : voltage at every point

Cm   = 1     ;
gL   = 0.3   ;
EL   = 10.6  ;
gK   = 36    ;
n    = 0.378 ;
EK   = -12   ;
gNa  = 120   ;
m    = 0.417 ;
h    = 0.477 ;
ENa  = 115   ;
% Specify required parameter values
% Source : BIOELECTRICITY:AQUANTITATIVE APPROACH - Table 13.2 & Table 13.3

time = [0.01:0.01:t] ;
% Set the time array

delta_t = time(2) - time(1) ;
% Calculate time step size

Lt = length(time) ;
% Calculate time array length

V = zeros(1,Lt) ; 
m = zeros(1,Lt) ;
h = zeros(1,Lt) ;
n = zeros(1,Lt) ;
% Initialize required arraies for voltage , m , h & n

V(1)  = -85  ;
Vrest = -85  ;
m(1)  = 0    ;
h(1)  = 1    ;
n(1)  = 0    ;
% Set  resting potential , m , h & n before current injection

% Define a for loop to calculate voltage at every time in given time array:
for i=1:Lt-1 
    
    iK  = gK*n(i)^4*(EK-(V(i)+85)) ;
    % Calculate current for K+ channels at every given voltage
    
    iNa = gNa*m(i)^3*h(i)*(ENa-(V(i)+85)) ;
    % Calculate current for Na+ channels at every given voltage
    
    V(i+1) = V(i) + delta_t*(iNa + iK + gL*(EL-(V(i)+85)) + I_inj);
    % Calculate voltage value with respect to previous voltage value
    
    [ alfa_n , beta_n ] = transition_rate_n(V(i) , Vrest) ;
    % Call transition_rate_n to calculate alfa & beta for n at given voltage
    
    [ alfa_m , beta_m ] = transition_rate_m(V(i) , Vrest) ;
    % Call transition_rate_m to calculate alfa & beta for m at given voltage
    
    [ alfa_h , beta_h ] = transition_rate_h(V(i) , Vrest) ;
    % Call transition_rate_h to calculate alfa & beta for h at given voltage
    
    m(i+1) = m(i) + delta_t*(alfa_m*(1-m(i)) - beta_m*m(i));
    % Calculate m value with respect to previous m value at given voltage
    
    h(i+1) = h(i) + delta_t*(alfa_h*(1-h(i)) - beta_h*h(i));
    % Calculate h value with respect to previous h value at given voltage
    
    n(i+1) = n(i) + delta_t*(alfa_n*(1-n(i)) - beta_n*n(i));
    % Calculate n value with respect to previous n value at given voltage
    
end
  
end





