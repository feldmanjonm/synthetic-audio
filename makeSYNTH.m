
function [ S, T ] = makeSYNTH(infile, mode, tempo)

% infile is the input sound file with full path
% mode is either chromatic or perc
% tempo is the tempo of the music to be created

%
% basic functions = [ 'sine', 'square', 'sawtooth', 'quad', 'whitenoise' ]
%

bf = 'fm';

%
% boolean variable that toggles the low pass filters
%

lpf = 1;


%
% read the sound file
%


[xin, fs] = audioread(infile);
x = xin(:,1);
x = x';

%
% tempo determines sample length
% tempo >= 60 bpm

slen = round(60/tempo * fs);

%
% chromatic expects an input file with 88 successive 
% notes in it at fs = 48000
%
% perc is just a single 1 second wav file
%

if strcmp(mode,'chromatic')
    
    x = x(1:fs*88);    
    
else  % 'perc'
    
    x = [ x zeros(1,fs-length(x)) ];
    x = x(1:fs);

end

%
%  T contains the original samples
%  S contains the synthesized samples
%

T = zeros(88,slen);


for k = 1:88
     
   if strcmp(mode,'perc')
       
        T(k,:) = x(1:slen);
        
   else  % 'chromatic'
       
        u = x((k-1)*fs+1:k*fs); 
        
        T(k,:) = u(1:slen); 
   end
   
   T(k,:) = normalize(T(k,:));
      
end

if 0
disp('Input sample matrix T created');
end

%
% synthesize 88 samples
%

for k = 1:88
        
    S(k,:) = makeNOTE(T(k,:),k,fs,bf,slen/8,slen/4,lpf);
      
    S(k,:) = normalize(S(k,:));
    
end

if 0
disp('Synthesizer S created');
end

if 0
figure(1);
subplot(311);
title(sprintf('input audio: %s', infile));
plot(T(k,:));
ylim([ -1 1 ]);
xlim([ 0 slen ]);

subplot(313);
title('output audio, time domain');
plot(S(k,:));
ylim([ -1 1 ]);
xlim([ 0 slen ]);
end


