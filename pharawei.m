
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%                             %');
disp('%        Phar-a-wei           %');
disp('%                             %');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('                               ');

%
% Phar-a-wei in Sp8ce
%

p1_L = [ Bf3e F3e D3e Bf3e F3e D3e Bf3e F3e ];

p2_L = [ C4e Af3e Ef3e C4e Af3e Ef3e C4e Af3e ];

p1_R = [ Bf2e re re F3e rq Bf2e re ];

p2_R = [ Af2e re re Ef3e rq Af2e re ];


p3_L = p1_L;

p4_L = [ Bf3e Gf3e Df3e Bf3e Gf3e Df3e Bf3e Gf3e ];

p3_R = p1_R;

p4_R = [ Gf2e re re Df3e rq Gf2e re ];

p5_L = [ Gf3t Df3t Bf2t Af3t Ef3t C3t Bf3q rq rq ];

p5_R = [ Gf2q Af2q Bf2q rq rq ];

p6_L = [ Bf3e C4e D4e Ef4e F4e G4e A4e Bf4e ];

p6_R = [ D3e Ef3e F3e G3e Af3e Bf3e C4e D4e ];

p7_L = [ Ef3t G3t Bf3t F3t A3t C4t Bf3q rq rq];

p7_R = [ Ef2q F2q Bf2q rq rq];

intro_L = [ p1_L p2_L p3_L p4_L p1_L p2_L p3_L p4_L p5_L p5_L p5_L p5_L ];
intro_R = [ p1_R p2_R p3_R p4_R p1_R p2_R p3_R p4_R p5_R p5_R p5_R p5_R ]; 

sec1_L = [ p6_L p7_L p7_L p7_L p6_L p7_L p7_L p7_L p7_L ];
sec1_R = [ p6_R p7_R p7_R p7_R p6_R p7_R p7_R p7_R p7_R ];

x_L = [  intro_L  sec1_L ];
x_R = [  intro_R  sec1_R ];

x = zeros(2,length(x_L));

x(1,:) = x_L;
x(2,:) = x_R;

audiowrite('pharawei.wav', x', 48000);

