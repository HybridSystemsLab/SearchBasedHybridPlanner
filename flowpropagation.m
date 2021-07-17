function [x_new, psi_new] = flowpropagation(x_cur, u, direction, rule)
%FLOWPROPAGATION Summary of this function goes here
%   Detailed explanation goes here

global options;
global TSPAN_f;
global JSPAN_f;

if direction == 1
    [t,j,x] = HyEQsolver( @(x) f(x, u),@(x) g(x, 0),@C,@D,...
        x_cur,TSPAN_f,JSPAN_f,rule,options,'ode23t');
else
    [t,j,x] = HyEQsolver( @(x) f_bw(x, u),@(x) g_bw(x, 0),@C_bw,@D_bw,...
        x_cur,TSPAN_f,JSPAN_f,rule,options,'ode23t');
end
if (j(end, 1) == 1)
    t = t(1:(end - 1), :);
    j = j(1:(end - 1), :);
    x = x(1:(end - 1), :);
end
phi_new = [t, j, x]';
x_new = phi_new(3:end, end);
n = size(phi_new, 2);
psi_new = [phi_new; ones(1, n).* u];

end

