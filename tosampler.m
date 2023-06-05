
infile = '_chromatic/chromatic-altosax.wav';

mode = 'chromatic';

tempo = 60;

S = makeSYNTH(infile, mode, tempo);

[ sx, slenq ] = size(S);

for k = 1:88
    
    audiowrite(sprintf('_samplesets/asx%i.wav', k), S(k,:), 48000);
    
end

