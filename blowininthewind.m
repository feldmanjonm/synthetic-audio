
%
% melody #1: Dylan
%


bar124_L = [ D3q  D3e D3e E3q E3e E3e D3q B2e A2e G2q rq ];
bar124_R = [ B2q  B2e B2e C3q  C3e C3e B2q  D2e C2e B1q rq ];

bar528_L = [ D3q  D3e D3e E3q  D3e C3e D3q rq G3s Fs3s E3s D3s C3s B2s A2s G2s ];
bar528_R = [ B2q  B2e B2e C3q  B2e E2e B2q rq B2s A2s  G2s Fs2s E2s D2s C2s B1s ];

phrase1_L = [ bar124_L bar528_L ];
phrase1_R = [ bar124_R bar528_R ];


bar9212_L = [ D3q D3e D3e E3q E3e E3e D3q B2e A2e G2q rq ];
bar9212_R = [ B2q B2e B2e C3q C3e C3e B2q D2e C2e B1q rq ];


bar13216_L = [ D3q D3e D3e C3q C3e C3e A2q rq D2t G2t B2t G2t B2t D3t ];
bar13216_R = [ B2q B2e B2e E2q E2e E2e Fs2q rq B1t D2t G2t D2t G2t B2t ];

phrase2_L = [ bar9212_L bar13216_L ];
phrase2_R = [ bar9212_R bar13216_R ];


bar17220_L = [ D3q  D3e D3e E3q E3e E3e D3q B2e A2e G2q rq ];
bar17220_R = [ B2q  B2e B2e C3q  C3e C3e B2q  D2e C2e B1q rq ];

bar21224_L = [ D3q  D3e D3e E3q  D3e C3e D3q rq rq re B2e ];
bar21224_R = [ B2q  B2e B2e C3q  B2e E2e B2q rq rq re G2e ];

phrase3_L = [ bar17220_L bar21224_L ];
phrase3_R = [ bar17220_R bar21224_R ];


bar25228_L = [ C3q  C3e B2e  A2q re A2e  B2e B2e B2e A2e  G2q re B2e ];
bar25228_R = [ E2q  E2e D2e  C2q re C2e  D2e D2e D2e C2e  B1q re D2e ];

bar29232_L = [ C3q C3e B2e A2e A2e G2e Fs2e G2q rq rq rq ];
bar29232_R = [ E2q E2e D2e C2e C2e B1e A1e B1q rq rq rq ];

phrase4_L = [ bar25228_L bar29232_L ];
phrase4_R = [ bar25228_R bar29232_R ];

x_L = [ phrase1_L phrase2_L rq ];
x_R = [ phrase1_R phrase2_R rq ];


x = [ x_L; x_R ];


audiowrite('blowininthewind.wav', x', 48000);

