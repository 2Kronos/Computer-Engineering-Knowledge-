
```matlab
%% Configs..

fs = 1000;

t_duration = 2;

t = 0:1/fs:t_duration-1/fs;

fm = 1;

Carrier_frequency = 10;

frequency_deviation = 5;

%% Creating Initial Signals..

Message_signal = sin(2*pi*fm*t); % Original message

FM_signal = fmmod(Message_signal, Carrier_frequency, fs, frequency_deviation);

%% Add Noise

noise_signal_FM = awgn(FM_signal, 12, 'measured');

FM_demodulated_signal = fmdemod(noise_signal_FM, Carrier_frequency, fs, frequency_deviation);

%% Plotting

figure;

subplot(2, 1, 1);

plot(t, noise_signal_FM);

title('input fm Signal');

xlabel('Time (s)'); ylabel('Amplitude');

grid on; xlim([0 t_duration]);

hold on;

N = length(t);

f_axis = (0:N/2)*(fs/N);

%% Noisy FM FFT

Y_noisy = fft(noise_signal_FM);

P1_noisy = abs(Y_noisy/N);

P1_noisy(2:end-1) = 2*P1_noisy(2:end-1);

subplot(2, 1, 2);

plot(f_axis, 20*log10(P1_noisy(1:N/2+1)) + eps);

title('FM freq Spectrum');

xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');

grid on; ylim([-60 10]);

sgtitle('Visualisation Analysis');
```