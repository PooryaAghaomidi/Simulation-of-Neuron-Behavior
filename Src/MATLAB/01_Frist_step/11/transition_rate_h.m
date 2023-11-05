% Poorya Aghaomidi
% 9961391001
% Question_11 , Function_1
% Goal : calculate alfa and beta for h

function [ alfa_h , beta_h ] = transition_rate_h(Vm , Vrest)
% function arguments : Vm and Vrest
% Vm     : membrane potential
% Vrest  : resting potential
% alfa_m : transition rate between open and close states ( close to open )
% beta_m : transition rate between open and close states ( open to close )

v = Vm - Vrest ;
% Calculate v as required in alfa and beta formula

% Calculate alfa and beta for h
alfa_h = 0.07 * exp((-v)/20) ;
beta_h = 1 / (exp((30-v)/10) + 1) ;
