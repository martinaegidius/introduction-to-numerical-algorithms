F = @(x)2*x-2+4*x^3;
dF = @(x)2+12*x^2;

nmax = 4;
x0 = 1;
X = zeros(nmax+1,1);
X(1) = x0;

for i=2:nmax+1
    X(i) = X(i-1)-F(X(i-1))/dF(X(i-1))
end
