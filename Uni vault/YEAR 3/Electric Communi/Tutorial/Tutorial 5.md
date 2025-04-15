# Chrinovic Raya Tshiwaya
# 222170972
### **Q1. Difference Between Low-Level and High-Level Modulation in FM**

**Low-level modulation** happens early in the transmitter, where the modulating signal is mixed with the carrier while it’s still at a low power level. After modulation, the combined signal gets amplified before transmission. This method is great when you need precise control over the signal or when you’re working with lower-power transmitters.

**High-level modulation**, on the other hand, works differently the carrier signal is first amplified to full power, and _then_ the modulation is applied. This is more efficient for high-power transmitters (like broadcast stations) because it reduces power losses in the amplification stage. However, since the modulation happens at such high power levels, there’s usually more distortion compared to low-level modulation.

---

### **Q2. Why Frequency Multipliers in FM Transmitters but Not AM Transmitters?**

FM transmitters use **frequency multipliers** to boost the carrier frequency up to the desired transmission level after modulation. Since FM encodes information through frequency shifts, these multipliers help ensure the final frequency is correct without messing up the signal’s deviation.

AM transmitters, however, don’t need frequency multipliers because AM works by varying the **amplitude** of the signal, not its frequency. The carrier frequency stays the same throughout the process, so there’s no need to multiply or shift it just amplify and transmit.

---

### **Q3. What Is Indirect FM and Why Design It?**

Indirect FM is a clever workaround instead of directly modulating the frequency of a carrier, it first uses **phase modulation (PM)** with an audio signal to _indirectly_ create an FM signal. The key advantage? **Better frequency stability.**

Since the carrier comes from a highly stable oscillator (like a crystal oscillator), it avoids the drift issues that can happen with direct FM. This makes indirect FM a solid choice for systems where you need tight control over the frequency, especially in high-frequency applications where stability is critical.