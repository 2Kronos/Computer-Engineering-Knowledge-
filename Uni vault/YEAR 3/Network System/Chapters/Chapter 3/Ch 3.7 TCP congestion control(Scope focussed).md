### **TCP Congestion Control in a Nutshell**  

1. **Goal:** Prevent network overload by adjusting sending rates dynamically.  

2. **AIMD (Core Algorithm):**  
   - **Additive Increase:** Slowly ramp up speed (+1 chunk/RTT).  
   - **Multiplicative Decrease:** On packet loss, cut speed in half.  
   - *Result:* Sawtooth pattern (up slowly, drop sharply).  

3. **Slow Start (Initial Phase):**  
   - Start at 1 chunk, double speed every RTT until first loss.  
   - Then switch to AIMD.  

4. **Loss Detection:**  
   - **3 Duplicate ACKs:** Mild congestion → halve speed.  
   - **Timeout:** Severe congestion → reset to 1 chunk.  

5. **Advanced Versions:**  
   - **CUBIC:** Faster recovery after loss (used in Linux).  
   - **BBR (Google):** Uses delay (not loss) to avoid congestion.  

6. **Fairness:**  
   - Competing TCP flows share bandwidth equally.  
   - *But* UDP apps (e.g., video) ignore congestion control.  

**TL;DR:** TCP balances speed and fairness by probing for bandwidth and backing off when congestion hits. 🚦