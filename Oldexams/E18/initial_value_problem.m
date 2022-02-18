
Z0 = [0;1;0;-2];
tspan = [0,2];
n1 = (2-0)/(2^(-4));
n2 = (2-0)/(2^(-5));

[t1,x1] = MyRK4System(@myFun,tspan,Z0,n1);
[t2,x2] = MyRK4System(@myFun,tspan,Z0,n2);

function [ode] = myFun(t,Z)
    ode = [Z(3);Z(4);Z(1)^2-Z(2)+exp(t);Z(1)-Z(2)^2-exp(t)];
end