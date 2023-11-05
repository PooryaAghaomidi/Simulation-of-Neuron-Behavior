clear all; clc; close all;
warning('off','all')
%% initialization
load('D:\Data\Doros\master\TMU\terms\1st term\Electrophisiology\HW\7\150805.mat')
locations = Event.mgs.codes(:,5) ;

neuron = spike{8,1} ;

c51 = 0;
c52 = 0;
c53 = 0;
c54 = 0;
c55 = 0;
c56 = 0;

for i = 1:422
    if locations(i,1) == 51
        c51 = c51 + 1 ;
        l51(c51,:) = neuron.mgs(i,:) ;
    elseif locations(i,1) == 52
        c52 = c52 +1 ;
        l52(c52,:) = neuron.mgs(i,:) ;
    elseif locations(i,1) == 53
        c53 = c53 +1 ;
        l53(c53,:) = neuron.mgs(i,:) ;
    elseif locations(i,1) == 54
        c54 = c54 +1 ;
        l54(c54,:) = neuron.mgs(i,:) ;
    elseif locations(i,1) == 55
        c55 = c55 +1 ;
        l55(c55,:) = neuron.mgs(i,:) ;
    elseif locations(i,1) == 56
        c56 = c56 +1 ;
        l56(c56,:) = neuron.mgs(i,:) ;
    end
end

%% homogenous
% in
mean_st = mean(l51,1) ;
r_avg = trapz(mean_st) / 4701 ;
spikes = zeros(1,4701) ;

for i = 1:4701
    X = unifrnd(0,1) ;
    if X < r_avg
        spikes(1,i) = 1 ;
    end
end

figure ;
subplot(1,2,1)
plot(100*fr(mean_st))
hold on
plot(100*fr(spikes))
hold on
plot(spikes)
xlabel('time (ms)')
title('in location - homogenous')
ylim([0 5])
legend('Main frequency','Simulated frequency','Generated spikes')
hold off

% out
mean_st = mean(l54,1) ;
r_avg = trapz(mean_st) / 4701 ;
spikes = zeros(1,4701) ;

for i = 1:4701
    X = unifrnd(0,1) ;
    if X < r_avg
        spikes(1,i) = 1 ;
    end
end

subplot(1,2,2)
plot(100*fr(mean_st))
hold on
plot(100*fr(spikes))
hold on
plot(spikes)
xlabel('time (ms)')
title('out location - homogenous')
ylim([0 5])
legend('Main frequency','Simulated frequency','Generated spikes')
hold off

%% inhomogenous
% in
r_array = mean(l51,1) ;
spikes = zeros(1,4701) ;

for i = 1:4701
    X = unifrnd(0,1) ;
    if X < r_array(1,i)
        spikes(1,i) = 1 ;
    end
end

figure ;
subplot(1,2,1)
plot(100*fr(r_array))
hold on
plot(100*fr(spikes))
hold on
plot(spikes)
xlabel('time (ms)')
title('in location - inhomogenous')
ylim([0 5])
legend('Main frequency','Simulated frequency','Generated spikes')
hold off

% out
r_array = mean(l54,1) ;
spikes = zeros(1,4701) ;

for i = 1:4701
    X = unifrnd(0,1) ;
    if X < r_array(1,i)
        spikes(1,i) = 1 ;
    end
end

subplot(1,2,2)
plot(100*fr(r_array))
hold on
plot(100*fr(spikes))
hold on
plot(spikes)
xlabel('time (ms)')
title('out location - inhomogenous')
ylim([0 5])
legend('Main frequency','Simulated frequency','Generated spikes')
hold off

%% time rescaling
% in
r_array = mean(l51,1) ;
spikes = zeros(1,4701) ;
X = - log(unifrnd(0,1)) ;
sm = 0 ;
drft = 100 ;

for i = 1:4701
    
sm = r_array(1,i) + sm ;
eq = X - sm ;

if abs(eq) <= drft
    drft  = abs(eq) ;
else
    X = - log(unifrnd(0,1)) ;
    spikes(1,i) = 1 ;
    drft = 100 ;
    sm = 0 ;
end

end

figure ;
subplot(1,2,1)
plot(100*fr(r_array))
hold on
plot(100*fr(spikes))
hold on
plot(spikes)
xlabel('time (ms)')
title('in location - Renewal process')
ylim([0 5])
legend('Main frequency','Simulated frequency','Generated spikes')
hold off

% out
r_array = mean(l54,1) ;
spikes = zeros(1,4701) ;
X = - log(unifrnd(0,1)) ;
sm = 0 ;
drft = 100 ;

for i = 1:4701
    
sm = r_array(1,i) + sm ;
eq = X - sm ;

if abs(eq) <= drft
    drft  = abs(eq) ;
else
    X = - log(unifrnd(0,1)) ;
    spikes(1,i) = 1 ;
    drft = 100 ;
    sm = 0 ;
end

end


subplot(1,2,2)
plot(100*fr(r_array))
hold on
plot(100*fr(spikes))
hold on
plot(spikes)
xlabel('time (ms)')
title('out location - Renewal process')
ylim([0 5])
legend('Main frequency','Simulated frequency','Generated spikes')
hold off

%% functions
function y = fr(spike_function)

        sigma = 0.15;
        edge =(-3*sigma:.001:3*sigma);
        kernel = normpdf(edge,0,sigma);
        kernel = kernel*.001;
        y = conv(spike_function,kernel,'same');
        
end