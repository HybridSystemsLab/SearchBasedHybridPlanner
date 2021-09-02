function [value] = C_bw_ext(x, u)
%C_BW Summary of this function goes here
%   Detailed explanation goes here
x11 = x(1);
x12 = x(2);
x21 = x(3);
x22 = x(4);

if (x11 >= (x21 - 0.01))
    value = 1;
else
    value = 0;
end
end

