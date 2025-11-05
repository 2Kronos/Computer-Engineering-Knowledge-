# Electronic Communications - All Formulas for Calculations

---

## 1. Calculation of Gain

### Power Gain (Amplifiers)

$$\text{Gain (dB)} = 10 \log_{10}\left(\frac{P_{out}}{P_{in}}\right)$$

**Where:**

- $P_{out}$ = Output power (Watts)
- $P_{in}$ = Input power (Watts)

---

### Voltage Gain

$$\text{Gain (dB)} = 20 \log_{10}\left(\frac{V_{out}}{V_{in}}\right)$$

**Where:**

- $V_{out}$ = Output voltage (Volts)
- $V_{in}$ = Input voltage (Volts)

> [!note] Use **10 log** for power ratios and **20 log** for voltage/current ratios

---

## 2. Upper Side Frequency (USB)

### Amplitude Modulation (AM)

$$f_{USB} = f_c + f_m$$

**Where:**

- $f_{USB}$ = Upper sideband frequency (Hz)
- $f_c$ = Carrier frequency (Hz)
- $f_m$ = Modulating signal (message) frequency (Hz)

---

### Multiple Modulating Frequencies

$$f_{USB} = f_c + f_{m(max)}$$

**Where:**

- $f_{m(max)}$ = Maximum modulating frequency

> [!example] If carrier = 1000 kHz and message = 5 kHz, then USB = 1005 kHz

---

## 3. Lower Side Frequency (LSB)

### Amplitude Modulation (AM)

$$f_{LSB} = f_c - f_m$$

**Where:**

- $f_{LSB}$ = Lower sideband frequency (Hz)
- $f_c$ = Carrier frequency (Hz)
- $f_m$ = Modulating signal (message) frequency (Hz)


---

## 4. Quantization Resolution

### Resolution (Voltage Step Size)


$$\text{Resolution} = \frac{V_{max} - V_{min}}{2^n}$$

**Where:**

- $V_{max}$ = Maximum voltage
- $V_{min}$ = Minimum voltage
- $n$ = Number of bits used in quantization
- $2^n$ = Number of quantization levels

---

### Number of Quantization Levels

$$\text{Number of Levels} = 2^n$$

**Examples:**

- 4-bit quantization: $2^4 = 16$ levels
- 8-bit quantization: $2^8 = 256$ levels
- 16-bit quantization: $2^{16} = 65,536$ levels

> [!tip] Higher bit count = Better resolution = Smaller voltage steps

---

## 5. Quantization Signal-to-Noise Ratio (SQNR)

### SQNR Formula

$$\text{SQNR (dB)} = 6.02n + 1.76$$

**Where:**

- $n$ = Number of bits used in quantization

> [!note] Each additional bit adds approximately **6 dB** to SQNR

-
---

### SQNR (from signal and noise power)

$$\text{SQNR} = \frac{P_{signal}}{P_{noise}} = \frac{\text{Signal Power}}{\text{Quantization Noise Power}}$$

---

## 6. Antenna Gain

### Antenna Gain Formula

$$G = \eta \times \frac{4\pi A}{\lambda^2}$$

**Where:**

- $G$ = Antenna Gain (dimensionless, not in dB)
- $\eta$ = Antenna Efficiency ($0 \leq \eta \leq 1$)
- $A$ = Physical Aperture Area (m²)
- $\lambda$ = Wavelength (m)
- $\pi = 3.14159...$

---

### Antenna Gain in dB (relative to isotropic)

$$G_{(dBi)} = 10 \log_{10}(G)$$

---

### Wavelength

$$\lambda = \frac{c}{f}$$

**Where:**

- $c$ = Speed of light = $3 \times 10^8$ m/s
- $f$ = Frequency (Hz)

---

### Relationship between Gain and Directivity

$$G = \eta \times D$$

**Where:**

- $D$ = Directivity

---

### Directivity

$$D = \frac{4\pi \times U_{max}}{P_{rad}}$$

**Where:**

- $U_{max}$ = Maximum radiation intensity (W/steradian)
- $P_{rad}$ = Total radiated power (W)

---

### Radiation Resistance

