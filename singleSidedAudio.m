
infile = '_wav/cello.wav';
[xin, fs] = audioread(infile);
x = xin(:,1);
x = x';

for i = 1:length(x)
    
    x(i) = abs(x(i));
    
end

audiowrite('outfile.wav',x,fs);

