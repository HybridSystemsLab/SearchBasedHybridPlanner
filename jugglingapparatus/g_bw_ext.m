function xplus = g_bw(x, u)
%--------------------------------------------------------------------------
% Matlab M-file Project: HyEQ Toolbox @  Hybrid Systems Laboratory (HSL), 
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: g_ex1_2.m
%--------------------------------------------------------------------------
% Project: Simulation of a hybrid system (bouncing ball)
% Description: Jump map
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%   See also HYEQSOLVER, PLOTARC, PLOTARC3, PLOTFLOWS, PLOTHARC,
%   PLOTHARCCOLOR, PLOTHARCCOLOR3D, PLOTHYBRIDARC, PLOTJUMPS.
%   Copyright @ Hybrid Systems Laboratory (HSL),
%   Revision: 0.0.0.3 Date: 05/20/2015 3:42:00

% state

x11 = x(1);
x12 = x(2);
x21 = x(3);
x22 = x(4);

global mb;
global mp;
global e;

lambda = mb/(mb + mp);

R = [lambda - (1 - lambda)*e, (1 - lambda)*(1 + e); lambda *(1 + e), 1 - lambda - lambda * e];

xplus = [x11; [1, 0]*R^(-1)*[x12; x22]; x21; [0, 1]*R^(-1)* [x12; x22]];

end