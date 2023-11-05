% Poorya Aghaomidi
% 9961391001

function  [ph,h,r] = psth(times, binsize, fs, ntrials, triallen, varargin)

h_color ='k';
nin=nargin;
error(nargchk(5,6, nin));
switch(nin)
 
 case 5 %no plot handle
  
  h=gca;
  
 case 6
  if(ishandle(varargin{1}))
    h=varargin{1};
  else
    error('Invalid Plot handle');
  end
end

lastBin = binsize * ceil((triallen-1)*(1000/(fs*binsize)));
edges = 0 : binsize : lastBin;	
x = (mod(times-1,triallen)+1)*(1000/fs);
r = (histc(x,edges)*1000) / (ntrials*binsize);

axes(h);
ph=bar(edges(1:end-1),r(1:end-1),'histc');
set(ph,'edgecolor',h_color,'facecolor',h_color);
