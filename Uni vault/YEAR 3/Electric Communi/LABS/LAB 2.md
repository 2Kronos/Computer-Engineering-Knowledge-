
```MATLAB 
%% AM Modulation and Demodulation Investigation

% Clear workspace and figures

clear all;

close all;

clc;

%% Parameters

fs = 100; % Sampling frequency (Hz)

duration = 100; % Signal duration (seconds)

t = (0:1/fs:duration)'; % Time vector

% Message signal (1 Hz sine wave with harmonics)

message_signal = sin(2*pi*1*t) + 0.5*sin(2*pi*3*t) + 0.3*sin(2*pi*5*t);

carrier_freq = 10; % Carrier frequency (Hz)

%% Modulation

% Double Sideband AM

dsb_am_signal = ammod(message_signal, carrier_freq, fs);

% Single Sideband AM

ssb_am_signal = ssbmod(message_signal, carrier_freq, fs);

%% Noise Addition

SNR = 12; % Signal-to-Noise Ratio (dB)

noisy_dsb_signal = awgn(dsb_am_signal, SNR, 'measured');

noisy_ssb_signal = awgn(ssb_am_signal, SNR, 'measured');

%% Demodulation

% DSB Demodulation

dsb_demod_signal = amdemod(noisy_dsb_signal, carrier_freq, fs);

% SSB Demodulation

ssb_demod_signal = ssbdemod(noisy_ssb_signal, carrier_freq, fs);

%% Visualization

% Configure spectrum analyzer

spectrum_analyzer = spectrumAnalyzer(...

'SampleRate', fs, ...

'PlotAsTwoSidedSpectrum', false, ...

'YLimits', [-60, 50]);

% Original message signal

figure;

plot(t, message_signal);

title('Message Signal Before Modulation');

xlabel('Time (s)');

ylabel('Amplitude');

% DSB-AM Spectrum

spectrum_analyzer.Title = 'Double Sideband AM Spectrum';

spectrum_analyzer(dsb_am_signal);

% SSB-AM Spectrum

spectrum_analyzer.Title = 'Single Sideband AM Spectrum';

spectrum_analyzer(ssb_am_signal);

% Noisy DSB-AM Spectrum

spectrum_analyzer.Title = 'Noisy Double Sideband AM Spectrum';

spectrum_analyzer(noisy_dsb_signal);

% Noisy SSB-AM Spectrum

spectrum_analyzer.Title = 'Noisy Single Sideband AM Spectrum';

spectrum_analyzer(noisy_ssb_signal);

% Demodulated signals

spectrum_analyzer.Title = 'Demodulated DSB Signal';

spectrum_analyzer(dsb_demod_signal);

spectrum_analyzer.Title = 'Demodulated SSB Signal';

spectrum_analyzer(ssb_demod_signal);
```