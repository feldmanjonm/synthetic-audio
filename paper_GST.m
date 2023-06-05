

[S,T] = makeSYNTH('_chromatic/chromatic-piano.wav', 'chromatic', 60);

transformNOTE(T, 25, 10, 48000);

print('pianoGST.png', '-dpng');

