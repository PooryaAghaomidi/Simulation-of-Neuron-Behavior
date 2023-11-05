% Poorya Aghaomidi
% 9961391001
% Question_4 , main
% Goal : display Ik_time curves at t = 10 & V = -30:10:70

clear all; close all; clc;

t = 10 ;
time=[0:0.1:t] ;
Lt = length(time) ;
% Set a constant time duration and its array and length

V = [-30:10:70] ;
Lv = length(V) ;
% Initialize voltage array and calculate its length

Ik = zeros(Lv,Lt) ;
% Initialize current matrix
% Row : number of given voltage values ( V = [-30:10:70] )
% Column : number of given time values ( t = [0:0.1:10] )

% A for loop to display Ik_time curves for all given voltag values :
for i = 1:Lv
    
    Ik(i,:) = K_v( t , V(i)) ;
    % Call K_v function to calculate the current response of a K+ channel
    
    lgnd = ['Voltage = ',num2str(V(i))] ;
    % Set information to display legend
    
    plot(time,Ik(i,:),'DisplayName',lgnd), title('(Ik time) curves at t = 10 & V = -30:10:70') 
    xlabel('time axis'),ylabel('current response of a K+ channel');
    % Display Ik_time curve
    
    % Check the end of the plots :
    if i ~= Lv
        hold on
    else
        hold off
        legend ;
        % Show legend
    end
    
end

savefig('Ik_time_diff_V.fig');
% Save the curves in a single figure in current folder