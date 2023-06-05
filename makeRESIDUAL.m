
%
% assumes makeSYNTHchromatic.m has been called
%

y = T(25,:) - S(25,:);

audiowrite('outfile.wav',y,fs);

