
### # 1.1. Digital Technology and Applications

### **1. Sampling Frequency**
<u>How to determine the sampling Frequency?</u>
The sampling frequency is determined using the **Nyquist rule**. It states that for a signal with a maximum frequency component $f_{max}$, the minimum sampling frequency $f_s$ required to reliably reconstruct the signal without aliasing is:
$f_s \geq 2 \times f_{max}$

### **2. Baseband Modulation**
<u>Explain what is Baseband</u>
Baseband modulation transmits a digital signal in its original form without shifting its frequency. It uses the entire bandwidth of the channel for a single data stream and is suited for short-distance, low-data-rate communication.
- **Common Techniques**: Pulse Amplitude Modulation (PAM), Pulse Width Modulation (PWM), Pulse Position Modulation (PPM), Pulse Code Modulation (PCM).
- **Noise Immunity Order** (Least to Most): PAM → PWM → PPM → PCM.

### **3. Broadband Modulation (BBM)**
<u>Explain what is Broadband Modulation in data techniques</u>
Broadband Modulation (BBM) involves modulating a data signal onto a high-frequency carrier wave. This allows multiple signals to be transmitted simultaneously over a single channel (using Frequency Division Multiplexing) and is essential for achieving high data rates over long distances.
- **Common Techniques**: Phase Shift Keying (PSK: 4-PSK, 8-PSK, 16-PSK) and Quadrature Amplitude Modulation (QAM: 4-QAM, 16-QAM, 64-QAM, etc.).

<u>What is the distinguishing factor between broadband modulation techniques as constellation?</u>
The distinguishing factor is their **constellation diagram**, which plots the signal states in the In-phase (I) and Quadrature (Q) plane. The arrangement and distance between points (symbols) in this diagram determine the technique's data rate, noise immunity, and susceptibility to Inter-Symbol Interference (ISI).

<u>Why can't we move above 16 PSK?</u>
Moving beyond 16-PSK is impractical because the phase states become too close together (only 22.5° apart for 16-PSK). This drastically increases susceptibility to noise and ISI, and requires an impractically high Signal-to-Noise Ratio (SNR) and extremely complex receivers for reliable detection.

<u>Why was QAM designed to solve PSK?</u>
QAM was designed to achieve higher data rates without the severe limitations of high-order PSK. By varying both **amplitude and phase**, QAM can pack more bits per symbol while maintaining a greater minimum distance between constellation points compared to a PSK scheme with the same number of points. This makes it more power-efficient and less susceptible to errors for a given data rate.

<u>Be able to draw the constellation diagram for both QAM & PSK.</u>
- **Where to find/draw**: Search for "PSK and QAM constellation diagrams" or "I-Q diagram PSK QAM".
- **4-PSK/QPSK Description**: Four points on a circle, each 90 degrees apart. Looks like a diamond or square centered at the origin.
- **16-QAM Description**: A 4x4 grid of 16 points, evenly spaced in a square formation in the I-Q plane.

### **Application & Context**
<u>If given a scenario on which application is used</u>
You must identify the key requirements (e.g., data rate, noise immunity, cost, distance).
- **PCM** would be used for **digital telephony** because it offers high fidelity and noise immunity for voice signals.
- **PWM** would be used for **motor control** because its duty cycle can directly control the power delivered to a motor.
- The **output signal profile**:
    - **PCM**: A series of binary numbers (e.g., 1011, 0101).
    - **PWM**: A square wave where the pulse width varies proportionally to the signal amplitude.
    - **PPM**: A series of pulses where the timing/position of a narrow pulse varies.

### **Identification of the context-specific modulation scheme.**
<u>If the user wants his system to have high data rates I want it to achieve data speed of up to 1gig per second what constellation scheme would you recommend?</u>
For a data rate of up to 1 Gbps, I would recommend **64-QAM or 256-QAM**.
- **Justification**: These high-order QAM schemes pack many bits per symbol (6 bits for 64-QAM, 8 bits for 256-QAM), enabling very high data rates within limited bandwidths. They represent the best trade-off between spectral efficiency and practical implementation complexity for such speeds, as used in Wi-Fi 6 (802.11ax) and 5G networks.
- **Constellation Diagram for 64-QAM**: Search for "64-QAM constellation diagram". You will see an 8x8 grid of 64 points, forming a perfect square in the I-Q plane.

### **Role Of Digital Techniques in information representation & associated value derivation**
<u>Explain the concept of quantisation signal to noise ratio</u>
The Quantization Signal-to-Noise Ratio (SQNR) measures the quality of a quantized signal by comparing the power of the original signal to the power of the quantization error (noise).
- **Formula**: $SQNR_{dB} \approx 1.76 + 6.02N$
- **Variables**: $N$ is the number of bits used for quantization.
- **Interpretation**: Each additional bit improves the SQNR by approximately 6 dB, meaning the unwanted noise becomes relatively quieter, significantly enhancing signal quality.

<u>Discuss the importance of Quantisation. How does the degree of quantisation impact the quality produced?</u>
Quantization is crucial as it bridges the analog and digital worlds by converting continuous amplitudes into discrete digital values.
- **Impact of Degree (Number of Bits, N)**:
    - **Low N (e.g., 8-bit)**: Coarse steps, low SQNR, resulting in "blocky" images or "grainy" audio. Low computational cost.
    - **High N (e.g., 16-bit or 24-bit)**: Fine steps, high SQNR, resulting in sharper pictures and cleaner audio. High computational cost and file size, often necessitating cloud resources for processing.

### **Recognition of Sampling, Companding, Quantisation.**
<u>Explain encoding while indulging in this.</u>
**Encoding** is the final step where each quantized level is mapped to a unique binary code (e.g., 0010, 1101). This completes the Analog-to-Digital Conversion (ADC) process:
`Analog Signal → Sampling → Quantization → ENCODING → Digital Signal`
Encoding is vital for **data storage** (creating computer files), **AI training** (providing the numerical data algorithms learn from), and **data transmission**.

### **Appreciation for the influence of parameters...**
<u>For quantization the key parameter is the number of quantising bits</u>
- **Parameter it influences**:
    1.  **Quantization Resolution**: $\frac{V_{max}}{2^N}$. We want this to be **as low as possible** for finer detail.
    2.  **Quantization SNR**: $\approx 1.76 + 6.02N$. We want this to be **as high as possible** for better quality.
- **Trade-off**: Achieving these goals requires **more bits ($N$)**, which demands **more computational resources**, making the process more expensive. This often justifies the use of cloud computing.

### **Role of Computing technology (Cloud computers and data centers).**
<u>How does cloud computing enhance the quality of the output and final deliverable in digitization applications?</u>
Cloud computing enhances output quality by providing:
1.  **Scalable Computational Power**: It offers on-demand access to massive processing resources, enabling the use of high-bit-depth quantization and complex encoding algorithms that are too intensive for local devices.
2.  **Advanced Processing Services**: Cloud platforms provide AI/ML services (e.g., for image upscaling, noise reduction) that can further refine the digitized content beyond basic quantization.
3.  **High-Quality Global Delivery**: The final, high-quality digital asset can be stored, streamed, and delivered instantly worldwide via robust data center networks, ensuring the end-user receives the best possible version.