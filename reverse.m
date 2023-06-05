function y = reverse(x)

%
% reverse the elements in x
%

y = zeros(1,length(x));

for i = 1:length(x)

    y(length(x)-i+1) = x(i);
    
end


    
