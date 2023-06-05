function y = il(a,b)

% assumption: a and b are row vectors, 
%             a and b have the same length
              
A = [ a; b ];

y = A(:);

y = y';