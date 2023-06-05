function y = rdv(x)

x = reverse(x);

for p = 1:3
    
    i = randi(length(x));
    
    j = randi(length(x));

    x = swap(x, i, j);
    
end

y = x;

