
K = 88;

M = 20;

for p = 1:K
    
    for q = 1:M
        
        F(p,q) = 27.5 * 2^((p-1)/12) * q;
        
    end
    
end

fs = 48000;

ff = F(18,1);

y = zeros(1,fs);


for h = 20:-1:20
    
    t = (-fs/2:1:fs/2)/fs;

    plot(t);    
    
    hold on;
    
    H(21-h,:) = x;
    
    sw = sineWAVE(ff*(21-h),fs,fs);
    
    out = x .* sw;

    figure(3);
    plot(out);
    
    y = y + out;
    
end

finalout = 1/max(y) .* y;

audiowrite('outfile.wav', finalout, fs);


figure(1)
plot(out);

xlim([0 length(env)]);
xticks(0:fs/10:length(x));
xticklabels(0:1:length(x));
xlabel('ms');


figure(2);
waterfall(H);
set(gca, 'YDir','reverse');
saveas(2, 'waterfall.png');
