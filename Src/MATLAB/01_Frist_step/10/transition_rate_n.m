% Poorya Aghaomidi
% 9961391001
% Question_10 , Function_3
% Goal : calculate alfa and beta

function [ alfa_n , beta_n ] = transition_rate_n(Vm , Vrest)
% function arguments : Vm and Vrest
% Vm     : membrane potential
% Vrest  : resting potential
% alfa_n : transition rate between open and close states ( close to open )
% beta_n : transition rate between open and close states ( open to close )

v = Vm - Vrest ;
% Calculate v as required in alfa and beta formula

% Calculate alfa and beta for n
alfa_n = (0.01 * (10 - v)) / (exp((10 - v) / 10) - 1) ;
beta_n = 0.125 * exp((-v)/80) ;
