
% load the input sample

infile = '_wav/outfileDMCdroneD.wav';
[xin, fs] = audioread(infile);

infile = '_wav/outfileDMCdroneFsharp.wav';
[yin, fs] = audioread(infile);

z = 2 .* x + y;

z = 1/max(z) .* z;

audiowrite('outfile.wav', z, fs);
