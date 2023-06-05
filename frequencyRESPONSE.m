
% filter a song sample

fs = 48000;

%create an impulse

x = zeros(1,fs);
x(1) = 1;

% send the impulse through the system

y = filter([1 1],[1 1],x);

% look at the FFT of the impulse response

figure(1);
plot(abs(fft(y)));

audiowrite('outfile.wav',z,fs);

