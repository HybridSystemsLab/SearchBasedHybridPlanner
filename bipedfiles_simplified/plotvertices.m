function plotvertices(x_near, x_new, direction)
%PLOTVERTICES Summary of this function goes here
%   Detailed explanation goes here
global fileindex;

figure(1)

hold on;

h1 = plot3(x_near(1),x_near(2), x_near(3),'r*','DisplayName','current state');

if (direction == 1)
    plot3(x_new(1),x_new(2), x_new(3),'k*');
else
    plot3(x_new(1),x_new(2), x_new(3),'m*');
end

% xlim([-pi, pi]);
% ylim([-pi, pi]);
% zlim([-pi, pi]);
grid on;
xlabel('$x_{1}$','Interpreter','latex');
ylabel('$x_{2}$','Interpreter','latex');
zlabel('$x_{3}$','Interpreter','latex');
pause(0.1)
delete(h1);

end

