function y = normalize(x)

a = max(x);
b = min(x);

if a > b
    
    y = (x ./ a);
    
else
    
   y = (x ./ b);
   
end




