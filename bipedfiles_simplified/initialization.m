% model prameters
InitParams;
xf = [params.phis, -params.phis,0, 0.1, 0.1, 0]';
x0 = g(xf);
% xf = [-0.4199
%     0.6380
%    -0.0359
%     1.4943
%     0.6747
%    -0.6533];
global tol
tol = 0.3;

% simulate parameters

global rule;
global options;

rule = 1;
options = odeset('RelTol',1e-6,'MaxStep',.1);

DeltaT = 0.2;
DeltaJ = 1;


global TSPAN_f;
global JSPAN_f;

global TSPAN_g;
global JSPAN_g;

TSPAN_f=[0 DeltaT];
JSPAN_f = [0 1];

TSPAN_g=[0 20];
JSPAN_g = [0 1];

global U_D_fw;
global U_D_bw;
global U_C_fw;
global U_C_bw;

U_D_fw = 0;
U_D_bw = 0;

u_c_1 = [1.9, 1, 0, -1, -1.9]';
u_c_2 = [1.9, 1, 0, -1, -1.9]';
u_c_3 = [-0.1;0;0.1];

U_C_fw = joinmat(joinmat(u_c_1, u_c_2), u_c_3)';

u_c_1 = [1.9, 1, 0, -1, -1.9]';
u_c_2 = [1.9, 1, 0, -1, -1.9]';
u_c_3 = [0.1;0;-0.1];
U_C_bw = joinmat(joinmat(u_c_1, u_c_2), u_c_3)';

figure(1);
plot3(x0(1), x0(2), x0(3),'gs', 'MarkerSize', 10,'DisplayName','Initial state');
hold on
plot3(xf(1), xf(2), xf(3),'bs', 'MarkerSize', 10,'DisplayName','Final state');
hold on
grid on;

global xlimmin;
global xlimmax;
global ylimmin;
global ylimmax;
global zlimmin;
global zlimmax;

% xlimmin =  -2*pi
% 
% 
% 
% xlim([xlimmin, xlimmax]);
% ylim([ylimmin, ylimmax]);
% zlim([zlimmin, zlimmax]);
xlabel('$x_{1}$','Interpreter','latex');
ylabel('$x_{2}$','Interpreter','latex');
zlabel('$x_{3}$','Interpreter','latex');

global kthvertex
kthvertex = 1;

global kthedge
kthedge = 1;
