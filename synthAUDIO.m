
K = 88;

M = 20;

for p = 1:K
    
    for q = 1:M
        
        F(p,q) = 27.5 * 2^((p-1)/12) * q;
        
    end
    
end


fs = 48000.

tempo = 123;

slen = round(60 / tempo * 48000);

infile = '_wav/DriveMyCar2.wav';
[xin, fs] = audioread(infile);
x = xin(:,1);
x = 1/max(x) .* x;
x = x';

S = zeros(K,length(x));

for k = 1:K

    disp(sprintf('Creating Summed AGST channel %i',k));
    
    for m = 1:M
        
        S(k,:) = S(k,:) + SCFE(x, fs, F(k,m));
    
    end
    
end

figure(1);
imagesc(abs(S));
set(gca,'YDir','normal');

[ val, idx ] = max(abs(S));

figure(2);
plot(idx);


y = zeros(1,length(x));

for i = 1:length(idx)
    
    y(i) = makeNOTE(x(i),idx(i),fs,'since',pi/8,pi/8,0)

end

audiowrite('outfile.wav',z,fs);




