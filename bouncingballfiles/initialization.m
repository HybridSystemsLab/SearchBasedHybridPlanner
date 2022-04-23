% model prameters
global TSPAN_f
global JSPAN_f
global TSPAN_g
global JSPAN_g
global options
global tol

%% hybrid model parameters
% barx2 = 0.5;
tol = 0.1;

% HyEQ simulator parameters
DeltaT = 0.1;
DeltaJ = 1;

options = odeset('RelTol',1e-6,'MaxStep',.1);

TSPAN_f=[0 DeltaT];
JSPAN_f = [0 1];


TSPAN_g=[0 20];
JSPAN_g = [0 1];

%% Motion planning problem data

x0 = [15; 0];
xf = [10; 0];

figure(1);
plot(x0(1), x0(2),'gs', 'MarkerSize', 15,'DisplayName','Initial state');
hold on
figure(1)
plot(xf(1), xf(2),'gs', 'MarkerSize', 15,'DisplayName','Final state');
hold on

%% input library

U_D_fw = 0:1:4;
U_D_bw = 0:1:4;
U_C_fw = 0;
U_C_bw = 0;
