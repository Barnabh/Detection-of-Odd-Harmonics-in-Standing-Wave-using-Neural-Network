% In FFT always try to take number of samples in the power of 2.
% Greater the samples greater will be the accuracy.

clc;
clear all;
close all;

fs = 10000; % Sampling Frequency
ts = 1/fs; % Sampled Time
t = 0:ts:0.1-ts; % Making intervals of the wave or sampling the wave.
L = length(t); % Number of Samples.
f = 50; % Fundamental Frequency = 50 Hz.
h1 = 1; % 1st Harmonic
h3 = 3; % 3rd Harmonic
h5 = 5; % 5th Harmonic
h7 = 7; % 7th Harmonic
h9 = 9; % 9th Harmonic
h11 = 11; % 11th Harmonic
h13 = 13; % 13th Harmonic
h15 = 15; % 15th Harmonic

v1 = 1*sin(2*pi*h1*f*t);
v1_n1 = awgn(v1, 10); % Adding AWGN in signal v1 with SNR of 10 or of suitable choice.

v3 = 1*sin(2*pi*h3*f*t);
v3_n3 = awgn(v3, 10); % Adding AWGN in signal v3 with SNR of 10 or of suitable choice.

v5 = 1*sin(2*pi*h5*f*t);
v5_n5 = awgn(v5, 10); % Adding AWGN in signal v5 with SNR of 10 or of suitable choice.

v7 = 1*sin(2*pi*h7*f*t);
v7_n7 = awgn(v7, 10); % Adding AWGN in signal v7 with SNR of 10 or of suitable choice.

v9 = 1*sin(2*pi*h9*f*t);
v9_n9 = awgn(v9, 10); % Adding AWGN in signal v9 with SNR of 10 or of suitable choice.

v11 = 1*sin(2*pi*h11*f*t);
v11_n11 = awgn(v11, 10); % Adding AWGN in signal v11 with SNR of 10 or of suitable choice.

v13 = 1*sin(2*pi*h13*f*t);
v13_n13 = awgn(v13, 10); % Adding AWGN in signal v13 with SNR of 10 or of suitable choice.

v15 = 1*sin(2*pi*h15*f*t);
v15_n15 = awgn(v15, 10); % Adding AWGN in signal v15 with SNR of 10 or of suitable choice.

v_sum_n = v1_n1 + v3_n3 + v5_n5 + v7_n7 + v9_n9 + v11_n11 + v13_n13 + v15_n15;

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
subplot (2, 2, 1)
plot (t, v9_n9)
title('9^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_9')

subplot (2, 2, 2)
plot (t, v11_n11)
title('11^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_11')

subplot (2, 2, 3)
plot (t, v13_n13)
title('13^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_13')

subplot (2, 2, 4)
plot (t, v15_n15)
title('15^{th} Fundamental Harmonic')
xlabel('Time')
ylabel('v_15')
ylabel('v_7')

suptitle('9^{th}, 11^{th}, 13^{th} and 15^{th} Harmonics')


figure (3)
plot (t, v_sum_n)
title('Overall sum of the wave containing 1st, 3rd, 5th, 7th, 9th, 11th, 13th and 15th Harmonics')
xlabel('Time')
ylabel('v_{sum}')

figure (4)
plot (x_axis, v_abs)
title('Fourier Transform of v_{sum}')
ylabel('v^{fft}_{sum}')