


fs = 48000;

%
% machine performer
%

lydian = [ 0 2 4 6 7 9 11 ];
ionian = [ 0 2 4 5 7 9 11 ];
mixolydian = [ 0 2 4 5 7 9 10 ];
dorian = [ 0 2 3 5 7 9 10 ];
aeolian = [ 0 2 3 5 7 8 10 ];
locrian = [ 0 1 3 5 7 8 10 ];

E = 7;
G = 11;

p1 = [ 0 2 4 0 ];

p2 = [ 4 5 7 4 ];

p3 = [ 9 7 4 9 ];

p4 = [ 7 9 7 4 ];


p5 = revp(p1);

p6 = revp(p2);

p7 = revp(p3);

p8 = revp(p4);


q1 = [ 9 7 5 7 ];

q2 = [ 12 9 7 9 ];


p = [ p1 p5 p2 p6 p3 p7 p4 p8 ];

q = [ q1 q2 revp(q2) revp(q1) ];

q = [ q q ];

%
% has AABA form
%

f = [ p p q p ];

f = E + f;

%
% end Machine Performer
%

notes = f;


%notes = [ 29 30 32 34 36 37 39 41 42 44 46 48 ];

times = 1:length(notes);

for i = 1:length(notes)
    
    if (notes(i) < 1) || (notes(i) > 88)
        
        notes(i) = 1;
        
    end    
end

z = [];


for i = 1:length(notes)
            
    y = S(notes(i),1:fs/4);
    
    z = [ z y ];
    
end

z = normalize(z);

audiowrite('outfile.wav',z,fs);

