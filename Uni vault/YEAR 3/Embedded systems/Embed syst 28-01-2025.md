# Parts of an Arduino 

![[Pasted image 20250128084633.png]]

·        Digital pins use these pins with digitalRead(), digitalwrite() and analogWrite(). AnologWrite works only pins with the PWM symbol.

·        PWM stands for Pulse Width Modulation. Use to generate analog signals using digiotial means. Used in LEDS, Motors, etc. Swithes a digital signal on and off at a fixed frequency.

·        Only a few pins can generate PWM signal they are numbers 3,5,6,9,10,11

·        You can use analogWritre() function to produce PWM signals on these pin and control the connected device output or behaviour by adjusting the duty cycle.

·        The L-LED. Built into the board and connected to pin 13. When pin 13 is high LED is on when pin 13 is low LED is off