x = [-1,-1/2,0,1/2,1]';
y = [-1,0,1,2,1]';
A = [sin(pi*x),cos(pi*x)];
c = (A'*A)\(A'*y);


F = c(1)*sin(pi*x)+c(2)*cos(pi*x);
err = abs(y-F)
errSum = sum(err)

% xx=linspace(min(x),max(x),100);
% yy = c(1)*sin(pi*xx)+c(2)*cos(pi*xx);
% plot(xx,yy)
% hold on 
% plot(x,y,'rx')