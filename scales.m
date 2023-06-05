    
%
% scale #1: sixths
%

x = zeros(2,slenq*15);


x(1,:) = [ B1q C2q D2q E2q Fs2q G2q A2q B2q C3q D3q E3q Fs3q G3q A3q B3q ];

x(2,:) = [ D1q E1q Fs1q G1q A1q B1q C2q D2q E2q Fs2q G2q A2q B2q C3q D3q ];


%x(1,:) = [ B2q C3q D3q E3q Fs3q G3q A3q B3q ];
%x(2,:) = [ D2q E2q Fs2q G2q A2q B2q C3q D3q ];


%x = resample(x, 96000, 48000);

audiowrite('scale01.wav', normalize(x'), 48000);


clear x;


%
% scale #2: thirds
%

x = zeros(2,slenq*(8+7));


x(1,:) = [ B1q C2q D2q E2q Fs2q G2q A2q B2q C3q D3q E3q Fs3q G3q A3q B3q ];

x(2,:) = [ G1q A1q B1q C2q D2q E2q Fs2q G1q A1q B1q C2q D2q E2q Fs2q G2q ];


%x = resample(x, 96000, 48000);

audiowrite('scale02.wav', x', 48000);


%
% scale #3: tenths
%

x = zeros(2,slenq*15);


x(1,:) = [ B2q C3q D3q E3q Fs3q G3q A3q B3q C4q D4q E4q Fs4q G4q A4q B4q ];

x(2,:) = [ G1q A1q B1q C2q D2q E2q Fs2q G2q A2q B2q C3q D3q E3q Fs3q G3q ];


%x = resample(x, 96000, 48000);

audiowrite('scale03.wav', x', 48000);


%
% scale #4: ionian arpeggiated chords
%

x = zeros(2,slenq*24/2);


p1L = [ re B2e re   re C3e re   re D3e re   re E3e re ];

p1R = [ G2e re D2e  A2e re E2e  B2e re Fs2e C3e re G2e ];


p2L = [ re  Fs3e re   re G3e re  re  A3e re  re re re ];
    
p2R = [ D3e re   A2e  E3e re B2e Fs3e re C3e G3q    re  ];


x(1,:) = [ p1L p2L ];

x(2,:) = [ p1R p2R ];


%x = resample(x, 96000, 48000);

audiowrite('scale04.wav', x', 48000);


%
% scale #5
%

x = zeros(2,slenq*8);


p1L = [ rq      A2e C3e rq       C3e E3e rq       E3e G3e  rq       G3q ];

p1R = [ G2e B2e rq      B2e D3e  rq     D3e Fs3e  rq       Fs3e A3e rq ];


x(1,:) = [ p1L ];

x(2,:) = [ p1R ];


%x = resample(x, 96000, 48000);

audiowrite('scale05.wav', x', 48000);



%
% scale #6 
%

x = zeros(2,slenq*8+length(rt));


p1L = [ G2q A2q B2q C3q D3q E3q Fs3q G3q rt];

% p1R = [ B2e G2e C3e A2e D3e B2e E3e C3e Fs3e D3e G3e E3e A3e Fs3e B3e G3e ];

p1R = [ rt B2t D3t G2t C3t E3t A2t D3t Fs3t B2t E3t G3t C3t Fs3t A3t D3t G3t B3t E3t A3t C4t Fs3t B3t D4t G3t ]; 
% up the octave, with bugs
% p1R = [ B3q G3q C4q A3q D4q B3q E4q C4q Fs4q D3q G4q E3q A4q Fs4q B4q G4q ];


x(1,:) = [ p1L ];

x(2,:) = [ p1R ];


% x = resample(x, 96000, 48000);

audiowrite('scale06.wav', x', 48000);


disp('%%%%%%%%%%%%%%%%%%%%');
disp('% 6 scales created %');
disp('%%%%%%%%%%%%%%%%%%%%');
