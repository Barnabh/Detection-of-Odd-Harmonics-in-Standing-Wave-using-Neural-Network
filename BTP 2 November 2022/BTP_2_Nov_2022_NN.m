clc;
clear all;
close all;

fs = 10000; % Sampling Frequency
ts = 1/fs; % Sampled Time
t = 0:ts:200-ts; % Making intervals of the wave or sampling the wave.
f = 50; % Fundamental Frequency = 50 Hz.
h1 = 1; % 1st Harmonic
h3 = 3; % 3rd Harmonic
h5 = 5; % 5th Harmonic
h7 = 7; % 7th Harmonic
h9 = 9; % 9th Harmonic
h11 = 11; % 11th Harmonic
h13 = 13; % 13th Harmonic
h15 = 15; % 15th Harmonic

A = randi(5, 1, 10000);
partitions = 10000;

v1 = 1*sin(2*pi*h1*f*t);
for i = 1:partitions;
    
    temp = ((i-1)*200) + 1;
    
    for j = temp:temp + 199
    
        v1_new(j) = A(i)*v1(j);
        end;
        
end;

v3 = 1*sin(2*pi*h3*f*t);
for i = 1:partitions;
    
    temp = ((i-1)*200) + 1;
    
    for j = temp:temp + 199
    
        v3_new(j) = A(i)*v3(j);
        end;
        
end;

v5 = 1*sin(2*pi*h5*f*t);
for i = 1:partitions;
    
    temp = ((i-1)*200) + 1;
    
    for j = temp:temp + 199
    
        v5_new(j) = A(i)*v5(j);
        end;
        
end;

v7 = 1*sin(2*pi*h7*f*t);
for i = 1:partitions;
    
    temp = ((i-1)*200) + 1;
    
    for j = temp:temp + 199
    
        v7_new(j) = A(i)*v7(j);
        end;
        
end;

v9 = 1*sin(2*pi*h9*f*t);
for i = 1:partitions;
    
    temp = ((i-1)*200) + 1;
    
    for j = temp:temp + 199
    
        v9_new(j) = A(i)*v9(j);
        end;
        
end;

v11 = 1*sin(2*pi*h11*f*t);
for i = 1:partitions;
    
    temp = ((i-1)*200) + 1;
    
    for j = temp:temp + 199
    
        v11_new(j) = A(i)*v11(j);
        end;
        
end;

v13 = 1*sin(2*pi*h13*f*t);
for i = 1:partitions;
    
    temp = ((i-1)*200) + 1;
    
    for j = temp:temp + 199
    
        v13_new(j) = A(i)*v13(j);
        end;
        
end;

v15 = 1*sin(2*pi*h15*f*t);
for i = 1:partitions;
    
    temp = ((i-1)*200) + 1;
    
    for j = temp:temp + 199
    
        v15_new(j) = A(i)*v15(j);
        end;
        
end;

v_sum = v1 + v3 + v5 + v7 + v9 + v11 + v13 + v15;
v_sum_new = v1_new + v3_new + v5_new + v7_new + v9_new + v11_new + v13_new + v15_new;

for l = 1:200000
    v_sum_new_sampled(l) = v_sum_new(10*l);
end;

for m = 1:20
    
    for n = 1:10000
        Final_input(m, n) = v_sum_new_sampled(20*(n-1) + m);
    end;
end;

for b = 1:8
    for v = 1:10000
        Final_output(b, v) = A(v);
    end;
end;

% Plotting the Graphs of Waves.

figure (1)
subplot (2, 2, 1)
plot (t, v1)
hold on 
plot (t, v1_new)
title('1^{st} Fundamental Harmonic')
xlabel('Time')
ylabel('v_1')

subplot (2, 2, 2)
plot (t, v3)
hold on
plot (t, v3_new)
title('3^{rd} Fundamental Harmonic')
xlabel('Time')
ylabel('v_3')

subplot (2, 2, 3)
plot (t, v5)
hold on
plot (t, v5_new)
title('5^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_5')

subplot (2, 2, 4)
plot (t, v7)
hold on
plot (t, v7_new)
title('7^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_7')

suptitle('1^{st}, 3^{rd}, 5^{th} and 7^{th} Harmonics') % We can use sgtitle also but it comes in the 2018th version of MATLAB.


figure (2)
subplot (2, 2, 1)
plot (t, v9)
hold on
plot (t, v9_new)
title('9^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_9')

subplot (2, 2, 2)
plot (t, v11)
hold on
plot (t, v11_new)
title('11^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_11')

subplot (2, 2, 3)
plot (t, v13)
hold on
plot (t, v13_new)
title('13^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_13')

subplot (2, 2, 4)
plot (t, v15)
hold on
plot (t, v15_new)
title('15^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_15')
ylabel('v_7')

suptitle('9^{th}, 11^{th}, 13^{th} and 15^{th} Harmonics')

figure (4)
plot (t, v_sum)
hold on
plot (t, v_sum_new)
title('Overall sum of the wave containing 1st, 3rd, 5th, 7th, 9th, 11th, 13th and 15th Harmonics')
xlabel('Time')
ylabel('v_{sum}')