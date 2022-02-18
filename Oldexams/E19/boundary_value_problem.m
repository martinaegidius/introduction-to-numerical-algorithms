
ics1 = [1,-1];
ics2 = [1,-5];
tspan = [0,2];
[t_sol_1,x_sol_1] = ode45(@odefun,tspan,ics1);
[t_sol_2,x_sol_2] = ode45(@odefun,tspan,ics2);

z1 = -1;
z2 = -5;
f1 = x_sol_1(end,1)-0;
f2 = x_sol_2(end,1)-0;

%secant
z_root = z2-((z2-z1)/(f2-f1))*f2;
[t_sol_3,x_sol_3] = ode45(@odefun,tspan,[1,z_root]);
plot(t_sol_3,x_sol_3(:,1))
hold on 
plot(t_sol_2,x_sol_2(:,1),'.')
plot(t_sol_1,x_sol_1(:,1),'.')
plot(2,0,'rx');
legend('shot 3','shot 2','shot 1','goal')


function [X] = odefun(t,x)
    X = [x(2);-4*x(2)-4*x(1)+exp(-2*t)];
end