$$R_r = \frac{P_{rad}}{I^2}$$

**Where:**

- $R_r$ = Radiation resistance (Ω)
- $P_{rad}$ = Radiated power (W)
- $I$ = Antenna current at feedpoint (A)

> [!important] Antenna efficiency $\eta$ accounts for losses in the antenna structure

---

## 7. Resonant Frequency

### LC Circuit Resonant Frequency

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

## 8. Q Factor (Quality Factor)

### Q Factor Definition

$$Q = \frac{\text{Energy Stored}}{\text{Energy Lost per Cycle}}$$

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

## 9. Bandwidth

### Bandwidth (General)

$$BW = f_{high} - f_{low}$$

**Where:**

- $f_{high}$ = Upper cutoff frequency (Hz)
- $f_{low}$ = Lower cutoff frequency (Hz)



### Bandwidth from Q Factor

$$BW = \frac{f_r}{Q}$$

**Where:**

- $f_r$ = Resonant/center frequency (Hz)
- $Q$ = Quality factor


Band Pass Filter

###  Bandwidth Band Pass Filter
$$
BW = \frac{R}{2\pi L}
$$

---

### Rearranged

$$Q = \frac{f_r}{BW}$$


---

## 10. Image Frequency Rejection

### Image Frequency

$$f_{im} = f_s \pm 2f_{IF}$$

**Where:**

- $f_{im}$ = Image frequency (Hz)
- $f_s$ = Signal frequency (Hz)
- $f_{IF}$ = Intermediate frequency (Hz)

---

### For Superheterodyne Receiver

$$f_{im} = f_s + 2f_{IF} \quad \text{(for high-side injection)}$$

$$f_{im} = f_s - 2f_{IF} \quad \text{(for low-side injection)}$$

---

### Image Frequency Rejection Ratio (IFRR)

$$IFRR = \sqrt{1 + Q^2\left(\frac{f_{im}}{f_s} - \frac{f_s}{f_{im}}\right)^2}$$

**Where:**

- $Q$ = Quality factor of preselector (tuned circuit)
- $f_{im}$ = Image frequency
- $f_s$ = Signal frequency

---

### Simplified Form

$$IFRR \approx Q \times \left|\frac{\Delta f}{f_s}\right|$$

**Where:**

- $\Delta f = |f_{im} - f_s|$

---

### Image Frequency Rejection in dB

$$IFRR_{(dB)} = 20 \log_{10}(IFRR)$$

---

### Alternative Formula

$$IFRR = \sqrt{1 + Q^2\rho^2}$$

**Where:**

$$\rho = \frac{f_{im}}{f_s} - \frac{f_s}{f_{im}} = \frac{f_{im}^2 - f_s^2}{f_s \times f_{im}}$$

---

### For Single Tuned Circuit

$$IFRR = \sqrt{1 + Q^2\left(\frac{2f_{IF}}{f_s}\right)^2}$$

---

### Preselector Q Factor Relationship

$$Q = \frac{f_r}{BW}$$

**Where:**

- $f_r$ = Resonant frequency of preselector
- $BW$ = Bandwidth of preselector

> [!tip] **Higher Q** in preselector = **Better image frequency rejection**

---

## Additional Important Formulas

### 11. Characteristic Impedance (Transmission Lines)

$$Z_0 = \sqrt{\frac{L}{C}}$$

**Where:**

- $Z_0$ = Characteristic impedance (Ω)
- $L$ = Inductance per unit length (H/m)
- $C$ = Capacitance per unit length (F/m)

---

### For Two-Wire Transmission Line

$$Z_0 = \sqrt{Z_1 \times Z_2}$$

---

## 12. Voltage Standing Wave Ratio (VSWR)

$$VSWR = \frac{E_{max}}{E_{min}}$$

**Where:**

- $E_{max}$ = Maximum voltage on the line
- $E_{min}$ = Minimum voltage on the line

---

### From Reflection Coefficient

$$VSWR = \frac{1 + |\Gamma|}{1 - |\Gamma|}$$

**Where:**

- $\Gamma$ = Reflection coefficient

---

### Reflection Coefficient

$$\Gamma = \frac{Z_L - Z_0}{Z_L + Z_0}$$

