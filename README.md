# synthetic-audio

A synthesizer, a signal "time-frequency" analyser, and a stereo re-synthesis algorithm based on my master's thesis work

%
% copyright Cosmic Signals 2023
%
% This technology is available for use for non-commercial purposes
%

Author: Jonathan Feldman
Company: Cosmic Signals
MIT Graduation date: January 2021
Date released: June 5, 2023
Email: info@cosmicsignals.com
web site: http://www.jonfeldman.ca


call makeSYNTHassignNOTES.m to run the synthesizer

then call a "song file":

    scales.m
    chameleon.m
    blowininthewind.m
    pharawei.m
    etc.

call GST.m for a full bandwidth signal analysis

call KST.m to analyse the bandwidth of the ff's of the piano


For a stereo resynth, call KST_stereo.m or KST_realstereo.m


Note that in order to run this software, Matlab is required along with the signal processing toolbox.  Note also that the standard sample rate for this project is 48 kHz.  Other sample rates should work but have not been thoroughly tested.


