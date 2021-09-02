function yout = delta(q,z)
%DELTA Summary of this function goes here
%   Detailed explanation goes here
global z_min;
global z_max;
yout = z;
if z <= z_min && q == 0
    yout = 1;
end
if z >= z_max && q == 1
    yout = 0;
end
end

