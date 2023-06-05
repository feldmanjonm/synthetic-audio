
x = S(25,:);


z1 = abs(x(1:2:length(x)));

z2 = -abs(x(2:2:length(x)));

x = z1 + z2;

%x = normalize(x);

figure(1);
plot(x);

audiowrite('outfile.wav',x,fs);


