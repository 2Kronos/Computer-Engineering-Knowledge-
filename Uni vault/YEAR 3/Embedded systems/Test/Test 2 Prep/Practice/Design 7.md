# ✅ Question 1: Alternating LEDs (Even ↔ Odd) (Difficulty 🟢)

Task:

Using your existing circuit and shift register, manually send data so that:

All even-positioned LEDs (Q0, Q2, Q4, Q6) are ON, then OFF.

All odd-positioned LEDs (Q1, Q3, Q5, Q7) are ON, then OFF.

This alternates every 1 second.

**Hint:**

·       Use two arrays: one with the pattern 10101010 and one with 01010101.

·       Loop through each array from MSB to LSB (Q7 to Q0).

·       Use digitalWrite(13, value) to set the data bit.

·       Pulse digitalWrite(11, HIGH then LOW) to clock it in.

·       Pulse digitalWrite(12, HIGH then LOW) to latch and display.
# Circuit link

https://www.tinkercad.com/things/kEZjeX2bfVO-design-7-practice-q1-
# My Answer

```

bool evenArray[] = {0, 1, 0, 1, 0, 1, 0, 1};
bool oddArray[] =  {1, 0, 1, 0, 1, 0, 1, 0};
void setup()
{
  pinMode(11,OUTPUT);//Register clock 
  pinMode(12,OUTPUT);//Output register clock
  pinMode(13,OUTPUT);//Input
  
}

void loop()
{
 
 alternateOdd();
  delay(100);
 alternateEven();
  
} 

void alternateOdd(){
  for(int i = (sizeof(oddArray)-1); i > -1; i--){
   
   digitalWrite(13, oddArray[i]);
 	
   digitalWrite(11, HIGH);
   delay(10);
   digitalWrite(11, LOW);
   delay(10);
 }
   
 	
   digitalWrite(12, HIGH);
   delay(10);
   digitalWrite(12, LOW);
   delay(10);
}
  
  void alternateEven(){
 for(int i = (sizeof(evenArray)-1); i > -1; i--){
   
   digitalWrite(13, evenArray[i]);
 	
   digitalWrite(11, HIGH);
   delay(10);
   digitalWrite(11, LOW);
   delay(10);
 }
   
 	
   digitalWrite(12, HIGH);
   delay(10);
   digitalWrite(12, LOW);
   delay(10);
}
```


# Problems

- Understanding the `for` loop condition mainly the `>-1` thing
- Spelling and speed 

# Solutions

- The `-1` is used to get the **highest valid index** for the row:

```cpp
sizeof(shiftInfo[0]) - 1 = 8 - 1 = 7
```

- So the loop starts from index `7` (last LED) and decrements down to `0` (first LED), effectively shifting the data **right-to-left**.
- `>-1`  is equivalent to `>= 0 `
- I also used function rather than code it in the loop so I can get used to functions

---




# **✅ Question 2: Knight Rider Effect**

**Task:**

Make a single LED move from **left to right** (Q0 to Q7) and then back from **right to left** (Q6 to Q1) repeatedly, like the Knight Rider car light.

**Hint:**

Create a blank 8-element array filled with 0s.

Set just one bit to 1 at a time depending on position.

Loop from i = 0 to 7 and then back i = 6 to 0.

For each frame:

Load the bits manually like before.

Pulse the clock and latch like in your LED loading examples.

# Circuit link

https://www.tinkercad.com/things/4CEpDRTSsvX-design-7-practice-q2
# My Answer 1 (Wrong)

