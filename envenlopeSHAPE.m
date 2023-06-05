
% expects input signal x


x = x(1:round(fs/3));
    
y = zeros(1,length(x));
    

t = fs/8;
    
y = x;
    
y(1:t+1) = y(1:t+1) .* (0:t)./t;
    
y = reverse(y);
    
y(1:t+1) = y(1:t+1) .* (0:t)./t;
    
y = reverse(y);


% write out the audio

z = normalize(y);

audiowrite('outfile.wav',z,fs);

