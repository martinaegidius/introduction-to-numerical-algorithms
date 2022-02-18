ezplot('x^2+y^2-6*x-2*y+1=0')
hold on
ezplot('4*x^2+9*y^2-8*x+18*y-23=0')
hold off 

X0 = [4;-2];

x = Newtonsys(@funFdF_1,X0,10)


function [F,dF] = funFdF_1(X)
    F = [X(1)^2+X(2)^2-6*X(1)-2*X(2)+1;4*X(1)^2+9*X(2)^2-8*X(1)+18*X(2)-23];
    dF = [2*X(1)-6,2*X(2)-2;8*X(1)-8,18*X(2)+18];
end