
function y = SCFE(x,fs,fk)

%
% x is the input signal
% fs is the sample rate
% fk is the centre frequency
%

%
% we compute the window length Nk
%


Q = 1/(2^(1/12) - 1);

Nk = round(Q * fs / fk);


xlen = length(x);

y = zeros(1,xlen);


theta = 0;

dtheta = (-2*pi) .* fk ./ fs;


%
% frequency estimates for the first N samples
%

f = x(1);

y(1) = f;

if xlen < Nk
    
    for t = 2:xlen
        
        theta = theta + dtheta;
    
        f = f + exp(j*theta) .* x(t);
    
        y(t) = f;
        
    end
    
else

for t = 2:Nk
    
    theta = theta + dtheta;
    
    f = f + exp(j*theta) .* x(t);
    
    y(t) = f;

end;

%
% frequency estimates for the rest of the input signal
%


for t = Nk+1:xlen
    
    theta = theta + dtheta;
    
    
    a = exp(j*theta);
        
    phi = theta - (dtheta .* Nk);
    
    
    b = exp(j * phi);
            
    ft = f + a.*x(t) - b.*x(t-Nk);

    y(t) = ft;
    
    f = ft;
    
end

end

y = y ./ Nk;



