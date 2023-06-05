

% makeSynth;

% assignNotes;

endtime = -1;

[Nts,endtime] = midiInfo(readmidi('midi-bbminorbulgar.mid'), 0);

notes = Nts(:,3) - 36;
times = Nts(:,5);


for i = 1:length(notes)
    
    if (notes(i) < 1) || (notes(i) > 88)
        
        notes(i) = 1;
        
    end
    
end

%%%

%tempo = 60;

%qlen = (1/tempo)*60;

%slen = round(qlen * fs);

slen = fs;

%%%

% vector of note times in samples

t = round(times .* fs);

t = t + 1;  % shift the times over by one sample

% tempo

t = round(t .* (0.7));

% zero out the output vector

z = zeros(1,t(length(t))+fs);

for i = length(notes):-1:1
    
    % splice in the note
    
    r = 1024;
    
    % fetch the next note sample
    
    s = S(notes(i),1:slen);
    
    % put a fade on the sample
        
    s(slen-r+1:slen) = s(slen-r+1:slen) .* (r:-1:1)/(slen-r+1);
    
    s = normalize(s);
    
    z(t(i):(t(i)+slen-1)) = s;
    
end

z = normalize(z);

audiowrite('outfile.wav',z,fs);
