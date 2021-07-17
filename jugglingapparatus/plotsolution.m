function solution = plotsolution(G, I_new, edge_map)
%PLOTSOLUTION Summary of this function goes here
%   Detailed explanation goes here
global h1;
global h2;
global h3;
global h4;
global h5;
solution = [];
if I_new ~= 1
    P = shortestpath(G, 1, I_new);
    endpoint1 = P(1);
    endpoint2 = P(2);
    solution = getsolutionpair(edge_map ,endpoint1, endpoint2);
    for i = 2: (size(P, 2) -1 )
        endpoint1 = P(i);
        endpoint2 = P(i + 1);
        solutionthispart = getsolutionpair(edge_map ,endpoint1, endpoint2);
        solutionthispart(1,:) = solution(1, end) + solutionthispart(1,:);
        solutionthispart(2,:) = solution(2, end) + solutionthispart(2,:);
        solution = [solution, solutionthispart];
    end
    figure(1);
    h5 = plot(solution(3, :), solution(4, :),'r-', 'LineWidth', 2);
    legend([h1, h2, h3, h4, h5],{'Initial state', 'Final state', 'Forward propagation', 'Backward propagation', 'Motion plan'},'Interpreter', 'latex')
    % title(['After ' mat2str(k) ' of ' mat2str(K) ' samples, hybrid rrt finds the solutions starting from ' mat2str(x0) ' to ' mat2str(xf)])
end

end

