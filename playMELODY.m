

fs = 48000;

tempo = 60;

slen = 60/tempo * fs;



A = 1;
Bf = 2;
B = 3;
C = 4;
Df = 5;
D = 6;
Ef = 7;
E = 8;
F = 9;
Gf = 10;
G = 11;
Af = 12;

scale = [ 0 2 4 5 7 9 11 ];

notes = G + [ scale 12+scale 24 ];

times = 1:length(notes);


for i = 1:length(notes)
    
    if (notes(i) < 1) || (notes(i) > 88)
        
        notes(i) = 1;
        
    end    
end

z = [];


for i = 1:length(notes)
            
    y = S(notes(i),:);
    
    z = [ z y ];
    
end

z = normalize(z);

audiowrite('outfile.wav',z,fs);

