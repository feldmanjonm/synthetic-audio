
function y = crossFADE2(u,v,N)

N = N + mod(N,2);

M = N / 2;

p = [ u v ];

idx = length(u)-M+1:length(u)+M;

p(idx) = p(idx) .* (1:N)/N;

q = [ u v ];

q(idx) = q(idx) .* (N:-1:1)/N;

figure(1);
subplot(211);
plot(p(idx));
subplot(212);
plot(q(idx));

pause;
p(idx) = 1/sqrt(2) * p(idx) + 1/sqrt(2) * q(idx);

y = p;


