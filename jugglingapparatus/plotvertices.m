function plotvertices(x_near, x_new, direction)
%PLOTVERTICES Summary of this function goes here
%   Detailed explanation goes here
global xmin;
global xmax;
global ymin;
global ymax;

figure(1)

hold on;

h1 = plot(x_near(1),x_near(2),'r*','DisplayName','current state');

if (direction == 1)
    plot(x_new(1),x_new(2),'k*');
else
    plot(x_new(1),x_new(2),'m*');
end

xlim([xmin, xmax]);
ylim([ymin, ymax]);
grid on;
xlabel('$x_{11}$','Interpreter','latex');
ylabel('$x_{21}$','Interpreter','latex');
pause(0.1)
delete(h1);

end

