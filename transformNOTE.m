
function y = transformNOTE(S, k, M, fs);

% S is the input synthesizer
% k is the note to be transformed
% M is the number of harmonics to display
% fs is the sample rate

K = 88;


for p = 1:K
    
    for q = 1:M
        
        F(p,q) = 27.5 * 2^((p-1)/12) * q;
        
    end
    
end


x = S(k,:);


U = zeros(M,length(x));

for m = 1:M
        
    U(m,:) = SCFEnorm(x,fs,F(k,m));
        
end

disp('Transform computed');


figure(1);
waterfall(abs(U));
colormap('default');
set(gca,'YDir','Reverse');
title("GST analysis of original note number " + num2str(k));

xticks(1:fs/2:length(x));
xticklabels(0:0.5:round(length(x)/fs));

ylim([1 M]);
yticks(1:M);
yticklabels(1:M);

ylabel('Frequency (Hz)');
xlabel('Time (s)');
zlabel('Spectral Energy');

view([-45 45]);


