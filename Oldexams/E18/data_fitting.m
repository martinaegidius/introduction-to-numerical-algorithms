load('data.mat')

A = [ones(length(xk),1),xk,cos(3*xk),exp(xk)];
c = (A'*A)\(A'*yk);

F = c(1)+c(2)*xk+c(3)*cos(3*xk)+c(4)*exp(xk);
err = sum(abs(yk-F))