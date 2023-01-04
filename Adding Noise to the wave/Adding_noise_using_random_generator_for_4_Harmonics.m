% In FFT always try to take number of samples in the power of 2.
% Greater the samples greater will be the accuracy.

clc;
clear all;
close all;

fs = 10000; % Sampling Frequency
ts = 1/fs; % Sampled Time
t = 0:ts:0.2-ts; % Making intervals of the wave or sampling the wave.
L = length(t); % Number of Samples.
f = 50; % Fundamental Frequency = 50 Hz.
h1 = 1; % 1st Harmonic
h3 = 3; % 3rd Harmonic
h5 = 5; % 5th Harmonic
h7 = 7; % 7th Harmonic

v1 = 1*sin(2*pi*h1*f*t);
n1 = rand(1, length(v1)); % Generating a random number of sequence equal to the v1 signal's length.
v1_n1 = v1 + n1; % Adding random noise to the signal v1.

v3 = 1*sin(2*pi*h3*f*t);
n3 = rand(1, length(v3)); % Generating a random number of sequence equal to the v3 signal's length.
v3_n3 = v3 + n3; % Adding random noise to the signal v3.

v5 = 1*sin(2*pi*h5*f*t);
n5 = rand(1, length(v5)); % Generating a random number of sequence equal to the v5 signal's length.
v5_n5 = v5 + n5; % Adding random noise to the signal v5.

v7 = 1*sin(2*pi*h7*f*t);
n7 = rand(1, length(v7)); % Generating a random number of sequence equal to the v7 signal's length.
v7_n7 = v7 + n7; % Adding random noise to the signal v7.

v_sum_n = v1_n1 + v3_n3 + v5_n5 + v7_n7;

v_fft = fft(v_sum_n); % Taking Fast Fourier Transform of v_sum.
v_abs_with_random_amplitude = abs(v_fft); % Taking real values so that we can plot.
v_abs = 2*abs(v_fft)/L; % Correcting the Amplitude part so that graph can show correct amplitude of the harmonics also.
x_axis = (0:L-1)*fs/L;


% Plotting the Graphs of Waves.

figure (1)
subplot (2, 2, 1)
plot (t, v1_n1)
title('1^{st} Fundamental Harmonic')
xlabel('Time')
ylabel('v_1')

subplot (2, 2, 2)
plot (t, v3_n3)
title('3^{rd} Fundamental Harmonic')
xlabel('Time')
ylabel('v_3')

subplot (2, 2, 3)
plot (t, v5_n5)
title('5^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_5')

subplot (2, 2, 4)
plot (t, v7_n7)
title('7^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_7')
suptitle('1^{st}, 3^{rd}, 5^{th} and 7^{th} Harmonics') % We can use sgtitle also but it comes in the 2018th version of MATLAB.


figure (2)
plot (t, v_sum_n)
title('Overall sum of the wave containing 1st, 3rd, 5th and 7th Harmonics')
xlabel('Time')
ylabel('v_{sum}')


figure (3)
plot (x_axis, v_abs)
title('Fourier Transform of v_{sum}')
ylabel('v^{fft}_{sum}')