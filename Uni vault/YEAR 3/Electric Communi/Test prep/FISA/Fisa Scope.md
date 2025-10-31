
| **S/N** | **Topic**                                                | **Aspect**                                                                                                                                                                                                                                                                                                                           | **Slides** |
| ------- | -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------- |
| **1**   | **Digital Technology and Applications**                  | **Baseband vs. Broadband Modulation:** Differentiate between baseband and broadband modulation techniques (considering factors like noise immunity). Discuss and demonstrate applications, identify context-specific modulation, and describe the output waveform/signal with a diagram.                                             | 55 – 125   |
|         |                                                          | **Digital Techniques in Information Representation:** Role of digital techniques in information representation and value derivation (e.g., pictures, audio, multimedia). Recognition of **sampling, companding, and quantization** (and their parameters) as fundamental techniques and their influence on application quality.      | 55 – 125   |
|         |                                                          | **Role of Computing Technology:** Role of computing technology like the **cloud** in enhancing the quality of output and final deliverable in digitization applications.                                                                                                                                                             | 266 – 286  |
| **2**   | **Electronic Components**                                | **Frequency Selective Components:** Recognition of the role, types, influencing parameters, and design/role of **frequency selective components** in electronic communication systems and different standards. Evaluation and description of performance using applicable parameters.                                                | 1 – 20     |
| **3**   | **Wave Effects and Applications in Enterprise Networks** | **Wave Propagation and Network Performance:** Role and importance of **wave propagation** (focus on effects) and its influence on network performance and planning. Description of how an environment influences propagated radiowaves and its crucial role in ensuring desired performance for a multi-location enterprise network. | 181 – 200  |
| **4**   | **Antennas**                                             | **Antenna Fundamentals:** Definition, understanding, and **role of antennas** in electronic communication networks.                                                                                                                                                                                                                  | 201 – 219  |

# Calculation Areas:
"Areas of calculation have simple formulas"
1. Calculation of gain 
2. Upper side frequency 
3. Lower side frequency 
4. Quantization resolution 
5. Quantization signal to noise resolution 
6. Antenna gain
7. Resonant frequency 
8. Q factor
9. Bandwidth
10. Image Frequency rejection

## Also
- draw antenna array
- test 1 GA6



# 1. Recording Notes

# 1.1. Digital Technology and Applications [Page 56]

1. **Sampling Frequency**: How to determine the sampling Frequency, Which follows the nyquist rule that states that for a signal $f(x)$, with a frequency $f$, The minimum frequency required to sample this signal reliably is $f_s \geq 2 \times f$ (f = 15  must still verify)

2. **Baseband Modulation**
   - Explain what is Baseband

- Baseband transmission can only achieve low data rate s 
-  Baseband  is PWM, PPM, PCM

   - Modulation - Pulse Width Modulation (PWM), Pulse Amplitude Modulation(PAM), Pulse Code Modulation(PCM), Pulse Position Modulation(PPM)
   - Note:
     - Pulse Amplitude Modulation has poor Noise Immunity (Will discuss this deeper later),
     - The order, from least to highest noise immunity is Pulse Amplitude Modulation → Pulse Width Modulation → Pulse Position → Pulse Code Modulation
     - Know that they are different methods 

1. **Broadband Modulation** (BBM)
   - Explain what is Broadband Modulation in data techniques
   - 4PSK 8 PSK, 16 PSK Limit being  for  PSK 16, Phase Shift Keying
   - Quadrature Amplitude Modulation - 4 QAM, 8QAM, 16 QAM & 32 QAM
   - Explain the difference in these data modulation techniques.
   - If you want to achieve broadband speed we have to you BBM Techniques 
     
<u> What is the distinguishing factor between broadband modulation techniques as constilation <u>

	   - Inter-symbol interference, ISI - Leading to beats being corrupted
	   - For PSK there is higher ISI in 8psk than 4 psk 

<u>Why can't we move above 16 PSK<u>,
 - It is due the fact that symbols are now so close to each other the distance is so small that for you to dectect each of them the reciever complexity increases that why QAM
   was introduced 
   
<u>why was QAM designed to solve PSK.<u>
	- In QAM the distance between symbols is greater makes QAM less susceptible to ISI 

	- Be able to draw the constellation diagram for both QAM & PSK.
## In addition, discuss and demonstrate understanding of applications of either technologies in a given scenario and context



4. **Application**
   - Be able to tell which modulation technique should be used in what application and justify as to why.
   - Be able to provide the output signal for any given signal in determining an application of the modulation technique.
   - Be able to connect the input and output of the signal.
   - In Cases of Broadband:
     - Given the specifications, like data rate requirement, what modulation scheme to use, draw the constellation diagram of that modulation scheme.

