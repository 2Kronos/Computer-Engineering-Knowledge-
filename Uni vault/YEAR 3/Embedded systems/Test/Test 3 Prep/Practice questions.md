
# **1. IR-Based Menu System on LCD**

- **Task:** Create an interactive menu on the LCD. Use the VOL+ and VOL- buttons to navigate through a list of options (e.g., "1.LED", "2.Count", "3.Reset") displayed on the first line. The RIGHT button should "select" the highlighted option. Based on the selection:
    
    - **LED:** Toggles an LED on/off.
        
    - **Count:** Prints the current value of your software counter on the second line.
        
    - **Reset:** Resets the software counter to zero.

[Practice 1](https://www.tinkercad.com/things/l51xKIuSLyy-practice-1)

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


# High level question



You are tasked with designing a system where a user can control a traffic light sequence using an IR remote. The system should display the current light state using red, yellow, and green LEDs, while a binary counter keeps track of the number of completed cycles. The counter value should be displayed on four binary LEDs representing each bit, on a 7-segment LED display showing the decimal equivalent via a 7-segment decoder, and on a 16x2 LCD display to provide a clear numerical and textual readout of the current cycle and light status.

Things to Consider:
The system must count the number of traffic light cycles from 0 to 15 using a 4-bit binary counter.
One additional LED should turn on when the cycle count reaches the maximum value.
The IR remote should have at least three buttons: one to start or advance the traffic light cycle, another to reset the counter to zero, and a third to pause the cycle.
The system must update the 7-segment display, binary LEDs, and 16x2 LCD in real-time with each cycle.
The counting logic should be implemented using binary counters, and a 7-segment decoder should be used to drive the 7-segment display.
The 16x2 LCD should display both the current traffic light color (e.g., “Red”, “Yellow”, “Green”) and the current cycle count.


# Version 1 

```C++
// C++ code
//
#include <IRremote.hpp>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C serial_LDR(0x27, 16, 2);

const int IR_PIN = 3;
unsigned long remoteIn;
int count = 0;
int clockPin = 12;
int resetPins = 13;
int greenLED = 4;
int yellowLED = 5;
int redLED = 6;

// Variables for LED control
bool isPaused = false;
int currentLED = 4; // Start with green LED
bool ledState = false;

void setup()
{
  IrReceiver.begin(IR_PIN, ENABLE_LED_FEEDBACK); //Start the reciever

  pinMode(A2, INPUT);//LCD setup
  pinMode(A3, INPUT);
  serial_LDR.init();
  serial_LDR.backlight();
  serial_LDR.setCursor(0,0);// this is where to set the cursors
  serial_LDR.print(" melz");
  
  pinMode(clockPin, OUTPUT);//Reset 1 and 2
  pinMode(resetPins, OUTPUT);
  pinMode(greenLED , OUTPUT);
  pinMode(yellowLED, OUTPUT);
  pinMode(redLED, OUTPUT);
  
  digitalWrite(clockPin, LOW);
  Serial.begin(9600);
}

void loop()
{
  digitalWrite(clockPin, HIGH);
  delay(500);
  digitalWrite(clockPin, LOW);
  count++;
  
  if(count > 9){
    digitalWrite(resetPins, HIGH);
    delay(500);
    digitalWrite(resetPins,LOW);// rESTART THE COUNTER.
    count = 0; //START COUNTING FROM SCRATCH
  }
  
  if (IrReceiver.decode()) {
    remoteIn = IrReceiver.decodedIRData.decodedRawData;
    switch(remoteIn){
      case 4010852096 : // Traffic light on use BUTTON 1
        Serial.println("Traffic light on ");
        isPaused = false; // Resume cycling
        break;
       
      case 3994140416: // Reset BUTTON 2
        Serial.println("Reset");
        resetLights();
        break;
        
      case 3977428736 : // Pause BUTTON 3
        Serial.println("Pause");
        isPaused = true; // Pause cycling
        break;
          
      default:
        Serial.println(" = not valid");
        break;
    }	
    IrReceiver.resume(); // Receive the next value
  }
  
  // Handle LED cycling (only if not paused)
  if (!isPaused) {
    cycleLights();
  }
}

void resetLights() {
  // Turn off all LEDs
  digitalWrite(greenLED, LOW);
  digitalWrite(yellowLED, LOW);
  digitalWrite(redLED, LOW);
  currentLED = greenLED; // Reset to first LED
  ledState = false;
  isPaused = false;
}

void cycleLights() {
  // Turn off current LED
  digitalWrite(currentLED, LOW);
  
  // Move to next LED
  currentLED++;
  if (currentLED > redLED) {
    currentLED = greenLED; // Wrap around to first LED
  }
  
  // Turn on next LED
  digitalWrite(currentLED, HIGH);
  
  delay(500); // Delay between LED changes
}
```


# Version 2

```
// C++ code
//
#include <IRremote.hpp>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C serial_LDR(0x27, 16, 2);

const int IR_PIN = 3;
unsigned long remoteIn;
int count = 0;
int clockPin = 12;
int resetPins = 13;
int greenLED = 4;
int yellowLED = 5;
int redLED = 6;

// Variables for LED control
bool isPaused = false;
int currentLED = 4; // Start with green LED
bool ledState = false;

void setup()
{
  IrReceiver.begin(IR_PIN, ENABLE_LED_FEEDBACK); //Start the reciever

  pinMode(A2, INPUT);//LCD setup
  pinMode(A3, INPUT);
  serial_LDR.init();
  serial_LDR.backlight();
  serial_LDR.setCursor(0,0);// this is where to set the cursors
  serial_LDR.print(" melz");
  
  pinMode(clockPin, OUTPUT);//Reset 1 and 2
  pinMode(resetPins, OUTPUT);
  pinMode(greenLED , OUTPUT);
  pinMode(yellowLED, OUTPUT);
  pinMode(redLED, OUTPUT);
  
  digitalWrite(clockPin, LOW);
  Serial.begin(9600);
}

void loop()
{
  digitalWrite(clockPin, HIGH);
  delay(500);
  digitalWrite(clockPin, LOW);
  count++;
  
  if(count > 9){
    digitalWrite(resetPins, HIGH);
    delay(500);
    digitalWrite(resetPins,LOW);// rESTART THE COUNTER.
    count = 0; //START COUNTING FROM SCRATCH
  }
  
  if (IrReceiver.decode()) {
    remoteIn = IrReceiver.decodedIRData.decodedRawData;
    switch(remoteIn){
      case 4010852096 : // Traffic light on
        Serial.println("Traffic light on ");
        isPaused = false; // Resume cycling
        break;
       
      case 3994140416: // Reset
        Serial.println("Reset");
        resetLights();
        break;
        
      case 3977428736 : // Pause
        Serial.println("Pause");
        isPaused = true; // Pause cycling
        break;
          
      default:
        Serial.println(" = not valid");
        break;
    }	
    IrReceiver.resume(); // Receive the next value
  }
  
  // Handle LED cycling (only if not paused)
  if (!isPaused) {
    cycleLights();
  }
}

void resetLights() {
  // Turn off all LEDs
  digitalWrite(greenLED, LOW);
  digitalWrite(yellowLED, LOW);
  digitalWrite(redLED, LOW);
  currentLED = greenLED; // Reset to first LED
  ledState = false;
  isPaused = false;
}

void cycleLights() {
  // Turn off current LED
  digitalWrite(currentLED, LOW);
  
  // Move to next LED
  currentLED++;
  if (currentLED > redLED) {
    currentLED = greenLED; // Wrap around to first LED
  }
  
  // Turn on next LED
  digitalWrite(currentLED, HIGH);
  
  delay(500); // Delay between LED changes
}
```
