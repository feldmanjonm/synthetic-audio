
%
% take one fs length samples in S and make them of length fs/2
%

S = S(:,1:fs/2);

for i = 1:88
    
    s = S(i,:);
    
    s = reverse(s);
    
    % now shape the front of s
    
    t = fs/8;
    
    s(1:t+1) = s(1:t+1) .* (0:t)/t; 

    S(i,:) = s;
    
end

