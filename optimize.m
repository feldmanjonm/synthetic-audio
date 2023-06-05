 
p1L = [ re G2e B2e D3e re G2e B2e D3e ];
    
p1R = [ G1q rq G1q rq ];


p2L = [ re C3e E3e G3e re D3e Fs3e A3e ];

p2R = [ C1q rq D1q rq ];


xL = [ p1L p2L p1L p2L p1L p2L p1L p2L ];

xR = [ p1R p2R p1R p2R p1R p2R p1R p2R ];

x = zeros(2, length(xL));

x(1,:) = xL;

x(2,:) = xR;


audiowrite('outfile.wav',x',48000);







