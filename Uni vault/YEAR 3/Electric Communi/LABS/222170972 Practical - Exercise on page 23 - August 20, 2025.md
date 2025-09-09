

### Superheterodyne Receiver

---

## 1. Effect of Increasing Input Signal Power

In this part of the lab, the input signal power was varied to see how it impacts the receiver’s performance. As expected, when you increase the input power, the output power also rises linearly, but only up to a point. Once the amplifiers get close to their compression or OIP3 limits, nonlinear effects start showing up, and distortion increases.

* **Output Power:** Follows the input closely until saturation or compression is reached.
* **Noise Figure (NF):** Doesn’t change much, since NF is mainly a property of the receiver itself, not the input signal.
* **OIP3:** The device’s OIP3 value remains constant, but stronger inputs make distortion products more visible at the output.

This was tested using MATLAB, where the input power was adjusted over a range of values and the results were recorded.

### MATLAB Code

```matlab
% Define receiver elements
elements(1) = rfelement('Name', 'TRSwitch', 'Gain', -1.3, 'NF', 2.3, 'OIP3', 37);
Fcenter = 5.8e9;
Bwpass = 20e6;
Z = 132.986;

elements(2) = rffilter('ResponseType', 'Bandpass', 'FilterType', 'Butterworth', 'FilterOrder', 6, ...
    'PassbandAttenuation', 10*log10(2), 'Implementation', 'Transfer function', ...
    'PassbandFrequency', [Fcenter-Bwpass/2 Fcenter+Bwpass/2], 'Zout', 50, 'Name', 'RF_Filter');

elements(3) = amplifier('Name', 'LNA', 'Gain', 15, 'NF', 1.5, 'OIP3', 26, 'Zin', Z);
elements(4) = amplifier('Name', 'Gain', 'Gain', 10.5, 'NF', 3.5, 'OIP3', 23);
elements(5) = modulator('Name', 'Demod', 'Gain', -7, 'NF', 7, 'OIP3', 15, 'LO',5.4e9, 'ConverterType', 'Down');

FcenterIF = 400e6;
BwpassIF = 5e6;
elements(6) = rffilter('ResponseType', 'Bandpass', 'FilterType', 'Butterworth', 'FilterOrder', 4, ...
    'PassbandAttenuation', 10*log10(2), 'Implementation', 'Transfer function', ...
    'PassbandFrequency', [FcenterIF-BwpassIF/2 FcenterIF+BwpassIF/2], 'Zout',50, 'Name', 'IF_Filter');

elements(7) = amplifier('Name', 'IFAmp', 'Gain', 40, 'NF', 2.5, 'Zin',Z);
elements(8) = amplifier('Name', 'AGC', 'Gain', 17.5, 'NF', 4.3, 'OIP3', 36);

% Vary input power
input_powers = [-66, -56, -46]; % dBm: low, medium, high levels

% Store results
results = struct();

for i = 1:length(input_powers)
    superhet = rfbudget('Elements', elements, ...
        'InputFrequency', 5.8e9, ...
        'AvailableInputPower', input_powers(i), ...
        'SignalBandwidth', 20e6);

    % Collect results
    results(i).InputPower = input_powers(i);
    results(i).OutputPower = superhet.OutputPower(end);
    results(i).NoiseFigure = superhet.NoiseFigure(end);
    results(i).OIP3 = superhet.OIP3(end);
end

% Display table of results
disp(struct2table(results))
```

---

## 2. Influence of Filter Order

Filters shape the receiver’s selectivity, but their design comes with trade-offs. Increasing the filter order makes the cutoff sharper, which helps reject unwanted signals more effectively. On the downside, higher-order filters introduce more insertion loss, and this reduces both the signal strength and degrades the noise figure.

* **Higher Order Filters:** Better selectivity, but more signal loss.
* **Output Power:** Drops as filter order increases.
* **Noise Figure:** Gets worse if high-order filters are placed before the low-noise amplifier.

MATLAB was used to test filters of different orders, and the results clearly showed this trade-off between selectivity and noise performance.

### MATLAB Code

```matlab
filter_orders = [2, 4, 6, 8]; % Different filter orders to test
results_order = struct();

for i = 1:length(filter_orders)
    % Adjust RF filter order
    elements(2) = rffilter('ResponseType', 'Bandpass', 'FilterType', 'Butterworth', ...
        'FilterOrder', filter_orders(i), 'PassbandAttenuation', 10*log10(2), ...
        'Implementation', 'Transfer function', ...
        'PassbandFrequency', [Fcenter-Bwpass/2 Fcenter+Bwpass/2], 'Zout', 50, 'Name', 'RF_Filter');

    % Run analysis
    superhet = rfbudget('Elements', elements, ...
        'InputFrequency', 5.8e9, ...
        'AvailableInputPower', -66, ...
        'SignalBandwidth', 20e6);

    % Store results
    results_order(i).FilterOrder = filter_orders(i);
    results_order(i).OutputPower = superhet.OutputPower(end);
    results_order(i).NoiseFigure = superhet.NoiseFigure(end);
end

% Show results
disp(struct2table(results_order))
```

---

## 3. Performance with Low OIP3 Values

OIP3 tells us how linear a receiver is. A low OIP3 means the receiver is more prone to distortion, which is generally undesirable. Low OIP3 performance can be simulated by selecting components with poor linearity, high insertion loss, or by pushing amplifiers closer to their compression points.

* **Low OIP3 Components:** Typically around 10–20 dBm.
* **System Impact:** Stronger signals produce distortion earlier, leading to poor receiver performance.
* **In MATLAB:** This can be set by lowering the OIP3 values for amplifiers, mixers, or switches in the chain.

### MATLAB Example

```matlab
% Example of reducing OIP3 for the LNA
elements(3) = amplifier('Name', 'LNA', 'Gain', 15, 'NF', 1.5, 'OIP3', 10, 'Zin', Z);
```

By lowering OIP3, MATLAB simulations can demonstrate how distortion appears more easily, making it clear why in real-world designs engineers try to maximize OIP3 as much as possible.

---
