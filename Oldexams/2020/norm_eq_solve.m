x = [-2,-1,0,1,2]';
y = [0,15,25,50,110]';
A = [ones(numel(x),1),x,(x.^2-1)];
c = (A'*A)\(A'*y);

F = c(1)+c(2)*x+c(3)*(x.^2-1);
absErr = norm(y-F)
