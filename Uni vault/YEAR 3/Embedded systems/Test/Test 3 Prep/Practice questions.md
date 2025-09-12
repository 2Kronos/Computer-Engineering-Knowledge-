
# **1. IR-Based Menu System on LCD**

- **Task:** Create an interactive menu on the LCD. Use the VOL+ and VOL- buttons to navigate through a list of options (e.g., "1.LED", "2.Count", "3.Reset") displayed on the first line. The RIGHT button should "select" the highlighted option. Based on the selection:
    
    - **LED:** Toggles an LED on/off.
        
    - **Count:** Prints the current value of your software counter on the second line.
        
    - **Reset:** Resets the software counter to zero.


# **2. Two-Digit Hardware Counter with Reset**

- **Task:** Cascade two 74HC93 chips to create an 8-bit counter (0-255). Use the first chip's Q3 (MSB) output as the clock input for the second chip. Display the lower digit (0-9) on a 7-segment display via a CD4511. Use an IR remote button to reset both counters to zero simultaneously.

# **3. Analog Input to Binary Output**

- **Task:** Read a value from a potentiometer connected to an Arduino analog pin. Map this value to a range of 0-15. Display this value in binary on 4 LEDs. Additionally, print both the analog value and the binary value (e.g., "A:512 B:1000") on the LCD.

# **4. Persistence of Vision (POV) with 7-Segment**

- **Task:** Connect two 7-segment displays to a single CD4511 decoder. Use two Arduino pins to control the common cathodes (for multiplexing). Write a program to display a different number on each display (e.g., '1' on the first, '5' on the second). The challenge is to make it appear that both numbers are displayed simultaneously without flicker, using a `delayMicroseconds()` command in your multiplexing loop

# **5. "Guess the Number" IR Game**

- **Task:** The Arduino randomly selects a number between 0 and 9. Using the IR remote, the user must guess the number. The LCD provides feedback: "Too High!", "Too Low!", or "Correct!". Use the number buttons on the remote for input.
# **6 LCD Progress Bar**

- **Task:** Instead of just numbers, create a visual progress bar on the second line of the LCD that fills up as a software counter increments. For example, as a counter goes from 0 to 16, the LCD should show "[=====> ]". The IR VOL+ and VOL- buttons should control the counter and thus the progress bar

# **7. State Machine: Combination Lock**

- **Task:** Create a 3-digit combination lock using the IR remote and LCD. The correct code is, for example, 4-2-7. The user enters digits using the remote number keys. The LCD shows "Enter Code:" and then the digits as they are entered (e.g., "4", "42", "427"). If the full code is correct, light a green LED. If any digit is wrong, reset the entry and light a red LED.
