
fs = 48000;

infile = '_wav/rimshot.wav';
[xin, fs] = audioread(infile);
%x = xin(:,1) + xin(:,2);
x = xin(:,1);
x = x';

x = [ x zeros(1,fs-length(x))];
x = x(1:fs);


K = 88;

M = 20;

for p = 1:K
    
    for q = 1:M
        
        F(p,q) = 27.5 * 2^((p-1)/12) * q;
        
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
imagesc(abs(U));
%colormap('default');
%set(gca,'YDir','Reverse');

xticks(1:fs/5:length(x));
xticklabels(0:0.2:length(x)/fs);

ylim([1 88]);
yticks(1:12:88);
yticklabels(round(F(1:12:88,1),1));

ylabel('Hz');
xlabel('s');

%view([-45 45]);

%rotate3d ON;

print('GST_rimshot.png','-dpng');
