X1 = [3*exp(1),10]; %%ics guess 1
tspan = [1,2];
[t_sol_1,x_sol_1] = ode45(@odefun,tspan,X1); %%first shooting
X2 = [3*exp(1),25]; %%ics guess 2
[t_sol_2,x_sol_2] = ode45(@odefun,tspan,X2); %%second shooting

z1 = 10; %x'(1) guess 1
z2 = 25; %x'(1) guess 2
f1 = x_sol_1(end,1)-5*exp(2); %root for function which is zero to the same argument as the function we are looking for is 5exp(2)
f2 = x_sol_2(end,1)-5*exp(2);

z_root = z2-f2*(z2-z1)/(f2-f1); %%secant, 1 iteration
X_hit = [3*exp(1),z_root]; %new guess with new root
[t_hit,x_hit] = ode45(@odefun,tspan,X_hit); %ode45 for root

plot(t_hit,x_hit(:,1))
hold on
plot(t_sol_1,x_sol_1(:,1),'.')
plot(t_sol_2,x_sol_2(:,1),'.')
plot(2,5*exp(2),'rx')
legend('x(t)','x(t) shot 1','x(t) shot 2','goal')


function [X] = odefun(t,x)
    X = [x(2);x(2)+x(1)-(2*t-1)*exp(t)];
end