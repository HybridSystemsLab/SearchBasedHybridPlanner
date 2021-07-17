function x_plus = g_bw(xm, um)
%G_BW Summary of this function goes here
%   Detailed explanation goes here
x_plus = fsolve(@(z) g_eqn(z, xm), xm);

end

