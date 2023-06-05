
% load the input sample

infile = '_wav/outfileLowE.wav';
[xin, fs] = audioread(infile);

infile = '_wav/outfileMaj3.wav';
[yin, fs] = audioread(infile);

z = zeros(length(xin),2);

z(:,1) = xin;

z(:,2) = yin;

audiowrite('outfile.wav', z, fs);
