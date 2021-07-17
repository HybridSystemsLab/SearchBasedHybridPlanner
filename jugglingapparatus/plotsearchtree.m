function plotsearchtree(psi_new, x_near, x_new, direction)
%PLOTSEARCHTREE Summary of this function goes here
%   Detailed explanation goes here
global xmin;
global xmax;
global ymin;
global ymax;

figure(1)
hold on;
global h3
global h4

if (direction == 1)
    h3 = plot(psi_new(3,:),psi_new(4,:),'k-','DisplayName','Forward propagation');
else
    h4 = plot(psi_new(3,:),psi_new(4,:),'m-','DisplayName','Backward propagation');
end
xlim([xmin, xmax]);
ylim([ymin, ymax]);
grid on;
xlabel('$x_{11}$','Interpreter','latex');
ylabel('$x_{21}$','Interpreter','latex');

pause(.1)

% figure(2)
% hold on;
% 
% if (direction == 1)
%     plot(psi_new(5,:),psi_new(6,:),'k-','DisplayName','new edge');
% else
%     plot(psi_new(5,:),psi_new(6,:),'m-','DisplayName','new edge');
% end
% xlim([xmin, xmax]);
% ylim([ymin, ymax]);
% grid on;
% xlabel('$x_{11}$','Interpreter','latex');
% ylabel('$x_{21}$','Interpreter','latex');
% saveas(gcf,['.\pictures\', num2str(fileindex, '%04d'), '.jpg']);
% fileindex = fileindex + 1;
% pause(.1)



end

