% model prameters


global tol
tol = 0.01;


% simulate parameters
DeltaT = 0.05;
DeltaJ = 1;

global options
options = odeset('RelTol',1e-6,'MaxStep',.1);

global TSPAN_f
global JSPAN_f
TSPAN_f=[0 DeltaT];
JSPAN_f = [0 1];


global TSPAN_g
global JSPAN_g
TSPAN_g=[0 20];
JSPAN_g = [0 1];

x0 = [0.5, 0, -0.005, 0]';
xf = [0.3, 0, 0.005, 0]';

global h1
global h2

figure(1);
h1 = plot(x0(1), x0(2),'gs', 'MarkerSize', 10,'DisplayName','Initial state');
hold on
h2 = plot(xf(1), xf(2),'bs', 'MarkerSize', 10,'DisplayName','Final state');
hold on

U_D_fw = 0;
U_D_bw = 0;
U_C_fw = -2:0.5:2;
U_C_bw = -2:0.5:2;

global e;
e = 0.742;

global mb;
mb = 0.0233;

global mp;
mp = 0.348;

global x21min;
global x21max;
global x11min;
global x11max;

x21min = -0.01;
x21max = 0.01;
x11min = -0.01;
x11max = 0.70;

global xmin;
global xmax;
global ymin;
global ymax;

xmin = -0.1;
xmax = 0.60;
ymin = -5;
ymax = 5;
