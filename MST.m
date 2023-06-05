

fs = 48000;

t = 3;

k = 25;

infile = '_wav/PianoA110-3s.wav';
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


xlen = length(x);

U = zeros(M,length(x));

for m = 1:M
    
    str = "Computing SCFE " + num2str(m);
    disp(str);
        
    U(m,:) = SCFE(x,fs,F(k,m));
        
end

disp('Transform computed');


figure(1);
waterfall(abs(U));
colormap('default');
set(gca,'YDir','Reverse');

xticks(1:fs/2:length(x));
xticklabels(0:0.5:length(x)/fs);

ylim([1 M]);
yticks(1:2:M);
yticklabels(round(F(k,1:2:M),2));

ylabel('Hz');
xlabel('s');

%view([-45 45]);

%rotate3d ON;

print('MST_piano_phase.png','-dpng');
