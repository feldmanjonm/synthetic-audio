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


FELDMAN-3000

call makeSYNTHassignNOTES.m to run the synthesizer

then call a "song file":

    scales.m
    chameleon.m
    blowininthewind.m
    pharawei.m
    african.m
    bfgroove.m
    etc.

Use a 2-track sound editor like Sound Studio or Audacity to view the audio and to play the output sound files.

regarding the mode, use "chromatic" mode with the sound files in _chromatic;
use "perc" mode with a percussive sound sample.  store the sound samples in _wav and _aif.
use a full path for the sound file name.

When creating a song file, the key thing to remember is that the left channel and the right channel must have the same length.


SIGNAL VIEWER

call GST.m for a full bandwidth signal analysis

call KST.m to analyse the bandwidth of the ff's of the piano


STEREO RE-SYNTH

For a stereo resynth, call KST_stereo.m or KST_realstereo.m

Note that you will have to supply your own .wav file for input.  Not every stereo re-synth sounds equally good.  I like the way Lay Down Sally by Eric Clapton sounds.

Note that the resynth can be configured in multiple ways, to use sine waves, triangle waves, square waves, and noise generators.


GENERAL NOTES

Note that in order to run this software, Matlab is required along with the signal processing toolbox.  Note also that the standard sample rate for this project is 48 kHz.  Other sample rates should work but have not been thoroughly tested.
