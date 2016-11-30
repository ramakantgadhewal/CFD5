%% CFD5 Assignment 2 Calculations
% Alasdair Gray, S1208454
% 18/11/2016
clear all, hold off, close all, clc
%% Define Concstants
Snumber = 1208454; % Student number used for sweep angle
Re = 5*10^4; % Reynolds Number
Fr = 0.5048; % Froude number
Wave_Steepness = 1/100; % Wave steepness (wave height/wavelength)
aoa = 30; % Angle of attack in degrees
nu = 10^-6; % Kinematic viscosity of water in m^2/s
g = 9.81; % Gravitational acceleration in m^2/s^2
%% Calculate remaining parameters
sweep = (Snumber-1115272)/(565434)*10 + 62.5;
c = ((Re*nu)^2/(Fr^2*g))^(1/3);
U = Re*nu/c;
lambda = 10*c;
H = lambda*Wave_Steepness;
apex_depth = -0.2*lambda;
C = sqrt((g*lambda)/(2*pi));
T = lambda/C;
f = 1/T;
omega = 2*pi/T; % Wave frequency
q = 2*pi/lambda; % Wave number
%% Plots
x = linspace(-5*c, 5*c, 200);
z = linspace(-4*c, 0 , 200);
t = linspace(0, 10*T, 100);
[X,Z] = meshgrid(x,z);

V = zeros(length(x), length(z), length(t));

for i = 1:length(t)
    V(:,:,i) = -(H*omega/2)*exp(q*Z).*cos(q*X - omega*t(i));
    eta(:,i) = H/2*sin(q*x - omega*t(i));
    subplot(2,1,2), contourf(X,Z,V(:,:,i)),colorbar('southoutside'), hold on
    subplot(2,1,2), plot([0, c*cos(deg2rad(aoa))], [apex_depth, apex_depth-c*sin(deg2rad(aoa))], 'k-', 'LineWidth', 2), hold off
    subplot(2,1,1), plot(x,eta(:,i)), axis([min(x), max(x), min(min(eta)), max(max(eta))]);
    pause(0.001)
end