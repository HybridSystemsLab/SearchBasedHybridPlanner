
for i = 1:6
    figure;
    plot(solution(1,:), solution(i + 2, :),'DisplayName', ['State ', mat2str(i)]);
    hold on
    legend;
end
