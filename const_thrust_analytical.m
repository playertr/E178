% Analytical Solutions of Constant-Thrust, Constant-Cd Rocket DEs
% Tim Player

%% Model Parameters
g = 9.81; %m/s^2
m = 0.253; % mass of rocket + motor (kg)
A_p = 0.001363; % projected area (m^2)
A_p_par = 0.1642;
rho = 1.225; %kg/m^3
C_d = 0.5;
C_d_par = 1.4;

% %Estes E9, two-stage
% T1 = 12.5; % thrust in N
% t_1 = 0.6; % time in s
% T2 = 8.5;
% t_2 = 3;

% %Estes E9, one-stage
% T1 = 9; % thrust in N
% t_1 = 0.6; % time in s
% T2 = 9;
% t_2 = 3;

% % Estes E12, two-stage
% T1 = 16.2; % thrust in N
% t_1 = 0.5; % time in s
% T2 = 10;
% t_2 = 2.4;
% 
% % Estes E12, one-stage
% T1 = 11.3; % thrust in N
% t_1 = 0.5; % time in s
% T2 = 11.3;
% t_2 = 2.4;

%% E9 Acceleration Plot
e9_acc = figure;
hold on;

%Estes E9, two-stage
T1 = 12.5; % thrust in N
t_1 = 0.6; % time in s
T2 = 8.5;
t_2 = 3;

plotAccel(e9_acc, 'b', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);
title('Acceleration Curves of Estes E9 Motor')
ylabel('Acceleration (m/s^2)');
xlabel('Time (s)');

%Estes E9, one-stage
T1 = 9; % thrust in N
t_1 = 0.6; % time in s
T2 = 9;
t_2 = 3;

plotAccel(e9_acc, 'k', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);

% hacky workaround for legend
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'b');
h(2) = plot(NaN,NaN,'k');
h(3) = plot(NaN,NaN,'m');
legend(h, 'Two-Stage','One-Stage','Rocksim');

%% 9 Velocity Plot
e9_vel = figure;
hold on;

%Estes E9, two-stage
T1 = 12.5; % thrust in N
t_1 = 0.6; % time in s
T2 = 8.5;
t_2 = 3;


plotVel(e9_vel, 'b', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);
title('Velocity Curves of Estes E9 Motor');
ylabel('Velocity (m/s)');
xlabel('Time (s)');

%Estes E9, one-stage
T1 = 9; % thrust in N
t_1 = 0.6; % time in s
T2 = 9;
t_2 = 3;

plotVel(e9_vel, 'k', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);

% hacky workaround for legend
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'b');
h(2) = plot(NaN,NaN,'k');
h(3) = plot(NaN,NaN,'m');
legend(h, 'Two-Stage','One-Stage','Rocksim');

%% E9 Altitude Plot
e9_alt = figure;
hold on;

%Estes E9, two-stage
T1 = 12.5; % thrust in N
t_1 = 0.6; % time in s
T2 = 8.5;
t_2 = 3;

plotAlt(e9_alt, 'b', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);
title('Altitude Curves of Estes E9 Motor');
ylabel('Altitude (m)');
xlabel('Time (s)');

%Estes E9, one-stage
T1 = 9; % thrust in N
t_1 = 0.6; % time in s
T2 = 9;
t_2 = 3;


plotAlt(e9_alt, 'k', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);

% hacky workaround for legend
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'b');
h(2) = plot(NaN,NaN,'k');
h(3) = plot(NaN,NaN,'m');
legend(h, 'Two-Stage','One-Stage','Rocksim');

%% E12 Acceleration Plot
e12_acc = figure;
hold on;

% Estes E12, two-stage
T1 = 16.2; % thrust in N
t_1 = 0.5; % time in s
T2 = 10;
t_2 = 2.4;

plotAccel(e12_acc, 'b', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);
title('Acceleration Curves of Estes E12 Motor');
ylabel('Acceleration (m/s^2)');
xlabel('Time (s)');

% Estes E12, one-stage
T1 = 11.3; % thrust in N
t_1 = 0.5; % time in s
T2 = 11.3;
t_2 = 2.4;

plotAccel(e12_acc, 'k', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);

% hacky workaround for legend
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'b');
h(2) = plot(NaN,NaN,'k');
h(3) = plot(NaN,NaN,'m');
legend(h, 'Two-Stage','One-Stage','Rocksim');

%% E12 Velocity Plot
e12_vel = figure;
hold on;

% Estes E12, two-stage
T1 = 16.2; % thrust in N
t_1 = 0.5; % time in s
T2 = 10;
t_2 = 2.4;

plotVel(e12_vel, 'b', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);
title('Velocity Curves of Estes E12 Motor');
ylabel('Velocity (m/s)');
xlabel('Time (s)');

% Estes E12, one-stage
T1 = 11.3; % thrust in N
t_1 = 0.5; % time in s
T2 = 11.3;
t_2 = 2.4;

plotVel(e12_vel, 'k', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);

% hacky workaround for legend
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'b');
h(2) = plot(NaN,NaN,'k');
h(3) = plot(NaN,NaN,'m');
legend(h, 'Two-Stage','One-Stage','Rocksim');

%% E12 Altitude Plot
e12_alt = figure;
hold on;

% Estes E12, two-stage
T1 = 16.2; % thrust in N
t_1 = 0.5; % time in s
T2 = 10;
t_2 = 2.4;

plotAlt(e12_alt, 'b', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);
title('Altitude Curves of Estes E12 Motor');
ylabel('Altitude (m)');
xlabel('Time (s)');

% Estes E12, one-stage
T1 = 11.3; % thrust in N
t_1 = 0.5; % time in s
T2 = 11.3;
t_2 = 2.4;

plotAlt(e12_alt, 'k', g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2);

% hacky workaround for legend
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'b');
h(2) = plot(NaN,NaN,'k');
h(3) = plot(NaN,NaN,'m');
legend(h, 'Two-Stage','One-Stage','Rocksim');



%plotAll(5,  g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2)