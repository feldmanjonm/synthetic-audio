
%
% triads
%
FAf = 0.5*(F3e+Af3e);

DBf = 0.5*(D3e+Bf3e);

BfD = 0.5*(Bf2q+D3q);

%
% sec1
%

p1_L = [ rq    FAf DBf   rq     FAf DBf ];

p1_R = [ Bf1q  rq        Bf1q   rq    ];


p2_L = [ rq    FAf DBf   rq     FAf DBf ];

p2_R = [ BfD  rq        BfD   rq    ];


sec1_L = [ p1_L p1_L p2_L p2_L ]; 

sec1_R = [ p1_R p1_R p2_R p2_R ];


p3_L = [ D4e Ef4e F4e G4e F4e Ef4e D4e C4e ];

p3_R = [ rq rq rq rq ];


p4_L = [ p1_L p2_L ];

p4_R = [ p1_R p2_R ];



x_L = [ sec1_L sec1_L p3_L p4_L p3_L p4_L ];

x_R = [ sec1_R sec1_R p3_R p4_R p3_R p4_R ];



%
% write to file
%

x = zeros(2,length(x_L));

x(1,:) = x_L;
x(2,:) = x_R;

audiowrite('BfGroove.wav', x', 48000);
