# COMS Formulas

## 1. Power Gain in Decibels (dB)

Expresses the ratio of output power ($P_{\text{out}}$) to input power ($P_{\text{in}}$) on a logarithmic scale.

$$
\text{Gain}_{\text{dB}} = 10 \log_{10} \left( \frac{P_{\text{out}}}{P_{\text{in}}} \right)
$$

| Variable           | Explanation                                                        |
|--------------------|--------------------------------------------------------------------|
| $\text{Gain}_{\text{dB}}$ | Power Gain, measured in decibels (dB)                  |
| $P_{\text{out}}$   | Output Power (Watts or milliwatts)                                 |
| $P_{\text{in}}$    | Input Power (Watts or milliwatts)                                  |
| $\log_{10}$        | Logarithm base 10                                                  |

---

## 2. Decibel Formulas (Voltage & Current)

### a) Voltage Ratio (Equal Resistance)
$$
A_{db(V)} = 20 \log_{10} \left( \frac{V_2}{V_1} \right)
$$

### b) Voltage Ratio (Unequal Resistance)
$$
A_{db(V)} = 20 \log_{10} \left( \frac{V_2 \sqrt{R_1}}{V_1 \sqrt{R_2}} \right)
$$

### c) Current Ratio (Equal Resistance)
$$
A_{db(I)} = 20 \log_{10} \left( \frac{I_2}{I_1} \right)
$$

### d) Current Ratio (Unequal Resistance)
$$
A_{db(I)} = 20 \log_{10} \left( \frac{I_2 \sqrt{R_2}}{I_1 \sqrt{R_1}} \right)
$$

| Variable | Explanation |
|----------|-------------|
| $V_2$/$V_1$ | Output/Input voltage |
| $I_2$/$I_1$ | Output/Input current |
| $R_1$/$R_2$ | Input/Output resistance |

---

## 3. Modulation Index (AM)

### a) Amplitude Ratio
$$
m = \frac{E_i}{E_c}
$$

### b) Peak-to-Peak Value
$$
m = \frac{B - A}{B + A}
$$

| Variable | Explanation |
|----------|-------------|
| $m$      | Modulation index ($0 \le m \le 1$) |
| $E_i$    | Amplitude of modulating signal      |
| $E_c$    | Amplitude of carrier signal         |
| $A$      | Minimum peak-to-peak value          |
| $B$      | Maximum peak-to-peak value          |

---

## 4. Full AM Waveform & Variants

### a) Standard Double-Sideband Full Carrier (DSB-FC)
**Cosine Carrier:**
$$
v_{AM}(t) = E_c \cos(2\pi f_c t) + \frac{m E_c}{2} \cos(2\pi (f_c + f_m)t) + \frac{m E_c}{2} \cos(2\pi (f_c - f_m)t)
$$

**Sine Carrier:**
$$
v_{AM}(t) = E_c \sin(2\pi f_c t) + \frac{m E_c}{2} \cos(2\pi (f_c - f_m)t) - \frac{m E_c}{2} \cos(2\pi (f_c + f_m)t)
$$

### b) Double Sideband Suppressed Carrier (DSB-SC)
$$
e_{DSB-SC} = E_m \cos(\omega_i t) \cos(\omega_c t)
$$
$$
P_t = P_c \frac{m^2}{2}
$$

### c) Single Sideband Full Carrier (SSB-FC)
$$
e_{SSB-FC} = E_c \cos(\omega_c t) + \frac{m E_c}{2} \cos((\omega_c + \omega_i)t)
$$
$$
P_t = P_c \left( 1 + \frac{m^2}{4} \right)
$$

### d) Single Sideband Suppressed Carrier (SSB-SC)
$$
e_{SSB-SC} = \frac{m E_c}{2} \cos((\omega_c + \omega_i)t)
$$
$$
P_t = P_c \frac{m^2}{4}
$$

### e) Double Sideband Full Carrier (DSB-FC)
$$
e_{DSB-FC} = E_c \cos(\omega_c t) + \frac{m E_c}{2} \cos((\omega_c - \omega_i)t) - \frac{m E_c}{2} \cos((\omega_c + \omega_i)t)
$$
$$
P_t = P_c \left( 1 + \frac{m^2}{2} \right)
$$

| Variable | Explanation |
|----------|-------------|
| $E_c$    | Carrier amplitude (Volts) |
| $f_c, \omega_c$ | Carrier frequency (Hz, rad/s) |
| $f_m, \omega_i$ | Message frequency (Hz, rad/s) |
| $m$      | Modulation index |
| $P_c$    | Carrier power |
| $P_t$    | Total power |

---

## 5. Side Frequency Amplitude (AM)

$$
E_{sf} = \frac{m E_c}{2}
$$

| Variable | Explanation |
|----------|-------------|
| $E_{sf}$ | Amplitude of side frequency |
| $m$      | Modulation index           |
| $E_c$    | Carrier amplitude          |

---

## 6. Total Current in AM

$$
I_t = I_c \sqrt{1 + \frac{m^2}{2}}
$$

