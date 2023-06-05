
clear all;

fs = 48000;


K = 88;

M = 15;

b0 = 27.5;


for p = 1:K
    
    for q = 1:M
        
        F(p,q) = b0 * 2^((p-1)/12) * q;
        
    end
    
end


for k = 1:K
    
    Q = 1/(2^(1/12) - 1);

    Nk(k) = round(Q * fs / F(k,1));

end


figure(1);
plot(Nk/fs);
xlim([ 1 88 ] );
xticks(1:12:88);
xticklabels(F(1:12:88,1));
xlabel('Hz');
ylabel('s');



