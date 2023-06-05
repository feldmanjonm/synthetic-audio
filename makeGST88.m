

fs = 48000;

K = 88;

M = 15;

for p = 1:K
    
    for q = 1:M
        
        F(p,q) = 27.5 * 2^((p-1)/12) * q;
        
    end
    
end


U = zeros(K,length(x));

for k = 1:K
   
    if 0
    str = "Computing SCFE " + num2str(k);
    disp(str);
    end
    
    U(k,:) = SCFEnorm(x,fs,F(k,1));
        
end

if 0
disp('GST Transform computed');
end

% display the GST

subplot(312);
imagesc(abs(U));
colormap('default');
set(gca,'YDir','normal');
title('GST analysis: frequency domain');

xticks(1:fs/2:length(x));
xticklabels(0:0.5:round(length(x)/fs));

ylim([1 K]);
yticks(1:12:K);
yticklabels(1:12:K);

ylabel('Frequency (Hz)');
xlabel('Time (s)');


