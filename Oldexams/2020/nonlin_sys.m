
X = [1,2]';
kmax = 8;

solution = Newtonsys(@(X)funFdF(X),X,kmax);
X_star = solution(:,end);

err = nan(1,length(solution)-1);
for i = 1:kmax-1
    err(i) = norm(solution(:,i)-X_star);
end
semilogy(1:kmax-1,err)
grid('on')
xlabel('number of iterations k')
ylabel('log of 2-norm of absolute error')
    


function [f,dF] = funFdF(X)
f = [X(1)^2+2*X(2)-2;X(1)+4*X(2)^2-4];
dF = [2*X(1),2;1,8*X(2)];
end