
%
% triads
%
CE = 0.5*(C3e+E3e);

DFs = 0.5*(D3e+Fs3e);

G = 0.5*(B2q+G3q);

%
% sec1
%

p1_L = [ B3e G3e D3q B3e G3e D3e B3e CE G3e DFs A3e G rq ];

p1_R = [ rq rq rq rq rq rq rq rq ];


p2_L = [ B3e G3e D3q B3e G3e D3e B3e CE G3e DFs A3e G ];

p2_R = [ G2h   G2h   C2q D2q G2q ]; 


sec1_L = [ p1_L p2_L ]; 

sec1_R = [ p1_R p2_R ];


%
% sec2
%

pickup1_L = [ rs B3s B3e B3e ];  
    
pickup1_R = [ rs G3s G3e G3e ];


G3 = 0.5*(G3e+B3e);

A3 = 0.5*(A3s+C4s);

B3 = 0.5*(B3e+D4e);


b1_L = [ G3e rs A3s re B3e re ];

b1_R = [ G2e rs D3s re G2e re ];


s2_L = [ b1_L ]; 

s2_R = [ b1_R ];



%
% put sections together
%

x_L = [ sec1_L pickup1_L s2_L ];

x_R = [ sec1_R pickup1_R s2_R ];



%
% write to file
%

x = zeros(2,length(x_L));

x(1,:) = x_L;
x(2,:) = x_R;

audiowrite('african.wav', x', 48000);
