
%
% create major scale in 6ths
%

x(1,:) = [ Ef4 F4  G4  Af4  Bf4  C5   D5  Ef5 ];

x(2,:) = [ G3  Af3 Bf3  C4  D4   Ef4  F4  G4 ];


audiowrite('outfile01.wav', x', 48000);


clear x;

x = zeros(2,slen*8);


x(1,:) = [ G4  Af4 Bf4  C5  D5   Ef5  F5  G5 ];

x(2,:) = [ Ef4 F4  G4  Af4  Bf4  C5   D5  Ef5 ];


audiowrite('outfile02.wav', x', 48000);


clear x;

x = zeros(2,slen*8);


x(1,:) = [ G4  Af4 Bf4  C5   D5   Ef5  F5   G5 ];

x(2,:) = [ Bf3  C4  D4  Ef4  F4   G4   Af4  Bf4 ];


audiowrite('outfile03.wav', x', 48000);

