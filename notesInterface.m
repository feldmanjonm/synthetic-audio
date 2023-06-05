
tempo = 60;

Sq = makeSYNTH2(tempo);

disp('Quarter notes created');


tempo = 120;

Se = makeSYNTH2(tempo);

disp('Eighth notes created');


tempo = 240;

Ss = makeSYNTH2(tempo);

disp('Sixteenth notes created');


clear x y;

k = 25;


x = [ Se(25,:) Se(27,:) Ss(29,:) Ss(30,:) Se(32,:) ];


audiowrite('outfile.wav', x, fs);



