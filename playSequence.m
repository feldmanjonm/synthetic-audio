


notes = [ 25 27 29 30 32 34 36 37 ];

times = 1:length(notes);

for i = 1:length(notes)
    
    if (notes(i) < 1) || (notes(i) > 88)
        
        notes(i) = 1;
        
    end    
end

z = [];


for i = 1:length(notes)
    
    y = S(notes(i),1:fs);
    
    y(1:fs/8) = y(1:fs/8) .* (0:(fs/8))/(fs/8);
    
    y(length(y)-100:fs) = y(length(y)-100:fs) .* (fs/8)
    
    z = [ z y ];
    
end

audiowrite('outfile.wav',z,fs);

