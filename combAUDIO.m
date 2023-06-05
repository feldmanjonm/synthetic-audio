
K = 88;

M = 10;

for p = 1:K
    
    for q = 1:M
        
        F(p,q) = 27.5 * 2^((p-1)/12) * q;
        
    end
    
end


%
% load the sample file
%

infile = '_wav/birthday.wav';
[xin, fs] = audioread(infile);
x = xin(:,1);
x = x';

n = round(length(x)/fs);

x = x(1:n*fs);

y = zeros(1,n*fs);

for k = 1:K

    env = abs(SCFE(x, fs, F(k,1)));

    sw = sineWAVE(F(k,1), length(env), fs);
    
    h = env .* sw; 
    
    y = y + h;  
    
end

y = normalize(y);

figure(1);
subplot(211);
plot(x);

subplot(212);
plot(y);

audiowrite('outfile.wav',y,fs);


    
