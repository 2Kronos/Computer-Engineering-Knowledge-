
# Digital Technology and Applications - Compact Exam Checklist

## 1. Baseband vs. Broadband Modulation

### Core Concepts

- [ ] Define baseband (low data rates, direct transmission)
- [ ] Define broadband (high data rates, uses carriers)
- [ ] Noise immunity ranking: **PAM < PWM < PPM < PCM**

### Baseband Techniques - Know Applications & Draw Waveforms

- [ ] **PAM** - Poorest noise immunity
- [ ] **PWM** - Motor control application
- [ ] **PPM** - Better noise immunity than PWM
- [ ] **PCM** - Telephone systems, best noise immunity

### PSK (Phase Shift Keying)

- [ ] Draw constellations: 4-PSK, 8-PSK, 16-PSK
- [ ] Explain: Can't go beyond 16-PSK (symbols too close, high ISI, receiver complexity)
- [ ] Know: Higher order PSK → More ISI

### QAM (Quadrature Amplitude Modulation)

- [ ] Draw constellations: 4-QAM, 16-QAM, 32-QAM, 64-QAM
- [ ] Explain: Designed to solve PSK problem (greater symbol spacing, less ISI)
- [ ] Given "1 Gbps requirement" → Recommend 64-QAM with justification

### Application Selection

- [ ] Match modulation to scenario (data rate, noise, application type)
- [ ] Draw output waveform for selected technique
- [ ] Connect input signal to output signal

---

## 2. Digital Techniques in Information Representation

### Sampling

- [ ] Formula: $f_s \geq 2 \times f_{max}$
- [ ] Apply to audio, images, multimedia

### Quantization

- [ ] **Process**: Analog → Sample → Quantize → Encode → Digital
- [ ] **Key parameter**: Number of bits (N)

#### Three Critical Formulas

- [ ] **Quantization Resolution**: $Q_{res} = \frac{V_{max}}{2^N}$ (want LOW)
- [ ] **SQNR**: $SQNR \approx 1.76 + 6.02 \times N$ dB (want HIGH)
- [ ] More bits → Better quality BUT more computationally expensive

### Companding

- [ ] Define: Compression + Expansion
- [ ] Purpose: Limits dynamic range for better quantization

### Encoding

- [ ] Maps quantized values to binary
- [ ] Essential for storage, AI training, transmission

### Quality Impact

- [ ] More bits → Sharper images, better audio, higher quality
- [ ] More bits → Higher computational cost → Need cloud

---

## 3. Role of Cloud Computing

### Why Cloud Needed

- [ ] High-quality quantization is computationally expensive
- [ ] Local devices have limited resources
- [ ] "When computationally intensive, go to cloud"

### How Cloud Enhances Quality

- [ ] Enables higher quantization levels (more bits)
- [ ] Advanced encoding algorithms
- [ ] AI-based enhancement (upscaling, noise reduction)
- [ ] Real-time processing

### Integration

- [ ] Local: Basic sampling/quantization
- [ ] Cloud: Advanced processing/enhancement
- [ ] Result: Higher quality final deliverable

---

## 4. Quick Exam Response Framework

### "Differentiate baseband/broadband"

1. Define both
2. Compare data rates
3. Noise immunity ranking
4. Give applications
5. Draw waveforms

### "Select modulation for scenario"

1. Analyze requirements (data rate, noise, distance)
2. Select technique
3. Justify choice
4. Draw output waveform/constellation

### "Role of digital techniques"

1. Explain sampling (with formula)
2. Explain quantization (with 3 formulas)
3. Show complete process
4. Connect parameters to quality

### "Cloud computing role"

1. Explain computational intensity
2. Describe cloud capabilities
3. Show quality enhancement
4. Give practical example

---

## 5. Must-Know Drawings

- [ ] All baseband waveforms (PAM, PWM, PPM, PCM)
- [ ] PSK constellations (4, 8, 16)
- [ ] QAM constellations (4, 16, 64)
- [ ] Input-to-output transformations

---

## 6. Essential Formulas

- [ ] $f_s \geq 2 \times f_{max}$
- [ ] $Q_{res} = \frac{V_{max}}{2^N}$
- [ ] $SQNR \approx 1.76 + 6.02 \times N$ dB

---

## Pre-Exam Final Check

- [ ] Can justify modulation selection for any scenario
- [ ] Can draw all waveforms and constellations
- [ ] Can calculate with all formulas
- [ ] Can explain quality vs. cost trade-offs
- [ ] Understand cloud's role in enhancing digitization

