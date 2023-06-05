


fs = 48000;

lydian = [ 0 2 4 6 7 9 11 ];
ionian = [ 0 2 4 5 7 9 11 ];
mixolydian = [ 0 2 4 5 7 9 10 ];
dorian = [ 0 2 3 5 7 9 10 ];
aeolian = [ 0 2 3 5 7 8 10 ];
locrian = [ 0 1 3 5 7 8 10 ];

G = 11;

p1 = [ 0 2 4 0 ];

p2 = [ 4 5 7 4 ];

p3 = reverse(p1);

p4 = reverse(p2);

p = [ p1 p2 p4 p3 ];

p = G + 24 + p;


notes = p;


%notes = [ 29 30 32 34 36 37 39 41 42 44 46 48 ];

times = 1:length(notes);

for i = 1:length(notes)
    
    if (notes(i) < 1) || (notes(i) > 88)
        
        notes(i) = 1;
        
    end    
end

z = [];


for i = 1:length(notes)
    
    y = S(notes(i),1:fs);
    
    z = [ z y ];
    
end

z = normalize(z);

audiowrite('outfile.wav',z,fs);

