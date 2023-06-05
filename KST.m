
%
% GST signal transform with K channels along the fundamental frequency axis
%


fs = 48000;


% length of sample to be analysed in seconds

t = 60;


infile = '_wav/icantdance.wav';
[xin, fs] = audioread(infile);
%x = xin(:,1) + xin(:,2);
x = xin(:,1);
x = x';

x = [ x zeros(1,t*fs-length(x))];
x = x(1:t*fs);


K = 88;

M = 15;


for p = 1:K
    
    for q = 1:M
        
        F(p,q) = 27.5 * 2^((p-1)/12) * q;
        
    end
    
end



for k = 1:K
    
    Q = 1/(2^(1/12) - 1);

    Nk(k) = round(Q * fs / F(k,1));

end


xlen = length(x);

U = zeros(K,length(x));

for k = 1:K
    
    str = "Computing SCFE " + num2str(k);
    disp(str);
        
    U(k,:) = SCFE(x,fs,F(k,1));
        
end

disp('Transform computed');

% display the GST
if 0
figure(1);
waterfall(abs(U));
colormap('default');
set(gca,'YDir','Reverse');

xticks(1:fs/2:length(x));
xticklabels(0:0.5:t);

ylim([1 K]);
yticks(1:12:K);
yticklabels(round(Nk(1:12:K)/fs,2));

ylabel('Hz');
xlabel('s');

%view([-45 45]);

rotate3d ON;

%print('KST_piano.png','-dpng');

end 


y = zeros(1,t*fs);


for k = 1:K

    % w = sineWAVE(F(k,1), length(x), fs);
    w = whitenoise(length(x));

    y = y + U(k,:) .* w;
    
    
    disp(sprintf('Channel %d added',k));
    
end


audiowrite('outfile.wav',y,fs);

disp('Resynth complete');



