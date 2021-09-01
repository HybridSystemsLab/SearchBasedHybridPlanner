% model prameters
global options
global tol

tol = .3;
global z_min;
global z_max;

z_min = 20;
z_max = 40;

% simulate parameters
DeltaT = .2;
DeltaJ = 1;

rule = 1;
options = odeset('RelTol',1e-6,'MaxStep',.1);

global TSPAN_f;
global JSPAN_f;

global TSPAN_g;
global JSPAN_g;

TSPAN_f=[0 DeltaT];
JSPAN_f = [0 1];

TSPAN_g=[0 20];
JSPAN_g = [0 1];

x0 = [5; 0];
xf = [30; 0];

figure(1);
plot(x0(1), x0(2),'gs', 'MarkerSize', 10,'DisplayName','Initial state');
hold on
plot(xf(1), xf(2),'bs', 'MarkerSize', 10,'DisplayName','Final state');
hold on

U_D_fw = 0;
U_C_fw = 0;
U_D_bw = 0;
U_C_bw = 0;