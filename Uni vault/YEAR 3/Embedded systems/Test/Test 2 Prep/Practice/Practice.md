
# DC Motor & H-Bridge

# Approach

- Use the motor direction notes
- We want to gradually increase the speed so we need a for 
- Use the `millis()` to stop the code at 5 second 
 - `millis()` captures system uptime in milliseconds 
 - The enable pin helps to switch the motor on or off so use a digital pin to write to high for on and the low for off
 - So if its more than that 5 second stop it 

**Syntax**:  
```cpp 
unsigned long currentTime = millis(); // Returns elapsed time in ms 
```  

## **🔄 Motor Control Pins (H-Bridge Logic)**  

### **Motor A (Pins 2,3,6,7)

- If you are using loops remember that the configuration below is for max speed so the closer they get to this configuration the faster they become 
- Example

```
//
int speed;
void setup()
{

  pinMode(3, OUTPUT);//input 2
  pinMode(7, OUTPUT);//input 1
}

void loop()
{
  digitalWrite(7, HIGH);
  for(speed = 255; speed<-1; speed++){
  analogWrite(3, speed);
    delay(50);
  }
  }
```
- The loop will count down from 255 till 0 therefore getting closer the the `IN1=HIGH, IN2=LOW` configuration

- Example 2 to slow down

```
//digitalWrite(7, LOW);
      for(speed = 0;speed < 255; speed++){
  analogWrite(3, speed);
    delay(50);
  }
```
- The loop will count down from 0 till 255 therefore getting further away from the the `IN1=HIGH, IN2=LOW` configuration

| **Pin** | **Name** | **Purpose**                           | **Truth Table**               |     |
| ------- | -------- | ------------------------------------- | ----------------------------- | --- |
| **2**   | Input 1  | Controls Motor A direction (HIGH/LOW) | `IN1=HIGH, IN2=LOW` → Foward  |     |
| **7**   | Input 2  | Controls Motor A direction (HIGH/LOW) | `IN1=LOW, IN2=HIGH` → reverse |     |
| **3**   | Output 1 | Connects to Motor A’s **+ terminal**  | Motor A Wire (+)              |     |
| **6**   | Output 2 | Connects to Motor A’s **- terminal**  | Motor A Wire (-)              |     |
|         |          |                                       |                               |     |

### **Motor B (Pins 10,11,14,15)**
| **Pin** | **Name** | **Purpose**                           | **Truth Table**               |
| ------- | -------- | ------------------------------------- | ----------------------------- |
| **10**  | Input 3  | Controls Motor B direction (HIGH/LOW) | `IN3=HIGH, IN4=LOW` → Forward |
| **15**  | Input 4  | Controls Motor B direction (HIGH/LOW) | `IN3=LOW, IN4=HIGH` → Reverse |
| **11**  | Output 3 | Connects to Motor B’s **+ terminal**  | Motor B Wire (+)              |
| **14**  | Output 4 | Connects to Motor B’s **- terminal**  | Motor B Wire (-)              |

🔹 **How Direction Control Works (H-Bridge Logic)**  
- **Forward**: `IN1=HIGH, IN2=LOW` → Current flows **Output 1 → Output 2**  
- **Reverse**: `IN1=LOW, IN2=HIGH` → Current flows **Output 2 → Output 1**  
- **Brake**: `IN1=IN2=HIGH` (or `LOW`) → Motor stops

# Circuit link 

https://www.tinkercad.com/things/4GHTFIQj3kS-practice-dc-motor-amp-h-bridge-

# Code

```
// C++ code
//
unsigned long currentTime;
void setup()
{

  pinMode(3, OUTPUT);//input 2
  pinMode(7, OUTPUT);//input 1
    pinMode(9, OUTPUT);//enable
  Serial.begin(9600);
    
}

void loop()
{
 
currentTime = millis();
  Serial.println( currentTime);
  
  if(currentTime > 5000){
  digitalWrite(9, LOW);
   }else{
    digitalWrite(9, HIGH);  
  digitalWrite(7, HIGH);//Loop to increase speed
  for(int i = 255; i>-1; i--){
    analogWrite(3, i);
      delay(1);  
  //Serial.println(i);
  }
  
  }
}
  
   


```