
clear all;

tempo = 120;

% 
% input sound file
%
% chromatic scales are found in _chromatic/
% percussion sounds are found in _wav/
%

%
% chromatic option: piano, violin, epno
%
% perc options: rimshot, 
%

infile = '_chromatic/chromatic-piano.wav';


%
% mode = [ 'chromatic', 'perc' ]
%

mode = 'chromatic';

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
% make sixteenth notes
%

S = makeSYNTH(infile, mode, 4*tempo);

[ sx, slens ] = size(S);

assignNOTESsixteenth;

clear S;


%
% make sixteenth notes
%

S = makeSYNTH(infile, mode, 3*tempo);

[ sx, slent ] = size(S);

assignNOTEStriplet;

clear S;

%
% make rests
%

rq = zeros(1,slenq);
re = zeros(1,slene);
rs = zeros(1,slens);

%
% call scales.m, blowininthewind.m, chameleon.m
%