function y = rev2(x)

% x must have even length

y = [];

for k = 1:2:length(x)-1
    
    y = [y x(k+1) x(k)];
    
end

