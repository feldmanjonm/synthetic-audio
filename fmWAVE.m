function x = fmWAVE(f,N,fs)

x = sin(sin(2*pi*f*(0:N-1)/fs));