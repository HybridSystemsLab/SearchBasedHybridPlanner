function solution = plotsolution(G, I_new, edge_map, colorflag)
%PLOTSOLUTION Summary of this function goes here
%   Detailed explanation goes here
solution = [];
if I_new ~= 1
    P = shortestpath(G, 1, I_new);
    endpoint1 = P(1);
    endpoint2 = P(2);
    solution = getsolutionpair(edge_map ,endpoint1, endpoint2);
    for i = 2: (size(P, 2) -1 )
        endpoint1 = P(i);
        endpoint2 = P(i + 1);
        solutionthispart = getsolutionpair(edge_map ,endpoint1, endpoint2);;
        solutionthispart(1,:) = solution(1, end) + solutionthispart(1,:);
        solutionthispart(2,:) = solution(2, end) + solutionthispart(2,:);
        solution = [solution, solutionthispart];
    end
    figure(1);
    if colorflag == 1
        for i = 2: size(solution, 2)
            if solution(2, i) == solution(2, i - 1)
                plot(solution(3, (i-1):i), solution(4, (i-1):i),'b-', 'LineWidth', 2);
            else
                plot(solution(3, (i-1):i), solution(4, (i-1):i),'b--', 'LineWidth', 2);
            end
            hold on
        end
%         hold off
    else
        for i = 2: size(solution, 2)
            if solution(2, i) == solution(2, i - 1)
                plot(solution(3, (i-1):i), solution(4, (i-1):i),'r-', 'LineWidth', 2);
            else
                plot(solution(3, (i-1):i), solution(4, (i-1):i),'r--', 'LineWidth', 2);
            end
            hold on
        end
        hold off
    end
    xlim([-2, 18]); xlabel('$x_{1}$','Interpreter','latex');
    ylim([-20, 15]);ylabel('$x_{2}$','Interpreter','latex');
    grid on
    set(gca,'FontSize',30)
    % title(['After ' mat2str(k) ' of ' mat2str(K) ' samples, hybrid rrt finds the solutions starting from ' mat2str(x0) ' to ' mat2str(xf)])
end

end

