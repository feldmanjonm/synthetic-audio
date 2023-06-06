
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('%                             %');
disp('%       FELDMAN-3000          %');
disp('%                             %');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('                               ');
disp('      Set your tempos...       ');
disp('                               ');

clear all;


% 
% input sound file
%
% chromatic scales are found in _chromatic/
% percussion sounds are found in _wav/
%
% chromatic option: piano, epno
%
% perc options: rimshot, 
%

infile = '_chromatic/chromatic-bassoon.wav';


%
% mode = [ 'chromatic', 'perc' ]
%

mode = 'chromatic';


%
% the only supported tempos are 60, 120, & 240
%

tempo = 120;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code starts here                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%
% whole notes 
%

if tempo == 240
    
S = makeSYNTH(infile, mode, tempo/4);

[ sx, slenw ] = size(S);

assignNOTESwhole;

clear S;

end

%
% attempt to make half notes
%
%

if tempo == 120 || tempo == 240
    
S = makeSYNTH(infile, mode, tempo/2);

[ sx, slenh ] = size(S);

assignNOTEShalf;

clear S;

end


%
% make quarter notes 
%

S = makeSYNTH(infile, mode, tempo);

[ sx, slenq ] = size(S);

assignNOTESquarter;

clear S;


%
% make eighth notes
%

S = makeSYNTH(infile, mode, 2*tempo);

[ sx, slene ] = size(S);

assignNOTESeighth;

clear S;


%
% make triplet notes
%

S = makeSYNTH(infile, mode, 3*tempo);

[ sx, slent ] = size(S);

assignNOTEStriplet;

clear S;


%
% make sixteenth notes
%

S = makeSYNTH(infile, mode, 4*tempo);

[ sx, slens ] = size(S);

assignNOTESsixteenth;

clear S;


%
% make rests
%

% rw = zeros(1,slenw);
% rh = zeros(1,slenh);
rq = zeros(1,slenq);
re = zeros(1,slene);
rs = zeros(1,slens);
rt = zeros(1,slent);

%
% call scales.m, blowininthewind.m, chameleon.m, pharawei.m
%
