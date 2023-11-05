% Poorya Aghaomidi
% 9961391001
% Question_12 , main
% Goal : Display peak changes for late and early current with respect to
% voltage changes

clear all ; close all ; clc ;

Namax = zeros(1,201);
Kmax = zeros(1,201);
% Initialize arraies for peaks

i = 1 ;
% Initialize counter

% Define a for loop to calculate peak changes for late and early current
for v = -100:1:100
    iNa = Na_v(10,v);
    % Call Na_v function to calculate early current for every given
    % voltages
    
    Namax(i) = max(iNa) ;
    % Calculate peak for early current
    
    iK = K_v(10,v);
    % Call K_v function to calculate late current for every given voltages
    
    Kmax(i) = max(iK) ;
    % Calculate peak for late current
    
    i = i+1 ;
    % Add 1 to counter
    
end

v = -100:1:100 ;
% Set x axis

% Display peak changes for late and early current with respect to voltage changes
plot(v,Namax,v,Kmax)
    