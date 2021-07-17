
% NN = 10;
% 
% t1 = linspace(0, solution(1, 37), 37* NN);
% t2 = linspace(solution(1, 37), solution(1, end), (size(solution, 2) - 37) * NN);
% 
% p_bb1 = polyfit(solution(1,1:37),solution(3,1:37),3);
% p_bb2 = polyfit(solution(1,38:end),solution(3,38:end),3);
% p_priston1 = polyfit(solution(1,1:37),solution(5,1:37),3);
% p_priston2 = polyfit(solution(1,38:end),solution(5,38:end),3);
% 
% 
% height_bb_fit1 = polyval(p_bb1, t1);
% height_bb_fit2 = polyval(p_bb2, t2);
% 
% height_priston_fit1 = polyval(p_priston1, t1);
% height_priston_fit2 = polyval(p_priston2, t2);
% 
% N = size(solution, 2) * NN;
% for i = 1: N
%     figure(3)
%    h1 = plot(0, height_bb_fit(i),'gs') ;
%    hold on
%    h2 = plot(0, height_priston_fit(i),'rs') ;
%    xlim([-0.5, 0.5]);
%     ylim([-0.1, 0.7]);
%     grid on
%     pause(0.2)
%     hold off
% end

figure(3)
plot(0, x0(1),'gs', 'MarkerSize', 10,'DisplayName','Initial state');
hold on
plot(solution(1, end), xf(1),'bs', 'MarkerSize', 10,'DisplayName','Final state');
hold on
plot(solution(1,:), solution(3, :), 'DisplayName', 'Height of the ball');
hold on
plot(solution(1,:), solution(5, :), 'DisplayName', 'Height of the priston');
grid on
legend
ylim([-0.1, 0.6]);
xlabel('Time (seconds)','Interpreter', 'latex')
ylabel('Height (meters)','Interpreter', 'latex')


figure(4)
plot(solution(1,:), solution(7, :), 'DisplayName', 'Input');
grid on
legend
xlabel('Time (seconds)')
ylabel('Input (newton)')

% figure(4)
% 
% for i = 1:5
%     subplot(5, 1, i); plot(solution(1,:), solution(2 + i, :));
%     grid on
% end



