function y = crossfade(u,v,N)

% input signals u and v
% length of crossfade N

%
% concatenates u and v with a linear crossfade of N samples
%
%
% assumes N > len(u) + len(v)
%


% make sure N is even

N = N + mod(N,2);


% we cross fade in and out with N/2 samples

M = N/2;


% concatenate the input signals

y = [ u v ];


% "crossfade" signals

a = v(1:M);

s = size(a);
if s(1) ~= 1
    a = a';
end

p = [ u a ];


b = u(length(u)-M+1:length(u));

s = size(b);
if s(1) ~= 1
    b = b';
end

q = [ b v ];

%figure(1);
%subplot(211);
%plot(p);

%subplot(212);
%plot(q);


% fade out the last M samples of p 
% with the first M samples of q

p = reverse(p);

p(1:N) = p(1:N) .* (1:N)/N;

p = reverse(p);


q(1:N) = q(1:N) .* (1:N)/N;

figure(1);
subplot(211);
plot(p);
subplot(212);
plot(q);

pause;

%
% sum p and q back together to make y
%

y = zeros(1,length(u) + length(v));

y(1:length(u)+M) = y(1:length(u)+M) + p;

y(length(u)-M+1:length(u)+length(v)) = y(length(u)-M+1:length(u)+length(v)) + q;



