% model prameters
global barx2;
global TSPAN_f
global JSPAN_f
global TSPAN_g
global JSPAN_g
global options
global tol

barx2 = 0.5;
tol = 0.2;


% simulate parameters
DeltaT = 1;
DeltaJ = 1;

rule = 1;
options = odeset('RelTol',1e-6,'MaxStep',.1);

TSPAN_f=[0 DeltaT];
JSPAN_f = [0 1];

TSPAN_g=[0 20];
JSPAN_g = [0 1];

x0 = [-15, 0];
xf = [-10, 0];

figure(1);
plot(x0(1), x0(2),'gs', 'MarkerSize', 10,'DisplayName','Initial state');
hold on
plot(xf(1), xf(2),'bs', 'MarkerSize', 10,'DisplayName','Final state');
hold on

U_D_fw = 0;
U_D_bw = 0;
U_C_fw = 1:1:4.9;
U_C_bw = 1:1:4.9;