% Poorya Aghaomidi
% 9961391001
% Question_11 , Function_2
% Goal : calculate alfa and beta for m

function [ alfa_m , beta_m ] = transition_rate_m(Vm , Vrest)
% function arguments : Vm and Vrest
% Vm     : membrane potential
% Vrest  : resting potential
% alfa_m : transition rate between open and close states ( close to open )
% beta_m : transition rate between open and close states ( open to close )

v = Vm - Vrest ;
% Calculate v as required in alfa and beta formula

% Calculate alfa and beta for m
alfa_m = (0.1 * (25 - v)) / (exp(0.1*(25-v)) - 1) ;
beta_m = 4 * exp((-v)/18) ;
