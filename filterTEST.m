
% filter a song sample

infile = '_wav/birthday.wav';
[xin, fs] = audioread(infile);
x = xin(:,1);
x = x';
x = [ x zeros(1,fs-length( x)) ];
x = x(1:fs);

y1 = filter([ 0.7 0 0 0.5 ], [1], x);
y2 = filter([ 0 0 0 0 0.8 ], [1], x);

z = normalize(y1 + y2);

audiowrite('outfile.wav',z,fs);

