close all

disp("Post-processing starts!")

m_edgelistfw = size(Edgelistfw, 1);
m_edgelistbw = size(Edgelistbw, 1);


plot3()

%% draw edges
figure(1)
idx = 1;
for i = 2:1:max(m_edgelistbw, m_edgelistfw)
    if (i <= m_edgelistfw)
        plot3(Edgelistfw{i,3}(1,1), Edgelistfw{i,3}(2,1),Edgelistfw{i,3}(3,1), 'k*');
        hold on
        plot3(Edgelistfw{i,3}(1,end), Edgelistfw{i,3}(2,end),Edgelistfw{i,3}(3,end),'k*');
        hold on
        p1 = plot3(Edgelistfw{i,3}(1,:), Edgelistfw{i,3}(2,:),Edgelistfw{i,3}(3,:),'k-', 'DisplayName','Forward propagation');
        hold on
    end
%     if (i <= m_edgelistbw)
%         plot3(Edgelistbw{i,3}(1,1), Edgelistbw{i,3}(2,1),Edgelistbw{i,3}(3,1),'m*');
%         hold on
%         plot(Edgelistbw{i,3}(1,end), Edgelistbw{i,3}(2,end), Edgelistbw{i,3}(3,end),'m*');
%         hold on
%         p2 = plot3(Edgelistbw{i,3}(1,:), Edgelistbw{i,3}(2,:), Edgelistbw{i,3}(3,:),'m-', 'DisplayName','Backward propagation');
%         hold on
%     end
    xlim([-pi, pi]);
    ylim([-pi,pi]);
    zlim([-pi,pi]);
    set(gca,'FontSize',15)
    xlabel('$x_{1}$','Interpreter','latex')
    ylabel('$x_{2}$','Interpreter','latex')
    zlabel('$x_{3}$','Interpreter','latex')
    grid on
    legend([p1],'Forward propagation');
%     legend([p1, p2],'Forward propagation', 'Backward propagation','Interpreter','latex');
    hold on
%     saveas(gcf,['.\pictures\', num2str(idx, '%04d'), '.jpg']);
    idx = idx + 1;
    pause(0.1)
end
% for i = 2:1:m_edgelistbw
%     plot(Edgelistbw{i,3}(1,:), Edgelistbw{i,3}(2,:),'b*-');
%     hold on
% end

%% draw vertices
% figure(1)
% iterator = Tfw.depthfirstiterator;
% for i = iterator
%     state = Tfw.get(i);
%     plot(state(1), state(2), 'k*');
%     hold on
% end
% iterator = Tbws{mbw}.depthfirstiterator;
% for i = iterator
%     state = Tbws{mbw}.get(i);
%     plot(state(1), state(2), 'b*');
%     hold on
% end

%% draw solutions
endpointpathfw = findpath(Tfw, 1, ifw);
endpointpathbw = findpath(Tbw, 1, ibw);

n_pathfw = size(endpointpathfw, 2);
n_pathbw = size(endpointpathbw, 2);
figure(1)
p4 = plot(x0(1),x0(2),'gs','MarkerSize',10);
hold on
p5 = plot(xf(1),xf(2),'bs','MarkerSize',10);
for i = 1: n_pathfw - 1
    for j = 2:m_edgelistfw
        if Edgelistfw{j,1} == endpointpathfw(1, i) && Edgelistfw{j,2} == endpointpathfw(1, i  + 1)
            p3 = plot3(Edgelistfw{j,3}(1, :), Edgelistfw{j,3}(2, :), Edgelistfw{j,3}(3, :),'r-', 'LineWidth', 3);
            hold on
        end
    end
end
figure(1)
for i = 1: n_pathbw - 1
    for j = 2:m_edgelistbw
        if Edgelistbw{j,1} == endpointpathbw(1, i) && Edgelistbw{j,2} == endpointpathbw(1, i  + 1)
            plot(Edgelistbw{j,3}(1, :), Edgelistbw{j,3}(2, :),Edgelistbw{j,3}(3, :),'r-', 'LineWidth', 3);
        end
    end
end
legend([p1, p2, p3, p4, p5],'Forward propagation', 'Backward propagation', 'Motion plan','Initial state', 'Final state','Interpreter','latex');
saveas(gcf,['.\pictures\', num2str(idx, '%04d'), '.jpg']);


