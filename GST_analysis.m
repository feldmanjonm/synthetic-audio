
fs = 48000;

K = 88;

M = 20;

for p = 1:K
    
    for q = 1:M
        
        F(p,q) = 27.5 * 2^((p-1)/12) * q;
        
    end
    
end

x = S(25,:);

xlen = length(x);


for p = 1:K
    
    str = "Computing SCFE " + num2str(p);
    disp(str);
        
        A(p,:) = SCFEnorm(x,fs,F(p,1));
        
end

disp('Transform computed');

% display the GST

figure(1);
waterfall(abs(A));
colormap('default');

set(gca,'YDir','Reverse');
title('GST analysis of diatonic scale starting on A3');

xticks(1:fs/2:length(x));
xticklabels(0:0.5:round(length(x)/fs));

ylim([1 88]);
yticks(1:12:88);
yticklabels(round(F(1:12:88,1),1));

ylabel('Frequency (Hz)');
xlabel('Time (s)');
zlabel('Spectral Energy');

view([-45 45]);

rotate3d ON;

% print('_output/GST_analysis_piano_A0','-dpng');

