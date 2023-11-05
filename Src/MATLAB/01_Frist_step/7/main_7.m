% Poorya Aghaomidi
% 9961391001
% Question_7 , main
% Goal : display Ina_time curves at t = 10 & V = -40:10:60

clear all; close all; clc;

t = 10 ;
time=[0:0.1:t] ;
Lt = length(time) ;
% Set a constant time duration and its array and length

V = [-40:10:60] ;
Lv = length(V) ;
% Initialize voltage array and calculate its length

Ina = zeros(Lv,Lt) ;
% Initialize current matrix
% Row : number of given voltage values ( V = [-40:10:60] )
% Column : number of given time values ( t = [0:0.1:10] )

% A for loop to display Ina_time curves for all given voltage values :
for i = 1:Lv
    
    Ina(i,:) = Na_v( t , V(i)) ;
    % Call Na_v function to calculate the current response of a Na+ channel
    
    lgnd = ['Voltage = ',num2str(V(i))] ;
    % Set information to display legend
    
    plot(time,Ina(i,:),'DisplayName',lgnd), title('(Ina time) curves at t = 10 & V = -40:10:60')
    xlabel('time axis'), ylabel('current response of a Na+ channel');
    % Display Ina_time curve
    
    % Check the end of the plots :
    if i ~= Lv
        hold on
    else
        hold off
        legend ;
        % Show legend
    end
    
end

savefig('Ina_time_diff_V.fig');
% Save the curves in a single figure in current folder