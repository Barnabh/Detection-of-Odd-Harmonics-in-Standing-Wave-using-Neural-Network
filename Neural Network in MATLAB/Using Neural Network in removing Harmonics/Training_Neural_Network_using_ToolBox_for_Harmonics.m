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

v1 = 1*sin(2*pi*h1*f*t);
v3 = 2*sin(2*pi*h3*f*t);
v5 = 3*sin(2*pi*h5*f*t);
v7 = 4*sin(2*pi*h7*f*t);

v_sum = v1 + v3 + v5 + v7;

v_fft = fft(v_sum); % Taking Fast Fourier Transform of v_sum.
v_abs_with_random_amplitude = abs(v_fft); % Taking real values so that we can plot.
v_abs = 2*abs(v_fft)/L; % Correcting the Amplitude part so that graph can show correct amplitude of the harmonics also.
x_axis = (0:L-1)*fs/L;

input = v_sum; % Defining input neuron to the Neural Network
output = v_abs; % Defining output neuron to the Neural Network