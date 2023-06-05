function y = half(x,N)

    t = N;

if length(x) > N
    
    tmp = reverse(x);
    
    x(1:t+1) = x(1:t+1) .* (0:t)/t;
    
end

y = reverse(x);