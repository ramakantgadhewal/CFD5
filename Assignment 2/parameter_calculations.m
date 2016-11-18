%% CFD5 Assignment 2 Calculations
% Alasdair Gray, S1208454
% 18/11/2016
%% Define Concstants
Snumber = 1208454; % Student number used for sweep angle
Re = 5*10^4; % Reynolds Number
Fr = 0.5048; % Froude number
Mach = 0.2; % Mach number
Wave_Steepness = 1/100; % Wave steepness (wave height/wavelength)
aoa = 30; % Angle of attack in degrees
nu = 10^-6; % Kinematic viscosity of water in m^2/s
g = 9.81; % Gravitational acceleration in m^2/s^2
K = 2.15*10^9; % Bulk modulus of water in Pa
%% Calculate remaining parameters
sweep = (Snumber-1115272)/(565434)*10 + 62.5;
c = ((Re*nu)^2/(Fr^2*g))^(1/3);
U = Re*nu/c;
lambda = 10*c;
H = lambda*Wave_Steepness;
apex_depth = -2*lambda;
T = lambda/(sqrt(g*lambda)/(2*pi));
rho = K*Mach^2/U^2;