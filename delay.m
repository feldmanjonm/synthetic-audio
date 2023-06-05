

infile = 'outfilebassoonfm.wav';
[xin, fs] = audioread(infile);
x = xin(:,1);
x = x';
x = [ x zeros(1,fs-length(x)) ];
x = x(1:fs);

h = zeros(1,3*fs);

h(1) = 1;
h(fs/2) = 0.8;
h(fs+1) = 0.6;
h(3*fs/2+1) = 0.4;
h(2*fs+1) = 0.2;

y = conv(x,h);

z = filter([1],[1 1],y);

audiowrite('outfile.wav',normalize(z),fs);