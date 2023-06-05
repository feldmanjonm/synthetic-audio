
% tracks

t1 = [ G1q G1q G1q G1q ];

t2 = [ G2e G2e G2e G2e G2e G2e G2e G2e ];
 
t3 = [ G3t G3t G3t G3t G3t G3t G3t G3t G3t G3t G3t G3t ];

t4 = [ G4s G4s G4s G4s G4s G4s G4s G4s G4s G4s G4s G4s G4s G4s G4s G4s ];


%
% mixdown
%

a = 1/sqrt(2);

xL = [ a*(t1 + t3) ];

xR = [ a*(t2 + t4) ];

x = zeros(2,length(xL));

x(1,:) = xL;

x(2,:) = xR;


audiowrite('outfile.wav', x', fs);


