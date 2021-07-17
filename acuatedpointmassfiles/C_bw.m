function [value] = C_bw(x)
%C_BW Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1);
x2 = x(2);

barx2 = 1;

if x1 <= 0 || x2<=barx2
    value = 1;
else
    value = 0;
end
end

