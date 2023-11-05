%% information

          %        Poorya Aghaomidi           %
          %           9961391001              %
          %   Neuroscience project - part 1   %

%% get ready!
clc;
clear all; 
close all;
warning('off','all')

load('D:\Data\Doros\master\TMU\terms\2nd term\Neuroscience\HW\2\150805.mat');
neuron = spike{4,1} ;

%% stimulus matrix

for i = 1:size(Event.vodr.codes,1)
   stim{i} = zeros(7,7,1901) ; 
end

for i = 1:size(Event.vodr.codes,1)
    for j = 10:17
        
        probe = Event.vodr.codes(i,j)       ;
        col   = floor(probe/10) - 2         ;
        row   = mod(probe , (col + 2) * 10) ;
        
        stim{i}(row , col , (j-10)*200+200:(j-10)*200+400) = 1 ;
        
    end
end


%% Pre-STA
spike_counter = 1 ;
for i = 1:146
    trial_matrix = neuron.vodr(i,:) ; 
    spikes       = find(trial_matrix == 1) ;
    
    for j = 1:length(spikes)
       
        index = spikes(1,j) ;
        if index >= 100
           
            pre_sta{spike_counter} = stim{i}(:,:,index-99:index) ;
            spike_counter = spike_counter + 1 ;
            
        end
        
    end
    
end



%% STA
STA_final = zeros(7,7,100) ;

for i = 1:100
   
    for j = 1:length(pre_sta)
       
        STA_final(:,:,i) = STA_final(:,:,i) + pre_sta{1,j}(:,:,i) ;
        
    end
    
end

STA_final = STA_final / length(pre_sta) ;


%% display
for i = 1:100
   
    surface(STA_final(:,:,i))
    title(sprintf('%d ms before spike',101-i)) ;
    colorbar
    shading interp
    pause(0.3)

end

