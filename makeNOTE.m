function y = makeNOTE(x, k, fs, bf, t1, t2, lpf)

%
% x is the input signal
% k is the piano note number
% fs is the sample rate
% bf is a string that des%cribes the basis functions to be used
% t1 and t2 are the times in samples used for envelope shaping
% lpf is a boolean variable the toggles the low pass filters
% synth modes = 
%   [ 'sine', 'suare', 'sawtooth', 'quad', 'whitenoise' ]


%%% AGST Frequency Matrix %%%

K = 88;

M = 10;

for p = 1:K
    
    for q = 1:M
        
        F(p,q) = 27.5 * 2^((p-1)/12) * q;
        
    end
    
end

%%% Synthesis Loop %%%

y = zeros(1,length(x));


for m = 1:M

    env = abs(SCFE(x, fs, F(k,m)));

    % try to smooth out the envelope
    
    % env = filter([ 1 ],[ 0.9 0.8 ], env);
    
    if strcmp(bf,'square')
        
        w = squareWAVE(F(k,m), length(env), fs);
        
        if lpf
        w = filter([ 0.7 ],[ -0.3 ], w);
        end
        
    elseif strcmp(bf,'sawtooth')
            
        w = sawtoothWAVE(F(k,m), length(env), fs);
        
        if lpf
        w = filter([ 0.7 ],[ -0.3 ], w);
        end
        
    elseif strcmp(bf,'whitenoise')
        
        w = whitenoise(length(env));
        
        if lpf
        w = filter([ 0.7 ],[ -0.3 ], w);
        end
        
    elseif strcmp(bf, 'quad')
        
        w = cosWAVE(F(k,m), length(env), fs) .* sineWAVE(F(k,m), length(env), fs);
        
    elseif strcmp(bf, 'fm')
        
        w = sin(sineWAVE(F(k,m), length(env), fs));

        if lpf
        w = filter([ 0.7 ],[ -0.3 ], w);
        end
        
    else % defaults to 'sine'
        
        w = sineWAVE(F(k,m), length(env), fs);
      
    end
    
    
    h = env .* w; 
    
    y = y + h;  
    
end

%
% envelope shaping
%
            
y(1:t1+1) = y(1:t1+1) .* (0:t1)./t1;
    
y = reverse(y);
    
y(1:t2+1) = y(1:t2+1) .* (0:t2)./t2;
    
y = reverse(y);
    
    