| Variable | Explanation |
|----------|-------------|
| $I_t$    | Total AM current |
| $I_c$    | Carrier current  |
| $m$      | Modulation index |

---

## 7. Gain with Reference Power

### a) Reference to 1W
$$
A_{dbW} = 10 \log_{10} \left( \frac{P}{1W} \right)
$$

### b) Reference to 1mW
$$
A_{dbm} = 10 \log_{10} \left( \frac{P}{1mW} \right)
$$

| Variable | Explanation |
|----------|-------------|
| $A_{dbW}$ | Gain relative to 1 watt  |
| $A_{dbm}$ | Gain relative to 1 mW    |
| $P$       | Power                    |

---

## 8. RLC Circuit & Resonance

### a) Resonance Frequency
$$
f_r = \frac{1}{2\pi\sqrt{LC}}
$$
$$
\omega_0 = \frac{1}{\sqrt{LC}}
$$

### b) Inductive Reactance
$$
X_L = 2\pi f L
$$
### c) Capacitive Reactance
$$
X_C = \frac{1}{2\pi f C}
$$

### d) Impedance (RLC Circuit)
$$
Z = \sqrt{R^2 + (X_L - X_C)^2}
$$

### e) Voltage Divider at Resonance
$$
e_{out} = e_{in} \left( \frac{R_2}{R_1 + R_2} \right)
$$

| Variable | Explanation |
|----------|-------------|
| $Z$      | Impedance           |
| $R$      | Resistance          |
| $L$      | Inductance          |
| $C$      | Capacitance         |
| $X_L$    | Inductive reactance |
| $X_C$    | Capacitive reactance|
| $e_{out}$| Output voltage      |
| $e_{in}$ | Input voltage       |
| $R_1, R_2$| Resistances        |

---

## 9. Q Factor

### a) Inductor
$$
Q_L = \frac{X_L}{R}
$$

### b) Capacitor
$$
Q_C = \frac{X_C}{R}
$$

### c) Resonance Frequency & Bandwidth Q
$$
Q = \frac{f_r}{BW}
$$

---

## 10. Band Pass Filter

### a) Bandwidth
$$
BW = \frac{R}{2\pi L}
$$

### b) Q Factor (Alternative)
$$
Q = \frac{f_r}{BW}
$$

---

## 11. Antenna Formulas (Additional Reference)

### a) Antenna Gain (Power Density)
$$
G = \frac{V_{\text{aut}}}{V_{\text{ref}}}
$$
$$
V_{\text{ref}} = \frac{P_{\text{in}}}{4\pi}
$$
$$
G = \frac{4\pi V_{\text{aut}}}{P_{\text{in}}}
$$

### b) Aperture Method
$$
G = \eta \frac{4\pi A}{\lambda^2}
$$

### c) Radiation Resistance
$$
R_r = \frac{P_{\text{rad}}}{I^2}
$$

### d) Directivity
$$
D = \frac{4\pi U_{\max}}{P_{\text{rad}}}
$$

| Variable | Explanation |
|----------|-------------|
| $G$      | Antenna gain (dimensionless) |
| $\eta$   | Antenna efficiency           |
| $A$      | Aperture area                |
| $\lambda$| Wavelength                   |
| $R_r$    | Radiation resistance         |
| $D$      | Directivity                  |
| $V_{\text{aut}}$ | AUT radiation intensity |
| $V_{\text{ref}}$ | Reference intensity     |
| $P_{\text{in}}$  | Input power             |
| $P_{\text{rad}}$ | Radiated power          |
| $I$      | Antenna current               |
| $U_{\max}$| Max radiation intensity       |

---

## 12. Superheterodyne Receiver Formulas (Additional Reference)

### a) Intermediate Frequency (IF)
$$
\omega_{if} = \omega_{lo} - \omega_{rf}
$$

### b) Image Frequency
$$
f_{im} = f_{rf} \pm 2 f_{if}
$$

### c) Image Rejection Ratio
$$
\text{IRR} = \sqrt{1 + Q^2 \rho^2}
$$
$$
\rho = \frac{f_{im}}{f_{rf}} - \frac{f_{rf}}{f_{im}}
$$

### d) Image Rejection Ratio in dB
$$
\text{IRR}_{\text{dB}} = 20 \log_{10}(\text{IRR})
$$

---

## 13. Quantization & Sampling (Additional Reference)

### a) Quantization Levels
$$
L = 2^n
$$

### b) Quantization Step Size
$$
\Delta = \frac{V_{\max} - V_{\min}}{L}
$$

### c) Quantization Index
$$
\text{Index} = \text{roundoff}\left( \frac{x - V_{\min}}{\Delta} \right)
$$

### d) Quantized Output Voltage
$$
x_q = V_{\min} + \Delta (\text{Index})
$$

### e) Quantization Error
$$
e = x_q - x
$$

### f) Quantization SNR (Dynamic Range)
$$
\text{SNR}_{\text{DR}} \approx 6.02 n \quad (\text{dB})
$$

### g) Peak SNR (Sinusoidal Input)
$$
\text{SNR} \approx 6.02 n + 1.76 \quad (\text{dB})
$$

---
