function plotvertices(x_near, x_new, direction)
%PLOTVERTICES Summary of this function goes here
%   Detailed explanation goes here

figure(1)

hold on;

h1 = plot(x_near(1),x_near(2),'r*','DisplayName','current state');

if (direction == 1)
    plot(x_new(1),x_new(2),'k*');
else
    plot(x_new(1),x_new(2),'m*');
end

xlim([0, 60]);
ylim([-0.5, 1.5]);
grid on;
xlabel('$x_{1}$','Interpreter','latex');
ylabel('$x_{2}$','Interpreter','latex');
pause(0.1)

delete(h1);

end

