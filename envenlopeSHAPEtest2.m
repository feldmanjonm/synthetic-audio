


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
   
s = sigmoid(-5:4);

env = [];

for i = 1:10
    
    env = [ env s(i)*ones(1,fs/10) ];
    
end

z = y .* env;

figure(1);
plot(z);

out = [ z y ];
    
out = normalize(out);

audiowrite('outfile.wav',out,fs);

