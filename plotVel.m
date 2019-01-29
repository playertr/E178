function plotVel(inputFig, color, g, m, A_p, A_p_par, rho, C_d, C_d_par, T1, t_1, T2, t_2)

v_0 = 0;
x_0 = 0;
t_0 = 0;


%% initial burn (stage 1)
v_max = sqrt( (2 * T1 - m*g)/(rho * C_d * A_p) );
b = T1/m - g;

v = @(t) v_max * tanh(b / v_max * (t - t_0) + atanh(v_0 / v_max) ); %v_0 < v_max

x = @(t) x_0 + v_max^2/b * ...
    (log(sinh( b/v_max * (t-t_0) + acoth(v_0/v_max) ) ) ...
    - log(sinh(acoth(v_0/v_max))));

a_v = @(v) T1/m - 0.5 * C_d * A_p * rho/m * v * abs(v) - g;
a = @(t) a_v(v(t)); 

figure(inputFig);

fplot(v, [t_0 t_1], color);

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


fplot(v, [t_1 t_2], color);

v_2 = v(t_2);
x_2 = x(t_2);

%% thrustless ascent (stage 3)
v_t = sqrt( 2 * m * g / (rho * C_d * A_p));
t_3 = t_2 + v_t/g * atan(v_2/v_t); %time to apogee

v = @(t) v_t * tan( -g/v_t * (t - t_2) + atan(v_2/v_t));

x = @(t) x_2 + v_t^2/g * ...
    (log( cos(g/v_t * (t - t_2) - atan(v_2/v_t))) ...
    + log( sqrt(1 + v_2^2/v_t^2)));

a_v = @(v) -g * (1 + v^2 / v_t^2);
a = @(t) a_v(v(t));


fplot(v, [t_2 t_3], color);

v_3 = v(t_3);
x_3 = x(t_3);

%% parachute descent (stage 4)
v_t = sqrt( 2 * m * g / (rho * C_d_par * A_p_par));
t_4 = t_3 + v_t/g * acosh(exp(g/v_t^2 * x_3));

v = @(t) v_t * tanh( -g/v_t *( t - t_3));

x = @(t) x_3 - v_t^2/g * log( cosh( -g/v_t * (t - t_3)));

a_v = @(v) -g * (1 - v^2/v_t^2);
a = @(t) a_v(v(t));


fplot(v, [t_3 t_4], color);


end