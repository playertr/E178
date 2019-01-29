% Analytical Solutions of Constant-Thrust, Constant-Cd Rocket DEs
% Tim Player

% model parameters
g = 9.81; %m/s^2
m = 0.253; % mass of rocket + motor (kg)
A_p = 0.00545; % projected area (m^2)
A_p_par = 0.1642;
rho = 1.225; %kg/m^3
C_d = 0.5;
C_d_par = 1.4;
motor_delay = 4; %s
v_0 = 0;
x_0 = 0;
t_0 = 0;

%Estes E9
T1 = 12.5; % thrust in N
t_1 = 0.6; % time in s
T2 = 8.5;
t_2 = 3;

%Estes E12
% T1 = 16.2; % thrust in N
% t_1 = 0.5; % time in s
% T2 = 10;
% t_2 = 2.4;

%% initial burn (stage 1)
v_max = sqrt( (2 * T1 - m*g)/(rho * C_d * A_p) );
b = T1/m - g;

v = @(t) v_max * tanh(b / v_max * (t - t_0) + atanh(v_0 / v_max) ); %v_0 < v_max

x = @(t) x_0 + v_max^2/b * ...
    (log(sinh( b/v_max * (t-t_0) + acoth(v_0/v_max) ) ) ...
    - log(sinh(acoth(v_0/v_max))));

a_v = @(v) T1/m - 0.5 * C_d * A_p * rho/m * v * abs(v) - g;
a = @(t) a_v(v(t)); 

clf;
hold on;
fplot(a, [t_0 t_1], 'b');
fplot(v, [t_0 t_1], 'm');
fplot(x, [t_0 t_1], 'k');

v_1 = v(t_1);
x_1 = x(t_1);

%% sustainer burn (stage 2)
v_max = sqrt( (2 * T2 - m*g)/(rho * C_d * A_p) );

if v_1 < v_max
    disp('The rocket will not decelerate in the second stage.');
else
    disp('The rocket will decelerate in the second stage.')
end

b = T2/m - g;

v = @(t) v_max * tanh(b / v_max * (t - t_1) + atanh(v_1 / v_max) ); %v_1 < v_max

x = @(t) x_1 + v_max^2/b * ...
    (log(sinh( b/v_max * (t-t_1) + acoth(v_1/v_max) ) ) ...
    - log(sinh(acoth(v_1/v_max))));

a_v = @(v) T2/m - 0.5 * C_d * A_p * rho/m * v * abs(v) - g;
a = @(t) a_v(v(t)); 

fplot(a, [t_1 t_2], 'b');
fplot(v, [t_1 t_2], 'm');
fplot(x, [t_1 t_2], 'k');

v_2 = v(t_2);
x_2 = x(t_2);
%% thrustless ascent (stage 3)
v_t = sqrt( 2 * m * g / (rho * C_d * A_p));
t_3 = t_2 + v_t/g * atan(v_2/v_t); %time to apogee

v = @(t) v_t * tan( -g/v_t * (t - t_2) + atan(v_2/v_t));

x = @(t) x_2 + v_t^2/g * ...
    (log( cos(g/v_t * (t - t_2) - atan(v_2/v_t))) ...
    + log( sqrt(1 + v_2^2/v_t^2)));

a_v = @(v) -g(1 + v^2 / v_t^2);
a = @(t) a(v(t));

fplot(a, [t_2 t_3], 'b');
fplot(v, [t_2 t_3], 'm');
fplot(x, [t_2 t_3], 'k');

v_3 = v(t_3);
x_3 = x(t_3);

%% parachute descent (stage 4)
v_t = sqrt( 2 * m * g / (rho * C_d_par * A_p_par));
t_4 = t_3 + v_t/g * acosh(exp(g/v_t^2 * x_3));

v = @(t) v_t * tanh( -g/v_t *( t - t_3));

x = @(t) x_3 - v_t^2/g * log( cosh( -g/v_t * (t - t_3)));

a_v = @(v) -g * (1 - v^2/v_t^2);
a = @(t) a(v(t));

fplot(a, [t_3 t_4], 'b');
fplot(v, [t_3 t_4], 'm');
fplot(x, [t_3 t_4], 'k');
