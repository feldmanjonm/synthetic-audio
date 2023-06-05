
%
% intro
%


p1_L = [ rq 0.7*(G3q+B2q) rq 0.7*(G3q+B2q) ];

p1_R = [ G1e G1e rq rq rq ];


intro_L = [ p1_L p1_L p1_L p1_L ];
intro_R = [ p1_R p1_R p1_R p1_R ];


%
% master composition
%

x_L = [ intro_L ];
x_R = [ intro_R ];


%
% write out to file
%

x = zeros(2,length(x_L));

x(1,:) = x_L * 0.7;
x(2,:) = x_R;

audiowrite('reggae.wav', x', 48000);

