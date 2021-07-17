function plotsearchtree(psi_new, x_near, x_new, direction)
%PLOTSEARCHTREE Summary of this function goes here
%   Detailed explanation goes here
figure(1)
hold on;

if (direction == 1)
    plot3(x_new(1),x_new(2),x_new(3),'k*');
    h2 = plot3(psi_new(3,:),psi_new(4,:),psi_new(5,:),'k-','DisplayName','new edge');
else
    plot3(x_new(1),x_new(2),x_new(3),'b*');
    h2 = plot3(psi_new(3,:),psi_new(4,:),psi_new(5,:),'b-','DisplayName','new edge');
end
% xlim([-pi, pi]);
% ylim([-pi, pi]);
% zlim([-pi, pi]);
grid on;
xlabel('$x_{1}$','Interpreter','latex');
ylabel('$x_{2}$','Interpreter','latex');
zlabel('$x_{3}$','Interpreter','latex');
pause(.1)

end