```C++
bool bitArray[] = {1, 0, 0, 0, 0, 0, 0, 0};

void setup()
{
pinMode(11, OUTPUT);//Register clock
pinMode(12, OUTPUT);//Output register clock
pinMode(13, OUTPUT);//Input
  Serial.begin(9600);
  
}

void loop()
{
 
 shiftRight();
 shiftLeft();
} 

void shiftRight(){
  
  for(int i = 0; i<sizeof(bitArray)/sizeof(bitArray[0]); i++){
    
    digitalWrite(13, bitArray[i]);
    
    digitalWrite(11, HIGH);
    delay(100);
    digitalWrite(11, LOW);
    delay(100);
    
     digitalWrite(12, HIGH);
    delay(100);
    digitalWrite(12, LOW);
    delay(100);
    
    Serial.print("Right Interation number = ");
    Serial.println(i);
    
  }//for brace
      
}//function brace

void shiftLeft(){
  
  for(int i = sizeof(bitArray)/(sizeof(bitArray[0]))-2; i>-1 ; i--){
   
    digitalWrite(13, bitArray[i]);
    
    digitalWrite(11, HIGH);
    delay(100);
    digitalWrite(11, LOW);
    delay(100);
    
     digitalWrite(12, HIGH);
    delay(100);
    digitalWrite(12, LOW);
    delay(100);
      Serial.println();
     Serial.print("left Interation number = ");
    Serial.println(i);
    
    
  }//for brace
      
}//function brace

```

# My second answer (Right)

```C++
bool bitArray[] = {0, 0, 0, 0, 0, 0, 0, 0};  // We'll change values during run

void setup() {
  pinMode(11, OUTPUT); // Shift register clock
  pinMode(12, OUTPUT); // Output register clock
  pinMode(13, OUTPUT); // Data input
  Serial.begin(9600);
}

void loop() {
  shiftRight();
  shiftLeft();
}

void shiftRight() {
  int len = sizeof(bitArray) / sizeof(bitArray[0]);

  for (int pos = 0; pos < len; pos++) {
    // Clear all bits
    for (int i = 0; i < len; i++) {
      bitArray[i] = 0;
    }

    bitArray[pos] = 1; // Set 1 in the current position

    // Send all 8 bits
    for (int i = len - 1; i >= 0; i--) {
      digitalWrite(13, bitArray[i]);
      digitalWrite(11, HIGH);
      delay(5);
      digitalWrite(11, LOW);
      delay(5);
    }

    // Latch once after sending all bits
    digitalWrite(12, HIGH);
    delay(5);
    digitalWrite(12, LOW);
    delay(150);

    Serial.print("Right Iteration number = ");
    Serial.println(pos);
  }
}

void shiftLeft() {
  int len = sizeof(bitArray) / sizeof(bitArray[0]);

  for (int pos = len - 2; pos > 0; pos--) {
    for (int i = 0; i < len; i++) {
      bitArray[i] = 0;
    }

    bitArray[pos] = 1;

    for (int i = len - 1; i >= 0; i--) {
      digitalWrite(13, bitArray[i]);
      digitalWrite(11, HIGH);
      delay(5);
      digitalWrite(11, LOW);
      delay(5);
    }

    digitalWrite(12, HIGH);
    delay(5);
    digitalWrite(12, LOW);
    delay(150);

    Serial.print("Left Iteration number = ");
    Serial.println(pos);
  }
}

```

### Here we new everytime but with the one at a different position each time

----

# The simpler method 

