function value = Xu(x, u)
%XU Summary of this function goes here
%   Detailed explanation goes here
x11 = x(1);
x12 = x(2);
x21 = x(3);
x22 = x(4);

global x21min;
global x21max;
global x11min;
global x11max;

if (x11 >= x11min  - 0.0001) && (x11 <= x11max + 0.0001) && (x21 >= x21min - 0.0001) && (x21 <= x21max + 0.0001)
    value = 0;
else
    value = 1;
end

end

