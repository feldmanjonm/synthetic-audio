function y = swap(x, i, j)

tmp = x(i);

x(i) = x(j);

x(j) = tmp;

y = x;