```C++
void setup() {
  pinMode(11, OUTPUT); // Clock
  pinMode(12, OUTPUT); // Latch
  pinMode(13, OUTPUT); // Data input
}

void loop() {
  // Move left to right (Q0 to Q7)
  for (int pos = 0; pos < 8; pos++) {
    // Push 8 bits total
    for (int i = 7; i >= 0; i--) {
      if (i == pos) {
        digitalWrite(13, HIGH); // Only turn on the current LED
      } else {
        digitalWrite(13, LOW);
      }
      digitalWrite(11, HIGH);
      delay(5);
      digitalWrite(11, LOW);
      delay(5);
    }

    // Latch to show result
    digitalWrite(12, HIGH);
    delay(5);
    digitalWrite(12, LOW);
    delay(200);
  }

  // Move right to left (Q6 to Q1)
  for (int pos = 6; pos > 0; pos--) {
    for (int i = 7; i >= 0; i--) {
      if (i == pos) {
        digitalWrite(13, HIGH);
      } else {
        digitalWrite(13, LOW);
      }
      digitalWrite(11, HIGH);
      delay(5);
      digitalWrite(11, LOW);
      delay(5);
    }

    digitalWrite(12, HIGH);
    delay(5);
    digitalWrite(12, LOW);
    delay(200);
  }
}

```
![1](https://github.com/user-attachments/assets/f2699880-904c-4a5e-9312-14489a366b68)

![[1 1.jpg]]

  ![[2 1.jpg]]
## ✅ Knight Rider Code Learning Summary

---

### 🔹 **My Question 1:**

**"Why do I need to clear the array with 0s every time? It already has 0s."**

#### ❌ The Problem:

- If you don’t reset the array, the previous `1`s stay ON.
    
- This causes **multiple LEDs** to be ON at once — it looks like the light is **building up** instead of **moving**.
    
mmmm
#### ✅ The Solution:

- Reset the array in every loop:
    
    ```cpp
    for (int i = 0; i < len; i++) {
      bitArray[i] = 0;
    }
    ```
    
- Then set only **one position** to `1`:
    
    ```cpp
    bitArray[pos] = 1;
    ```
    

#### 🆕 New Concept Introduced:

- **Array Reset Logic**: clearing data before updating LED state
    
- Understanding the difference between **building** and **moving** effects
    

---

### 🔹 **My Question 2:**

**"Why doesn't my original array code make the LED move?"**

#### ❌ The Problem:

- You were only reading from the array.
    
- You never changed its values (the `1` stayed at the same index).
    
- You also latched the output **after each bit**, not after all 8 bits.
    

#### ✅ The Solution:

- You must update the array to move the `1` to a new position.
    
- Send all 8 bits first, **then latch once**:
    
    ```cpp
    for (int i = len - 1; i >= 0; i--) {
      digitalWrite(13, bitArray[i]);
      digitalWrite(11, HIGH); delay(5);
      digitalWrite(11, LOW);  delay(5);
    }
    digitalWrite(12, HIGH); delay(5);
    digitalWrite(12, LOW);
    ```
    

#### 🆕 New Concept Introduced:

- **Latch timing**: latch **after all bits**, not after each bit
    
- **Dynamic array updates**: move the light by modifying array content
    

---

### 🔹 **My Question 3:**

**"Why not just push a 1 once and then 0s — won’t that move the LED too?"**

#### ✅ The Insight:

- Yes, this is a smart alternative idea — it's called a **serial bit-push** method.
    
- You push a `1` into the register, then follow with `0`s to shift it across.
    

#### ❌ The Problem with Your Original Version:

- You were **latching after every bit**, and not controlling timing.
    
- You didn’t consistently push exactly 8 bits.
    
- You weren’t clearing the shift register between direction changes.
    

#### ✅ The Solution:

- Push 1 once, then loop to push 7 zeros:
    
    ```cpp
    digitalWrite(13, HIGH); // Push 1
    pulseClock();
    
    for (int i = 0; i < 7; i++) {
      digitalWrite(13, LOW); // Push 0s
      pulseClock();
    }
    pulseLatch();
    ```
    

#### 🆕 New Concept Introduced:

- **Bit shifting with logic** (no arrays)
    
- Control over **serial data flow**
    
- Use of `if (i == pos)` to replace an array
    

---

### 🔹 **My Question 4:**

**"Is there a simpler way to make Knight Rider without the array?"**

#### ✅ The Insight:

- Yes — you can simulate the same effect using just two nested loops and math.
    

#### ✅ The Solution:

Use this structure:

```cpp
for (int pos = 0; pos < 8; pos++) {
  for (int i = 7; i >= 0; i--) {
    digitalWrite(13, (i == pos) ? HIGH : LOW); // Only 1 LED ON
    pulseClock();
  }
  pulseLatch();
  delay(200);
}
```

#### 🆕 New Concept Introduced:

- **Logical control using if-condition** inside loops
    
- **No need for arrays** when only one LED is ON at a time
    
- Cleaner, simpler logic for beginners once you understand what's happening
    

---

## 🧾 Summary of Concepts Learned

|Concept|What It Means|
|---|---|
|Array clearing|Always reset array before setting the new LED position|
|Latch timing|Only latch **after all 8 bits** are sent|
|Serial bit push|You can “move” a 1 across by pushing zeros after it|
|`if (i == pos)` logic|Easy way to light up one LED without using an array|
|`sizeof(bitArray)/sizeof(bitArray[0])`|Safe way to get array length|
|Looping through array backwards|Required because shift register outputs MSB to Q7|



---


