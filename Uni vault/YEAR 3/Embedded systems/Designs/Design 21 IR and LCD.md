
# 21.1 Buttons
# CIRCUIT LINK 

https://www.tinkercad.com/things/i9DwHdeNsvZ-design-211

# CODE

```C++
#include <LiquidCrystal_I2C.h>
#include <Wire.h>
#include <IRremote.hpp>

LiquidCrystal_I2C serial_LCD(0x27, 16, 2);
const int IR_PIN = 2;
unsigned long remoteIn;
int charNum, colNum;

void setup(){
  Serial.begin(9600);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  
  serial_LCD.init();
  serial_LCD.backlight();
  serial_LCD.setCursor(0,0);// this is where to set the cursors
  serial_LCD.print(" melz");
  
   IrReceiver.begin(IR_PIN, ENABLE_LED_FEEDBACK);
  Serial.println("IR Receiver Ready");
  
   charNum = 48;
  colNum = 0;
  
}

void loop() {
    if (IrReceiver.decode()) {
      remoteIn  = IrReceiver.decodedIRData.decodedRawData;
  
		Serial.println(remoteIn);
      if(remoteIn == 4261527296){//vol up button
      	charNum--;
         serial_LCD.setCursor(colNum,1);
    	serial_LCD.write(charNum);
      }
      
      if(remoteIn == 4177968896){//right button button
      	colNum++;
         serial_LCD.setCursor(colNum,1);
    	serial_LCD.write(charNum);
      }
      
       if(remoteIn == 4127833856){//vol down button
      	charNum++;
         serial_LCD.setCursor(colNum,1);
    	serial_LCD.write(charNum);
      }
      
        if(remoteIn == 4211392256){//left button button
      	colNum--;
         serial_LCD.setCursor(colNum,1);
    	serial_LCD.write(charNum);
      }

        IrReceiver.resume(); // Receive the next value
    }
}
```

# NOTES

-----
#  21.2 # toggle between top and bottom line on LCD
# CIRCUIT LINK 

https://www.tinkercad.com/things/aEU5HGgRWnC-design-212
# CODE

```C++
#include <LiquidCrystal_I2C.h>
#include <Wire.h>
#include <IRremote.hpp>

LiquidCrystal_I2C serial_LCD(0x27, 16, 2);
const int IR_PIN = 2;
unsigned long remoteIn;
int charNum, colNum, rowNum;

void setup(){
  Serial.begin(9600);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  
  serial_LCD.init();
  serial_LCD.backlight();
  //serial_LCD.setCursor(0,0);// this is where to set the cursors
  //serial_LCD.print(" melz");
  
   IrReceiver.begin(IR_PIN, ENABLE_LED_FEEDBACK);
  Serial.println("IR Receiver Ready");
  
   charNum = 48;
  colNum = 0;
  rowNum = 0;
  
}

void loop() {
    if (IrReceiver.decode()) {
      remoteIn  = IrReceiver.decodedIRData.decodedRawData;
  
		Serial.println(remoteIn);
      if(remoteIn == 4261527296){//vol up button
      	charNum--;
         
      	}
      
      if(remoteIn == 4177968896){//right button button
      	colNum++;
        ;
      	}
      
       if(remoteIn == 4127833856){//vol down button
      	charNum++;
        
      	}
      
        if(remoteIn == 4211392256){//left button button
      	colNum--;
        
      	}
      
       if(remoteIn == 4194680576 ){//left button button
         if(rowNum == 0){
         	rowNum = 1;
         }else{
         	rowNum = 0;
         }
       
      }
       serial_LCD.setCursor(colNum,rowNum);
    	serial_LCD.write(charNum);

        IrReceiver.resume(); // Receive the next value
    }
}
```

# NOTES

-----

# 21.3 # Answer print out empty char array after each press


# CIRCUIT LINK 
https://www.tinkercad.com/things/7JhDXcO2Trb-213

# CODE

```
void setUp{}
void loop{}
```

# NOTES

**Serial.write()** is the correct choice if you want to send the **actual ASCII character** represented by the integer value 100, rather than sending the digits "1", "0", "0".

**Explanation:**
- `Serial.write(100)` sends the single byte value `100`, which corresponds to **ASCII character 'd'** (since ASCII value 100 = 'd')
- `Serial.print(100)` would send the three characters: '1', '0', '0' (the string representation of the number 100)

So if your array `ourChar` contains ASCII codes (like 100 = 'd', 65 = 'A', etc.) and you want to see the actual characters those codes represent, **Serial.write() is exactly what you should use**.


-----


# 21. 4 Put the character that you display on the LCD onto the serial monitor
# CIRCUIT LINK 

https://www.tinkercad.com/things/6FJR954xJQ5-214

# CODE

```
void setUp{}
void loop{
 ourChar[colNum-1] = charNum;
}

```

# NOTES

- The minus 1 is so that it start from the beginning of the array 

-----

# 21.5 switching on LED using infrared typing.


# CIRCUIT LINK 
https://www.tinkercad.com/things/ctOkAHNiVVb-215

# NEW CODE

```
void setUp{}
void loop{}
```
- function ` testForOn(ourChar);`

```c++
void  testForOn(int input[]){
 Serial.write(input[0]);
   Serial.print(" ");
  Serial.println(input[0]);
  }
```

- This is how we got the number 78 and 79
  
-  New pin for led  

```
void  testForOn(int input[]){
  if(input[0] == 79){//Checking for o
    if(input[1] == 78){//checking on
      digitalWrite(12, HIGH);
    }
  }
}
```
# NOTES

-----




# CIRCUIT LINK 

# CODE

```
void setUp{}
void loop{}
```

# NOTES

-----


# CIRCUIT LINK 

# CODE

```
```

# NOTES

-----



# CIRCUIT LINK 

# CODE

```
```

# NOTES

-----




# CIRCUIT LINK 

# CODE

```
```

# NOTES

-----


# CIRCUIT LINK 

# CODE

```
```

# NOTES

-----



# CIRCUIT LINK 

# CODE

# NOTES

-----



# CIRCUIT LINK 

# CODE

# NOTES

-----


