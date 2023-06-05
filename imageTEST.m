
infile = '_chromatic/chromatic-piano.wav';
[xin, fs] = audioread(infile);
%x = normalize(xin(:,1) + xin(:,2));
x = xin(:,1)';
 
x = x(1:fs/16);

% look at the inner product of the audio signal with itself
y = x' * x;

size(y)

figure(1);
imagesc(y);
set(gca,'YDir','reverse');

