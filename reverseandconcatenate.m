function solution = reverseandconcatenate(solutionfw,solutionbw)
%REVERSEANDCONCATENATE Summary of this function goes here
%   Detailed explanation goes here
Tbw = solutionbw(1,:);
Jbw = solutionbw(2,:);

T_val_fw = solutionfw(1, end);
J_val_fw = solutionfw(2, end);

T_val_bw = solutionbw(1, end);
J_val_bw = solutionbw(2, end);

solutionbw(1,:) = T_val_bw - solutionbw(1,:) + T_val_fw;
solutionbw(2,:) = J_val_bw - solutionbw(2,:) + J_val_fw;

solution = [solutionfw, flip(solutionbw, 2)];

end

