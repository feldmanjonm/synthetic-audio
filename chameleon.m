

%
% Chameleon
%

pickup_L = [ G1e Af1e A1e ];

p1_L = [ Bf1e rs F2s re Af2e re C2e Df2e D2e Ef2e rs Bf2s re Df3e re G1e Af1e A1e ];

p1_R = p1_L;

p1_R_pickup = [ rq rq rq rq rq rq re G1e Af1e A1e ];


bar1 = [ Bf3s Bf3s re Af3s Af3s re Bf3s Bf3s re Df4q ];

bar2 = [ Bf3e re rq rq Bf3s Af3s F3s Af3e ];

bar3 = [ rs Bf3e rq rq re Df4e ];

bar4 = [ re Ef4e rq rq rq ];


mel = [ bar1 bar2 bar3 bar4 ];
    

x_L = [ pickup_L  p1_L         p1_L  p1_L ];

x_R = [ re re re  p1_R_pickup  mel  ];


x = zeros(2,length(x_L));
x(1,:) = x_L;
x(2,:) = x_R;


audiowrite('chameleon.wav',x',48000);
