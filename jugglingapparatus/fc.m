function y = fc(x1,x2)
%FC Summary of this function goes here
%   Detailed explanation goes here
kc = 1; bc = 1;
if (x1 >0)
    y = kc*x1 + bc*x2;
else
    y = 0;
end
end

