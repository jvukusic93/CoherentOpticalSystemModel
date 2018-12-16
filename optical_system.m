tic
% Wavelenth of light
lambda = 632.8e-9;

% Distance between samples (in m) 6.328 * 10^-8, frequency of sampling
sample_distance = lambda/10; 

k=2*pi/lambda;

% Sensor distance (m) 0.1 mm = 100 mikro m.
z= 0.001;

% Hole size 64.7 micro m (1024 samples with distance 6.328 * 10^-8m).
% This is the hole through which light passes.
hole_size = 1024;

% Create signal.
signal = ones(hole_size,hole_size); 

% Add padding of zeros around signal
padding = zeros(hole_size,hole_size);
signal_M = [padding, padding, padding; padding, signal, padding; padding, padding ,padding];

% Calculate complex field on distance z where is our sensor placed.
sensor = fresnel_advance(signal_M, sample_distance, sample_distance,z,lambda);

% Plot absolute value of complex field, intensity of light on sensor.
figure, imagesc(abs(sensor(82:end,82:end)));
toc