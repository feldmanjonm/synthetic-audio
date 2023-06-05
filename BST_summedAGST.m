
%
% GST signal transform with K channels along the fundamental frequency axis
%

clear all;

fs = 48000;

t = 3;

infile = '_wav/PianoA110-3s.wav';
[xin, fs] = audioread(infile);
%x = xin(:,1) + xin(:,2);
x = xin(:,1);
x = x';

x = [ x zeros(1,t*fs-length(x))];
x = x(1:t*fs);


K = 37;

M = 15;

b0 = 27.5 / 8;


for p = 1:K
    
    for q = 1:M
        
        F(p,q) = b0 * 2^((p-1)/12) * q;
        
    end
    
end


xlen = length(x);

A = zeros(K, M, length(x));

for k = 1:K
    
    for m = 1:M
        
        str = sprintf('Computing SCFE (%i,%i)', k, m);
        disp(str);
        
        A(k,m,:) = SCFE(x,fs,F(k,m));
        
    end
    
end

%
% sum over the M direction: sum together the harmonics
%

S = sum(A(:,:,1:fs),2);

S = squeeze(S);
 

figure(1);
waterfall(abs(S));
colormap('default');
set(gca,'YDir','Reverse');

xticks(1:fs/2:length(x));
xticklabels(0:0.5:t);

ylim([1 K]);
yticks(1:12:K);
yticklabels(round(F(1:12:K,1),3));

ylabel('Hz');
xlabel('s');

% view([-45 45]);

rotate3d ON;

% print('GST_piano.png','-dpng');

y = [];

for k = 1:K
    
    env = abs(SCFE(x, fs, F(k,m)));

    w = sineWAVE(F(k,m), length(env), fs);

    s = env .* w;
    
    y = y + s;
    
end

audiowrite('outfile.wav',y,fs);


    
