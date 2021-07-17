function plotsearchtree(psi_new, x_near, x_new, direction)
%PLOTSEARCHTREE Summary of this function goes here
%   Detailed explanation goes here
figure(1)
hold on;

if (direction == 1)
    plot(psi_new(3,:),psi_new(4,:),'k-','DisplayName','new edge');
else
    plot(psi_new(3,:),psi_new(4,:),'m-','DisplayName','new edge');
end
xlim([0, 60]);
ylim([-0.5, 1.5]);
grid on;
xlabel('$x_{1}$','Interpreter','latex');
ylabel('$x_{2}$','Interpreter','latex');
pause(.1)

end

