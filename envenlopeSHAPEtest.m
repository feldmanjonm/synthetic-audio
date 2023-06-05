


fs = 48000;


notes = [ 25 ];

times = 1:length(notes);

for i = 1:length(notes)
    
    if (notes(i) < 1) || (notes(i) > 88)
        
        notes(i) = 1;
        
    end    
end

z = [];

    
t = fs/2;
    
y = S(notes(i),1:fs);
    
y(1:t+1) = y(1:t+1) .* (0:t)./t;
    
y = reverse(y);
    
y(1:t+1) = y(1:t+1) .* (0:t)./t;
    
y = reverse(y);
    
z = [ z y ];
    
z = normalize(z);

audiowrite('outfile.wav',z,fs);

