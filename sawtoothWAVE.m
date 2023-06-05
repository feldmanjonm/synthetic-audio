function x = sawtoothWAVE(f,N,fs)

x = sawtooth(2*pi*f*(0:N-1)/fs);