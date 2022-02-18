tspan = [0,2*pi];
n = 50;
h = 2*pi/50;
z0 = [0.4;0;0;2];

[t_sol,x_sol] = MyRK4System(@odefun,tspan,z0,n);
plot(x_sol(1,:),x_sol(2,:))


function [Z] = odefun(t,z)
    Z = [z(3);z(4);-z(1)/(z(1)^2+z(2)^2)^(3/2);-z(2)/(z(1)^2+z(2)^2)^(3/2)];
end