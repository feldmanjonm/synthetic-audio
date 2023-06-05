function y = sigmoid(x)


y = exp(x)./(1 + exp(x));

y = (y - 0.5) * 2;