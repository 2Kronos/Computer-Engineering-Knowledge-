
# Code explanation 

# Explanation of MATLAB Code for AM Modulation (Pages 9-10)

Let me break down the code and the resulting spectrum analyzer output in detail, explaining every component and how to interpret the graphs.

---

### **1. Code Explanation (Line-by-Line)**

#### **Initialization**
```matlab
clear all; close all; clc;
```
- `clear all`: Clears all variables from the workspace.
- `close all`: Closes all open figures.
- `clc`: Clears the command window.

#### **Time Parameters**
```matlab
fs = 100;               % Sampling frequency (100 Hz)
duration = 100;         % Signal duration (100 seconds)
t = (0:1/fs:duration)'; % Time vector (column vector from 0 to 100s in 0.01s steps)
```
- `fs = 100`: Sets the sampling rate to **100 Hz** (100 samples per second).
- `duration = 100`: The signal lasts for **100 seconds**.
- `t = (0:1/fs:duration)'`: Creates a time vector from `0` to `100` seconds in steps of `1/fs = 0.01` seconds.  
  - The `'` transposes it into a column vector (useful for matrix operations).

#### **Signal Parameters**
```matlab
carrier_freq = 10;      % Carrier frequency (10 Hz)
```
- `carrier_freq = 10`: The carrier wave (radio frequency) is **10 Hz**.

#### **Message Signal**
```matlab
message_signal = sin(2*pi*1*t) + 0.5*sin(2*pi*3*t) + 0.3*sin(2*pi*5*t);
```
- This creates a **composite message signal** with three sine waves:
  1. **1 Hz** sine wave (amplitude = 1).
  2. **3 Hz** sine wave (amplitude = 0.5).
  3. **5 Hz** sine wave (amplitude = 0.3).
- This simulates a real-world signal (e.g., audio) with multiple frequency components.

#### **Modulation**
```matlab
dsb_am_signal = ammod(message_signal, carrier_freq, fs);  % Double Sideband AM
ssb_am_signal = ssbmod(message_signal, carrier_freq, fs); % Single Sideband AM
```
- `ammod()`: Performs **Double Sideband AM (DSB-AM)** modulation.
  - Output includes:
    - **Upper sidebands (USB)**: `carrier_freq + message_frequencies` (11 Hz, 13 Hz, 15 Hz).
    - **Lower sidebands (LSB)**: `carrier_freq - message_frequencies` (9 Hz, 7 Hz, 5 Hz).
    - **Carrier peak** at 10 Hz (if not suppressed).
- `ssbmod()`: Performs **Single Sideband AM (SSB-AM)** modulation.
  - Output includes **only one sideband** (default: lower sideband, LSB).

#### **Spectrum Analyzer Setup**
```matlab
spectrum_analyzer = spectrumAnalyzer(...
    'SampleRate', fs, ...
    'PlotAsTwoSidedSpectrum', false, ... % Show only positive frequencies
    'YLimits', [-60, 50], ...           % Y-axis limits in dBm
    'Title', 'Double Sideband AM Spectrum');
```
- `SampleRate=fs`: Sets the analyzer to match the signal’s sampling rate (100 Hz).
- `PlotAsTwoSidedSpectrum=false`: Shows **only positive frequencies** (0 Hz to 50 Hz).
- `YLimits=[-60,50]`: Sets the y-axis range from **-60 dBm to 50 dBm**.
- `Title`: Labels the plot.

#### **Visualization**
```matlab
spectrum_analyzer(ssb_am_signal);
```
- Displays the spectrum of the **SSB-AM signal** (lower sideband by default).

---

### **2. Spectrum Analyzer Output Interpretation**
When you run this code, you’ll see a plot like this (for SSB-AM):

#### **Graph Axes**
- **X-axis (Frequency)**: Ranges from **0 Hz to 50 Hz** (Nyquist frequency = `fs/2 = 50 Hz`).
- **Y-axis (Power in dBm)**: Shows signal power from **-60 dBm to 50 dBm**.

#### **Peaks in SSB-AM Spectrum**
For `ssb_am_signal`, you’ll see:
1. **Lower Sidebands (LSB)**:
   - **5 Hz** (`carrier_freq - 5 Hz`).
   - **7 Hz** (`carrier_freq - 3 Hz`).
   - **9 Hz** (`carrier_freq - 1 Hz`).
2. **No Carrier Peak** (SSB-AM suppresses the carrier).
3. **No Upper Sidebands** (SSB-AM filters them out).

#### **Expected Power Levels**
- The **1 Hz component** (strongest at amplitude = 1) → Highest peak (~9 Hz).
- The **3 Hz component** (amplitude = 0.5) → Middle peak (~7 Hz).
- The **5 Hz component** (amplitude = 0.3) → Smallest peak (~5 Hz).

#### **Key Observations**
- **DSB-AM** would show **symmetrical sidebands** (peaks at 5 Hz, 7 Hz, 9 Hz, 11 Hz, 13 Hz, 15 Hz).
- **SSB-AM** shows **only one set of sidebands** (here, LSB at 5 Hz, 7 Hz, 9 Hz).

---

### **3. Practical Interpretation**
- **Peak Locations**: Tell you the **frequencies present** in the modulated signal.
- **Peak Heights**: Indicate the **relative strength** of each frequency component.
- **Bandwidth**:
  - DSB-AM bandwidth = `2 × highest message frequency` (here, `2 × 5 Hz = 10 Hz`).
  - SSB-AM bandwidth = `highest message frequency` (here, `5 Hz`).

---

### **4. Troubleshooting the Graph**
If your graph looks incorrect:
1. **Check `fs`**: Too low → Aliasing (distorted peaks).  
   Fix: Increase `fs` (e.g., `fs = 1000`).
2. **Check `YLimits`**: Too narrow → Peaks may be cut off.  
   Fix: Adjust to `[-80, 20]` if needed.
3. **Verify modulation type**:  
   - For DSB-AM, use `spectrum_analyzer(dsb_am_signal)`.  
   - For SSB-AM, use `spectrum_analyzer(ssb_am_signal)`.

---

### **Summary**
- The code generates a **multi-tone message signal**, modulates it (DSB/SSB), and plots its spectrum.
- The **spectrum analyzer** shows frequency content:
  - **DSB-AM**: Two symmetrical sidebands + carrier (if not suppressed).
  - **SSB-AM**: One sideband + no carrier.
- **Peak heights** reflect the amplitudes of the original message components.

Let me know if you’d like to explore specific parts further!

## Critical Questions from Page 11

1. **Bandwidth Determination**:
   - For the single sideband (SSB) signal in Figure 5, the bandwidth is approximately the bandwidth of the original message signal (1 Hz for the sine wave) since SSB only transmits one sideband.
   - For the double sideband (DSB) signal in Figure 6, the bandwidth is twice that of SSB (about 2 Hz) because it transmits both upper and lower sidebands.
   - The message signal bandwidth before modulation is just the frequency of the sine wave (1 Hz).

2. **Modulation's Influence on Power and Bandwidth**:
   - DSB-AM uses more power than SSB because it transmits both sidebands (all the peaks in Figure 6).
   - DSB requires twice the bandwidth of SSB since it transmits two copies of the information (upper and lower sidebands).
   - SSB is more efficient in both power and bandwidth usage but is more complex to implement in hardware.
   - The modulation process shifts the original signal's frequency content from baseband (centered at 0 Hz) to be centered around the carrier frequency (10 Hz).