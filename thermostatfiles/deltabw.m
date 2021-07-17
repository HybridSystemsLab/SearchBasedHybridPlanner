function yout = deltabw(q,z)
%DELTA Summary of this function goes here
%   Detailed explanation goes here
global z_min;
global z_max;
if z <= z_min && q == 1
    yout = 0;
end
if z >= z_max && q == 0
    yout = 1;
end
end