5. **Role Of Digital Techniques in information representation**
   - Quantisation
     - The process of taking an analog signal(either from a microphone or any sensor), Sample it to get a digital signal, quantise that digital signal and produce different signal presentation of the signal, then map it to the binary representation.
     - Discuss the importance of Quantisation. How does the degree of quantisation impact the quality produced.
     - Explain the concept of quantisation signal to noise ratio. Which is: $\approx 1.76 + 6.02 \times N$ Whereby $N \rightarrow$ number of bits used to quantise the signal as defined here
     - Quantisation resolution = $\left(\frac{V_{max}}{2^n}\right)$
     - Quantisation as computationally expensive, but producing higher quality.
   - Recognition of Sampling, Compandingin, Quantisation.
     - Companding - A process which ensures that, a signal being transmitted has a limited dynamic range for quantisation.
     - Sampling and Quantisation have been discussed above. Explain encoding while indulging in this.

6. **Role of Computing technology (Cloud computers and data centers).**
   - How does cloud computing enhance the quality of the output and final deliverable in digitization applications.

## 1.2. Electronic Components

- Explain and discuss the role of the Low Pass, High Pass, BandPass and Tuning circuits. Also, explain the influancing parameters for them, for an example, Low Pass and High Pass filters are influenced by their cut-off frequency.
  - For a Low Pass Filter, Any frequency above its Cut-off frequency will be attenuated.
  - For High Pass Filter, Lower Frequencies will be attenuated.
  - For Bandpass Filter, which has 2 cut off frequencies, Higher and lower cutoff frequencies. The frequencies above the higher cut-off frequency will be attenuated, same as the frequencies below the lower cut-off frequency.
  - Know how to get resonant frequency, Quality Factor, Bandwidth for Low, High, Band Pass Filter:
    - $F_r = \frac{1}{2\pi\sqrt{LC}}$
    - $Q = \frac{F_r}{B} \rightarrow$ whereby, $B \rightarrow$ Bandwidth
  - How to use Filters in networks of different standards, Example being a 2.5 GHz Wifi etc,
  - Be able to explain how does a Q - Factor Correlate to the bandwidth

## 1.3. Wave Effects and Applications in Enterprise Network

- How the building profile impacts the wave propagation, such as:
  - Reflection
  - Difraction
  - Refraction
- Because of the above-mentioned factors, why is it important to perform a network planning for each network environment.
- How does the environment influence the radio waves propagation.
  - How does the steel absorb the waves in relation to the Brick walls,
  - How does certain material, not allow radio waves to penetrate through, but deflects them within the environment, lowering the signal strength.

## 1.4. Antennas

(Everything Covered.)

# 2. My Notes

## 2.1. Digital Technology and Applications

1. **Sampling Frequency**

   Sampling Frequency is the number of samples taken per second from a continious or analogue signal to convert it into a digital signal. The Higher sampling rate results in a more accurate digital signal representation of the original analog signal. The idea of Sampling Frequency is Governed by the Nyquist Theorem which state that, to avoid aliasing, the sampling frequency must be at least twice more than the highest frequency present in the original signal(This is if the signal has multiple frequencies, if the signal only has one frequencu, just like a $\sin(2x)$, then we consider just its original frequency).
   
   In a compact form, the nyquist theorem states: $f_s \geq 2 \times f_{max}$

2. **Baseband Modulation**

   Baseband Modulation is the process of encoding data directly onto a transmission medium without shifting it into a higher frequency range. The word Baseband, simply means that, the signal remains within the same frequency range as it is in its original form. The example of this modulation technique is Ethernet wire. The ethernet wires are know to transmit data within

---

## Scope

| s/n | Topic                                                | Asset/Focus                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| --- | ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1.  | Digital Technology and Applications                  | 1. Differentiate between baseband and broadband modulation related techniques considering output factors such as noise immunity amongst others. In addition, discuss and demonstrate understanding of applications of either technologies in a given scenario and context. Identification of the context-specific modulation scheme. Description via a diagram of the output waveform and resulting signal of baseband and broadband applications – with focus on the modulation.<br><br>2. Role of digital techniques in information representation and associated value derivation. Examples of information to be represented are pictures, audio and multimedia content representation, storage and access alongside value addition. Recognition of the roles of sampling, companding and quantization (alongside all their parameters) as the fundamental techniques and their role in value driven digital systems. Appreciation for the influence of parameters in realizing common applications with varying quality levels.<br><br>3. Role of computing technology such as the cloud in enhancing the quality of the output and final deliverable in digitization application |
| 2.  | Electronic Components                                | Recognition of the role of frequency selective components, their types, influencing parameters and their role in electronic communication systems. Ability to design and recognize the role of frequency selective components in networks of different standards. Evaluation and description of performance using the applicable performance influencing parameters                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 3.  | Wave Effects and Applications in Enterprise Networks | Role, and importance of wave propagation in network performance and planning. Description of how an environemnt influences relations with propagated radiowaves. Recognition and ability to demonstrate how this is crucial for electronic communiation networks to ensure desired performance for a real-world enterprise at multiple locations.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| 4.  | Antennas                                             | Definition, understanding and role in electronic communication networks.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
