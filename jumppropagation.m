function [x_new, psi_new] = jumppropagation(x_cur, u, direction)
%FLOWPROPAGATION Summary of this function goes here
%   Detailed explanation goes here
global options;
global TSPAN_g;
global JSPAN_g;

rule = 1;
if direction == 1
    [t,j,x] = HyEQsolver( @(x) f(x, 0),@(x) g(x, u),@C,@D,...
        x_cur,TSPAN_g,JSPAN_g,rule,options,'ode23t');
else
    [t,j,x] = HyEQsolver( @(x) f_bw(x, 0),@(x) g_bw(x, u),@C_bw,@D_bw,...
        x_cur,TSPAN_g,JSPAN_g,rule,options,'ode23t');
end
phi_new = [t, j, x]';
x_new = phi_new(3:end, end);
n = size(phi_new, 2);
psi_new = [phi_new; ones(1, n).* u];

end