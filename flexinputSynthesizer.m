
K = 88;

M = 20;

for p = 1:K
    
    for q = 1:M
        
        F(p,q) = 27.5 * 2^((p-1)/12) * q;
        
    end
    
end

% E164 corresponds to K = 32

infile = '_wav/cowbell.wav';
[xin, fs] = audioread(infile);
x = xin(:,1);
x = x';

%
% take first harmonic from an input sound
%

ff = 25;

y = zeros(1, length(x));

for m = 1:M
    
    fk = F(ff, m);

    Q = round(1/(2^(1/12) - 1));

    Nk = round(Q * fs / fk);


    env = abs(SCFE(x, fs, fk));

    sw = sineWAVE(fk, length(env), fs);
    
    h = env .* sw; 
    
    y = y + h;
    
end

out = 1/max(y) .* y;

audiowrite('outfile.wav', out, fs);


figure(2)
plot(out);

xlim([0 length(env)]);
xticks(0:fs/10:length(x));
xticklabels(0:1:length(x));
xlabel('ms');


%subplot(312);
%plot(angle(x));
%xlim([0 length(x)]);
%title('Input signal: phase');
%xticks(0:4800:length(x));
%xticklabels(0:1:length(x));
%xlabel('seconds');

%subplot(313);
%plot(out);
%xlim([0 length(out)]);
%ylim([-1.1 1.1]);
%title('Output signal');
%xticks(0:4800:length(out));
%xticklabels(0:1:length(out));
%xlabel('seconds');

