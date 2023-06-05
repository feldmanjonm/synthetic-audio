
%
% GST signal transform with K channels along the fundamental frequency axis
%

fs = 48000;

t = 3;

infile = '_wav/PianoA110-3s.wav';
[xin, fs] = audioread(infile);
%x = xin(:,1) + xin(:,2);
x = xin(:,1);
x = x';

x = [ x zeros(1,t*fs-length(x))];
x = x(1:t*fs);

%
% K is 10 octaves from 27.5 Hz plus 8 more frequency channels
% bandwidth is [ 27.5, 44701 ] Hz
%

K = 10*12 + 8;

M = 15;

b0 = 27.5;


for p = 1:K
    
    for q = 1:M
        
        F(p,q) = b0 * 2^((p-1)/12) * q;
        
    end
    
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

figure(1);
waterfall(abs(U));
colormap('default');
set(gca,'YDir','Reverse');

xticks(1:fs/2:length(x));
xticklabels(0:0.5:t);

ylim([1 K]);
yticks(1:12:K);
yticklabels(round(F(1:12:K,1),1));

ylabel('Hz');
xlabel('s');

% view([-45 45]);

rotate3d ON;

% print('GST_piano.png','-dpng');