**Where:**

- $Z_L$ = Load impedance
- $Z_0$ = Characteristic impedance

> [!note]
> 
> - **VSWR = 1** means perfect match (no reflections)
> - **VSWR > 1** means mismatch exists

---

## 13. Propagation Velocity (Transmission Lines)

$$V_p = \frac{1}{\sqrt{LC}}$$

**Where:**

- $V_p$ = Propagation velocity (m/s)
- $L$ = Inductance per unit length
- $C$ = Capacitance per unit length

---

### As Fraction of Speed of Light

$$V_p = \frac{c}{\sqrt{\varepsilon_r}}$$

**Where:**

- $c$ = Speed of light = $3 \times 10^8$ m/s
- $\varepsilon_r$ = Relative permittivity (dielectric constant)

---

## 14. Sampling Frequency (Nyquist Theorem)

$$f_s \geq 2 \times f_{max}$$

**Where:**

- $f_s$ = Sampling frequency (Hz)
- $f_{max}$ = Maximum frequency component in signal (Hz)

---

### Nyquist Rate

$$f_{Nyquist} = 2 \times f_{max}$$

> [!warning] Sampling below Nyquist rate causes **aliasing** (signal distortion)

---

## 15. Dynamic Range

$$DR = \frac{V_{max}}{V_{min}}$$

---

### In Decibels

$$DR_{(dB)} = 20 \log_{10}\left(\frac{V_{max}}{V_{min}}\right)$$

---

### For n-bit System

$$DR_{(dB)} \approx 6.02n$$

---

## 16. Electrical Length of Antenna

$$\text{Electrical Length} = \frac{\text{Physical Length}}{\lambda}$$

**Where:**

- $\lambda$ = Wavelength = $\frac{c}{f}$

---

### For Half-Wave Dipole

$$\text{Physical Length} = \frac{\lambda}{2}$$

$$\text{Electrical Length} = 0.5$$

---

### For Quarter-Wave Monopole

$$\text{Physical Length} = \frac{\lambda}{4}$$

$$\text{Electrical Length} = 0.25$$

---

## Quick Reference Summary Table

|Parameter|Formula|Units|
|:--|:--|:--|
|**Gain (Power)**|$10 \log_{10}(P_{out}/P_{in})$|dB|
|**Gain (Voltage)**|$20 \log_{10}(V_{out}/V_{in})$|dB|
|**USB**|$f_c + f_m$|Hz|
|**LSB**|$f_c - f_m$|Hz|
|**Quantization Resolution**|$V_{fs} / 2^n$|Volts|
|**SQNR**|$6.02n + 1.76$|dB|
|**Antenna Gain**|$\eta(4\pi A)/\lambda^2$|dimensionless|
|**Resonant Frequency**|$1/(2\pi\sqrt{LC})$|Hz|
|**Q Factor**|$f_r / BW$ or $X_L/R$|dimensionless|
|**Bandwidth**|$f_{high} - f_{low}$ or $f_r/Q$|Hz|
|**Image Frequency**|$f_s \pm 2f_{IF}$|Hz|
|**IFRR**|$\sqrt{1 + Q^2\rho^2}$|dimensionless|

---

## Tips for Exam Calculations

> [!tip] Calculation Strategy
> 
> 1. **Always write units** in your calculations
> 2. **Convert to base units** (Hz, not MHz; Volts, not mV)
> 3. **Show all steps** - partial credit often awarded
> 4. **Check reasonability** of answer
> 5. **Remember** $\pi = 3.14159$ or use calculator value

---

> [!important] Key Reminders
> 
> - **For dB calculations:** Use **10 log** for power, **20 log** for voltage/current
> - **Wavelength:** $\lambda = c/f$ where $c = 3 \times 10^8$ m/s
> - **At resonance:** $X_L = X_C$

---

> [!example] Common Conversions
> 
> - 1 MHz = $10^6$ Hz
> - 1 GHz = $10^9$ Hz
> - 1 mV = $10^{-3}$ V
> - 1 μH = $10^{-6}$ H
> - 1 pF = $10^{-12}$ F

---

**Good Luck with Your Calculations! 📐🎯**