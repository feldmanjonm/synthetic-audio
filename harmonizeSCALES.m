
infile1 = 'scale01piano.wav';

infile2 = 'scale01rimshot.wav';


[uin, fs] = audioread(infile1);

[vin, fs] = audioread(infile2);

x = 0.7 * (uin + vin);

size(x)

audiowrite('outfile.wav',x,fs);