function y = makeNOTE2(x, fk, fs)

M = 20;

y = zeros(1,length(x));

for m = 1:M

    env = abs(SCFE(x, fs, fk));

    sw1 = sineWAVE(fk, length(env), fs);

    sw2 = sineWAVE(fk-1, length(env), fs);

    sw3 = sineWAVE(fk+1, length(env), fs);

    h1 = env .* sw1; 
    
    h2 = env .* sw2; 
    
    h3 = env .* sw3; 
    
    y = y + h1 + h2 + h3;  
    
end
