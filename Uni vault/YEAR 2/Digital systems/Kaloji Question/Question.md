


### Example and Theory Reference

#### **Electronics Tutorials – “MOD Counters are Truncated Modulus Counters”**

This article walks through how synchronous counters can be built using JK (or D-type) flip-flops, and how **modulus-N** counters (i.e., counters that reset before reaching the full 2ⁿ range) are created using external logic.

Key points from the tutorial include:

- **Synchronous operation**: All flip-flops receive the **same clock**, eliminating ripple-delay (all outputs change together). ([Basic Electronics Tutorials](https://www.electronics-tutorials.ws/counter/mod-counters.html?utm_source=chatgpt.com "MOD Counters are Truncated Modulus Counters - Electronics Tutorials"))
    
- **Modulo counters (MOD-N)**: These counters count up to a predefined number NN and then reset to zero. Such counters are often referred to as "**truncated sequences**" because they don't run through the full 2ⁿ states. ([Basic Electronics Tutorials](https://www.electronics-tutorials.ws/counter/mod-counters.html?utm_source=chatgpt.com "MOD Counters are Truncated Modulus Counters - Electronics Tutorials"))
    
- **Using external logic (like AND gates)**: The logic detects when the counter reaches the “terminal count” (e.g., `1001` for a MOD-10 or your `11010` for MOD-26) and uses that to trigger a reset of all flip-flops. ([Basic Electronics Tutorials](https://www.electronics-tutorials.ws/counter/mod-counters.html?utm_source=chatgpt.com "MOD Counters are Truncated Modulus Counters - Electronics Tutorials"))
    

That's **exactly** the theory behind your circuit: it's a synchronous, mod-26 counter implemented with JK flip-flops all clocked in parallel, with an AND gate that senses the `11010` condition and resets the counter back to zero.

---

### How to Explain It to Someone Else

Here's a structured walkthrough you can use when explaining the concept:

1. **Synchronous Counter Basics**
    
    - In a synchronous counter, **all flip-flops share the same clock**, so their outputs change simultaneously—no ripple delay. ([All About Circuits](https://www.allaboutcircuits.com/textbook/digital/chpt-11/synchronous-counters/?utm_source=chatgpt.com "Synchronous Counters | Sequential Circuits | Electronics Textbook"), [ecstudiosystems.com](https://ecstudiosystems.com/discover/textbooks/basic-electronics/counters/synchronous-counter/?utm_source=chatgpt.com "Synchronous Counter - Counters - Basics Electronics"))
        
2. **Using JK Flip-Flops in Toggle Mode**
    
    - JK flip-flops toggle when both J and K are set to HIGH (logic 1). This is the basic building block of binary counters because each stage can divide the clock frequency by 2. ([Scribd](https://www.scribd.com/document/391232015/CHAPTER-4-COUNTERS-pdf?utm_source=chatgpt.com "Chapter 4 Counters PDF - Scribd"))
        
3. **Dividing the Frequency (Binary Counter)**
    
    - Each flip-flop stage divides the input clock by 2:  
        Q₀ toggles every clock, Q₁ toggles every second clock (½ frequency), Q₂ every fourth clock, and so on. Stacking them yields a binary count.
        
4. **Introducing Modulus Logic (MOD-N)**
    
    - If you allow the counter to simply run through all 2ⁿ states, you’d get a modulus-16 counter for n=4, for example. But if you want to stop earlier, say at 26, you need **additional logic**:
        
        - Detect the unwanted terminal count (e.g., when the outputs equal the binary for 26).
            
        - Use that to **reset** the flip-flops back to `00000`, starting the cycle anew.
            
    - That’s how a MOD-26 counter works: it counts `00000` to `11001` (0 to 25), then when it reaches `11010` (26), logic resets the count. ([Basic Electronics Tutorials](https://www.electronics-tutorials.ws/counter/mod-counters.html?utm_source=chatgpt.com "MOD Counters are Truncated Modulus Counters - Electronics Tutorials"))
        
5. **Frequency Division Interpretation**
    
    - The output Q₄ is effectively the **clock divided by 26**, meaning
        
        fQ4=fclk26 f_{Q₄} = \frac{f_{\text{clk}}}{26}
    - In your specific case, with a 10 MHz input clock, that yields approximately **385 kHz**.
        

---

### Summary Table

|Concept|Explanation|
|---|---|
|Synchronous Clocking|All flip-flops triggered by the same clock—no ripple delay ([All About Circuits](https://www.allaboutcircuits.com/textbook/digital/chpt-11/synchronous-counters/?utm_source=chatgpt.com "Synchronous Counters \| Sequential Circuits \| Electronics Textbook"), [ecstudiosystems.com](https://ecstudiosystems.com/discover/textbooks/basic-electronics/counters/synchronous-counter/?utm_source=chatgpt.com "Synchronous Counter - Counters - Basics Electronics"))|
|JK Toggle Behavior|J=K=1 makes flip-flop toggle, ideal for binary counting ([Scribd](https://www.scribd.com/document/391232015/CHAPTER-4-COUNTERS-pdf?utm_source=chatgpt.com "Chapter 4 Counters PDF - Scribd"))|
|Mod-N Counter Operation|Counter resets when output matches terminal count, using logic gates ([Basic Electronics Tutorials](https://www.electronics-tutorials.ws/counter/mod-counters.html?utm_source=chatgpt.com "MOD Counters are Truncated Modulus Counters - Electronics Tutorials"))|
|Frequency Division Result|Output frequency = input clock ÷ modulus; here, 10 MHz ÷ 26 ≈ 385 kHz|

---

### Additional Resource (Optional Video)

For a visual explanation, here’s a YouTube video demonstrating a **synchronous mod-8 counter** using JK flip-flops. Though it's mod-8 instead of mod-26, the principle is exactly the same:

[Synchronous mod‑8 up‑counter using JK flip‑flops](https://www.youtube.com/watch?pp=0gcJCfwAo7VqN5tD&v=KckI-yUpvrA&utm_source=chatgpt.com)

---

Feel free to use this breakdown to explain the theory more clearly to someone else—starting from how JK flip-flops toggle, moving into synchronous counting, then introducing the idea of truncated counting via modulus logic, and finally tying it back to frequency division!

Let me know if you'd like help designing a mod-N counter for a different value or creating timing diagrams!
