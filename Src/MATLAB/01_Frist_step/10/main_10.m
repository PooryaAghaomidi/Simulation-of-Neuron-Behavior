% Poorya Aghaomidi
% 9961391001
% Question_10 , main
% Goal : calculate the value of voltage with different I_inj

clear all; close all; clc;

v1 = hodgkin_huxley(70, 5);
% Call hodgkin_huxley function to calculate voltage when I_inj = 5

v2 = hodgkin_huxley(70, 15);
% Call hodgkin_huxley function to calculate voltage when I_inj = 15

v3 = hodgkin_huxley(70, 25);
% Call hodgkin_huxley function to calculate voltage when I_inj = 35

v4 = hodgkin_huxley(70, 55);
% Call hodgkin_huxley function to calculate voltage when I_inj = 55

time = [0.01:0.01:70];
% Set the time array when t = 70
sampling_frequency = 1 /0.01 ;
% Calculate sampling frequency

ydft1 = fft(v1);
ydft1 = 2*ydft1(1:ceil((length(v1)+1)/2));
freq1 = 0:sampling_frequency/length(v1):sampling_frequency/2 ;
ydft1 = ydft1/(2*length(freq1));
% Calculate fast fourier transform for voltage when I_inj = 5
% and determine frequency changes in a limited range in a logarythmic space

ydft2 = fft(v2);
ydft2 = 2*ydft2(1:ceil((length(v2)+1)/2));
freq2 = 0:sampling_frequency/length(v2):sampling_frequency/2 ;
ydft2 = ydft2/(2*length(freq2));
% Calculate fast fourier transform for voltage when I_inj = 15
% and determine frequency changes in a limited range in a logarythmic space

ydft3 = fft(v3);
ydft3 = 2*ydft3(1:ceil((length(v3)+1)/2));
freq3 = 0:sampling_frequency/length(v3):sampling_frequency/2 ;
ydft3 = ydft3/(2*length(freq3));
% Calculate fast fourier transform for voltage when I_inj = 35
% and determine frequency changes in a limited range in a logarythmic space

ydft4 = fft(v4);
ydft4 = 2*ydft4(1:ceil((length(v4)+1)/2));
freq4 = 0:sampling_frequency/length(v4):sampling_frequency/2 ;
ydft4 = ydft4/(2*length(freq4));
% Calculate fast fourier transform for voltage when I_inj = 55
% and determine frequency changes in a limited range in a logarythmic space

figure ;
subplot(2,2,1),plot(time,v1),title('I inj = 5'),xlabel('Time'),ylabel('Membrane Potential');
subplot(2,2,2),plot(time,v2),title('I inj = 15'),xlabel('Time'),ylabel('Membrane Potential');
subplot(2,2,3),plot(time,v3),title('I inj = 35'),xlabel('Time'),ylabel('Membrane Potential');
subplot(2,2,4),plot(time,v4),title('I inj = 55'),xlabel('Time'),ylabel('Membrane Potential');
% Display time_voltage curve with axis details at different injection current

savefig('time_voltage.fig');
% Save time_voltage curve in current folder

figure ;
loglog(freq1,abs(ydft1),'DisplayName','injection current = 5'),xlim([4.5 46]), xlabel('frequency [Hz]');
hold on
loglog(freq2,abs(ydft2),'DisplayName','injection current = 15'),xlim([4.5 46]), xlabel('frequency [Hz]');
hold on
loglog(freq3,abs(ydft3),'DisplayName','injection current = 35'),xlim([4.5 46]), xlabel('frequency [Hz]');
hold on
loglog(freq4,abs(ydft4),'DisplayName','injection current = 55'),xlim([4.5 46]), xlabel('frequency [Hz]');
title('NOTE : in high frequencies the value of fourier transform is higher for biger injection current values.'); 
hold off
% Demonstrate increasing frequency with increasing injected current

legend ;
% Show legend

savefig('frequency.fig');
% Save frequency curve in current folder