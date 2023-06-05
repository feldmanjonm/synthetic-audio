

endtime = -1;

[Nts,endtime] = midiInfo(readmidi('_/midi/midi-bbminorbulgar.mid'), 0);

notes = Nts(:,3);
times = Nts(:,5);


tempo = 60;

slen = round((60/tempo) * fs);


%%%

% vector of note times in samples

t = round(times .* fs);

t = t + 1;  % shift the times over by one sample

% tempo

t = round(t .* (0.85));


% zero out the output vector

z = zeros(1,t(length(t))+fs);

for i = length(notes):-1:1
    
    % splice in the note
    
    r = 1024;
    x
    % fetch the next note sample
    makeNOTE(x, k, fs, bf, t1, t2, lpf)
    s = makeNOTE(
    
    % put a fade on the sample
        
    s(slen-r+1:slen) = s(slen-r+1:slen) .* (r:-1:1)/(slen-r+1);
    
    s = normalize(s);
    
    z(t(i):(t(i)+slen-1)) = s;
    
end

z = normalize(z);

audiowrite('outfile.wav',z,fs);
