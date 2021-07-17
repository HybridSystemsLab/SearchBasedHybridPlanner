function [flag, index] = Isintree(reachedset, I, x_new)
%ISINTREE Summary of this function goes here
%   Detailed explanation goes here

%rator = dfsearch(G,1);
flag = 0; index = 0;
[flag1, idx] = isInreachedset(x_new, reachedset);

if (flag1)
        flag = 1;
        index = idx;
end


end

