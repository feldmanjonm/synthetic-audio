
%
% GST signal transform with K channels along the fundamental frequency axis
%


fs = 48000;


% length of sample to be analysed in seconds

t = 235;


infile = '_wav/_clapton/laydownsally.wav';
[xin, fs] = audioread(infile);

xL = xin(:,1);
xR = xin(:,2);

xL = [ xL zeros(1,t*fs-length(xL))];
xL = xL(1:t*fs);

xR = [ xR zeros(1,t*fs-length(xR))];
xR = xR(1:t*fs);


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


U = zeros(K,length(xL));
V = zeros(K,length(xR));

for k = 1:K
    
    str = "Computing SCFE " + num2str(k);
    disp(str);
        
    U(k,:) = SCFE(xL,fs,F(k,1));
    V(k,:) = SCFE(xR,fs,F(k,1));
    
end

disp('Transform computed');

% display the GST
if 1

figure(1);

subplot(121);
waterfall(abs(U(:,fs+1:2*fs)));
colormap('default');
set(gca,'YDir','Reverse');
xticks(1:fs/2:length(xL));
xticklabels(0:0.5:t);
ylim([1 K]);
yticks(1:12:K);
yticklabels(round(Nk(1:12:K)/fs,2));
ylabel('Hz');
xlabel('s');

subplot(122);
waterfall(abs(V(:,fs+1:2*fs)));
colormap('default');
set(gca,'YDir','Reverse');
xticks(1:fs/2:length(xR));
xticklabels(0:0.5:t);
ylim([1 K]);
yticks(1:12:K);
yticklabels(round(Nk(1:12:K)/fs,2));
ylabel('Hz');
xlabel('s');

% view([-45 45]);

% rotate3d ON;

% print('KST_piano.png','-dpng');

end 


yL = zeros(1,t*fs);

yR = zeros(1,t*fs);

for k = 1:K
    
    s = sineWAVE(F(k,1), length(xL), fs);
    
    w = sawtoothWAVE(F(k,1), length(xR), fs);
    
    %w = whitenoise(length(x));

    yL = yL + abs(U(k,:)) .* s;
    
    yR = yR + abs(V(k,:)) .* w;
    
    disp(sprintf('Channel %d added',k));
    
end

y = zeros(2,length(xL));

% put a one second fade out on both channels

yL((t-1)*fs+1:t*fs) = yL((t-1)*fs+1:t*fs) .* (fs:-1:1) / fs;
yR((t-1)*fs+1:t*fs) = yR((t-1)*fs+1:t*fs) .* (fs:-1:1) / fs;

y(1,:) = 0.5*yL;
y(2,:) = yR;

audiowrite('outfile.wav',y',fs);

disp('Resynth complete');



