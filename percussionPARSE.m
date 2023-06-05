

% load the input sample

infile = '_wav/samples-percussion.wav';
[xin, fs] = audioread(infile);
x = xin;
x = x';

x = [ x zeros(1,29*fs-length(x)) ];
    
x = [ x zeros(1,fs) ];

for i = 1:29
    
    s = x(1+fs*i:fs+fs*i);
    
    t = strcat('perc',num2str(i));
  
    t = strcat(t,'.wav');
    
    audiowrite(t,normalize(s),fs);
    
end


    