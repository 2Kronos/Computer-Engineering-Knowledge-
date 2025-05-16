


# 9.1.1 Using the serial monitor and serial functions to read the input data from user. 
## Determining the length of the Input & String

## Determining the location of a single character 

### **Circuit link**

https://www.tinkercad.com/things/6QEe7axDLEj-design-911

### **Code**

```C++
int inputLength, stringLength; 
char readChar;
String userIn; // Use Arduino's String type

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {//read only when b
    userIn = Serial.readStringUntil('\n');
//Use readStringUntil('\n') to read complete lines
    userIn.trim();
    
    inputLength = userIn.length(); // Correct length
    
    if (userIn.length() > 3) {
      readChar = userIn.charAt(3);
    } else {
      readChar = '\0';
    }

    stringLength = userIn.length();
    
    Serial.print("Input Length: ");
    Serial.println(inputLength); // Now matches String Length
    
    Serial.print("User Input: ");
    Serial.println(userIn);
    
    Serial.print("String Length: ");
    Serial.println(stringLength);
    
    Serial.print("Character at Index 3: ");
    Serial.println(readChar);
  }
}
```

### **Notes**

#### Code Explanation: Serial Input Processing in Arduino

This code reads user input from the Serial Monitor and performs some basic processing on it. Here's a detailed breakdown:

#### Key Components

1. **Global Variables**
   - `inputLength`: Stores the length of user input
   - `readChar`: Stores the character at position 3 (if available)
   - `userIn`: A String object to hold the complete user input

2. **setup() Function**
   - Initializes the built-in LED pin as output (though not used in this code)
   - Starts serial communication at 9600 baud rate

3. **loop() Function** (Main Logic)

#### How It Works

### 1. Checking for Serial Input
```arduino
if (Serial.available() > 0) {
```
- This checks if there's any data available in the serial buffer
- Only proceeds if there's at least 1 byte available

#### 2. Reading Input
```arduino
userIn = Serial.readStringUntil('\n');
userIn.trim();
```
- `readStringUntil('\n')` reads all incoming characters until it encounters a newline
- `trim()` removes any leading/trailing whitespace (spaces, tabs, newlines)

#### 3. Getting Input Length
```arduino
inputLength = userIn.length();
```
- Stores the length of the processed string (after trimming)

#### 4. Extracting Character at Position 3
```arduino
if (userIn.length() > 3) {
  readChar = userIn.charAt(3);
} else {
  readChar = '\0';
}
```
- Checks if string is long enough to have a character at index 3 (4th character)
- If yes, stores that character
- If no, stores null character ('\0')

#### 5. Printing Results
```arduino
Serial.print("Input Length: ");
Serial.println(inputLength);

Serial.print("User Input: ");
Serial.println(userIn);

Serial.print("Character at Index 3: ");
Serial.println(readChar);
```
- Prints three pieces of information:
  1. Length of the input string
  2. The actual input string
  3. The character at position 3 (or null if too short)

#### Example Behavior

If you send:
```
Hello World
```
Output will be:
```
Input Length: 11
User Input: Hello World
Character at Index 3: l
```

If you send:
```
Hi
```
Output will be:
```
Input Length: 2
User Input: Hi
Character at Index 3: 
```

#### Key Notes

- The code waits for complete lines (terminated by '\n')
- It handles strings of any length (up to Arduino's memory limits)
- The character at position 3 is zero-indexed (1st character = position 0)
- The LED pin is initialized but never used in this code
- All serial printing happens only when new input is received
----



# 9.1.2 Using substring and getting the position of the data required 

### **Circuit link**

https://www.tinkercad.com/things/4m8qvyViJkS-design-912

### **Code**

```C++
int inputLength, startPos; 
char readChar;
String userIn, partString; // Use Arduino's String type

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {//read only when b
    userIn = Serial.readStringUntil('\n');
//Use readStringUntil('\n') to read complete lines
    userIn.trim();
    
    inputLength = userIn.length(); // Correct length
    
    partString = userIn.substring(2,5);
    
    startPos = userIn.indexOf("5");
      
    Serial.print("User input:");
    Serial.println(userIn);
   
    Serial.print("This is a substring:");
    Serial.println(partString);
    
    Serial.print("Position:");
    Serial.println(startPos);
    
    //Serial.print("Character at Index 3: ");
    //Serial.println(readChar);
  }
}
```

### **Notes**
- This code will create a substring at the desired start and end point specified in the code
	- `partString = userIn.substring(start,end);`

- It also searches the position of a specific data
	- `startPos = userIn.indexOf("data we are looking for ");`

# 9.2.1 Using indexOf() to get position of string


### **Circuit link**
https://www.tinkercad.com/things/7DzMk4N7V5T-design-92

### **Code**

```C++
 int  startPos,endPos; 

String userIn, partString; // Use Arduino's String type

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {//read only when b
    userIn = Serial.readStringUntil('\n');
    Serial.println(userIn);
	//Serial.print("
    userIn.trim();
    
    //must be bigger than -1 and startPos
    endPos = userIn.indexOf(");");
    startPos = userIn.indexOf("On(");
    
     //Used as an indication to check if the phrase was found or not 
    if((startPos > -1)&&(endPos > startPos)){
    Serial.print("StartPos =");
    Serial.println(startPos);
    Serial.print("endPos =");
    Serial.print(endPos);
    
    }else{
      Serial.println("Nothing to switch on");
    }
   
}
  }
```
### **Notes**

- If you trying to find the position of data that is not present you will get a `-1`
- In order to get the end position of a string it has to be bigger than `-1` and 
  and bigger than the starting position 
- This is done in the code below
	- ` if((startPos > -1)&&(endPos > startPos)){`
	- This line will make sure of that 

# Understanding `indexOf()` in Arduino Strings

This code demonstrates how to find the positions of specific substrings within a larger string using the `indexOf()` method. Let me explain exactly how it works:

## How `indexOf()` Works

The `indexOf()` method searches for a substring within a String and returns:
- The **zero-based index position** where the substring **starts**
- `-1` if the substring is **not found**

### Key Characteristics:
1. **Zero-based indexing** - First character is position 0
2. **Returns first occurrence only** - If the substring appears multiple times, you get the first one
3. **Case-sensitive** - "On(" is different from "on("
4. **Exact matches** - Looks for the exact sequence of characters

## In Your Specific Code

### Finding "On("
```arduino
startPos = userIn.indexOf("On(");
```
- Looks for the exact substring "On("
- Returns position where 'O' starts if found
- Returns -1 if not found

### Finding ");"
```arduino
endPos = userIn.indexOf(");");
```
- Looks for the exact substring ");"
- Returns position where ')' starts if found
- Returns -1 if not found

## Example Walkthrough

If user inputs:
```
Turn On(5); the light
```

1. `startPos = userIn.indexOf("On(")` → Finds "On(" starting at position 5
2. `endPos = userIn.indexOf(");")` → Finds ");" starting at position 9
3. The condition `(startPos > -1) && (endPos > startPos)` evaluates to true
4. Output would be:
   ```
   StartPos = 5
   endPos = 9
   ```

## What the Positions Mean

- `startPos` (5) points to the 'O' in "On("
- `endPos` (9) points to the ')' in ");"

## Important Notes

1. **String positions include all characters** - Spaces, symbols, everything counts
2. **The positions are absolute** - Relative to the start of the entire string
3. **Not finding patterns** - If either "On(" or ");" is missing, the code prints "Nothing to switch on"
4. **Order matters** - The code specifically checks that ");" comes after "On("

## Practical Usage

This pattern is commonly used for:
- Parsing simple commands (like "On(5);")
- Extracting parameters between parentheses
- Validating command syntax in serial communication

The code could be extended to extract what's between "On(" and ");" by using `substring()` with these positions.
# 9.2.2 Using indexOf to display the input as an integer

### **Circuit link**

https://www.tinkercad.com/things/iguccydT2T1-design-922

- We want whats is inside the brackets 
- We will use a substring

` stringPiece = userIn.substring(startPos, endPos);`

- Here we will the output would be like e.g 
	- `stringPiece = On(9`
	- But we want the data in between the brackets only so we must move the index three times in order to get what is between the brackets 
	- `startPos = startPos + 3;  `
### **Code**

```C++
int  startPos,endPos; 

String userIn, partString, stringPiece; // Use Arduino's String type

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {//read only when b
    userIn = Serial.readStringUntil('\n');
    Serial.println(userIn);
	//Serial.print("
    userIn.trim();
    
    //must be bigger than -1 and startPos
    endPos = userIn.indexOf(");");
    startPos = userIn.indexOf("On(");
    
     //Used as an indication to check if the phrase was found or not 
    if((startPos > -1)&&(endPos > startPos)){
      
    Serial.print("StartPos =");
    Serial.println(startPos);
    startPos = startPos + 3;  
      
    Serial.print("endPos =");
    Serial.println(endPos);
      
    stringPiece = userIn.substring(startPos, endPos);
    Serial.print("stringPiece = ");
    Serial.println(stringPiece);
    
    }else{
      Serial.println("Nothing to switch on");
    }
   
}
  }
```

### **Notes**
# 9.3 Bluetooth Module 

### **Circuit link**

### **Code**
```C++
#inlude <softwareSerial.h>

SoftwareSerial btSerial(2,3);//2= recieve RX

// 3 = Transmit TX

  
  

void setup() {

  btSerial.begin(9600);

}

  

void loop() {

  if(btSerial.avail()>0 ){ //check information from the  bluetooth serial(Arduino or bluetooth Module)

    blueIn = btSerial.readString(); //read the information on the bluetooth serial t

    Serial.println(blueIn)// then send it to the serial

  }

  //btSerial.println("Name of bluetooth")

  //Swap around so that it will communincate from cellphone to laptop

  //from laptop to the laptop

  //this wilkl

  

   if(Serial.avail()>0 ){

    blueIn = Serial.readString();

    btSerial.println(blueIn)//read from the normal serial it will then be put into the bluetooth

  }

}
```

### **Notes**
# 9.4 Switch on specific Led with user input

### **Circuit link**
https://www.tinkercad.com/things/g4HbM50oHHv-design-94

### **Code**

```
int  startPos,endPos, posLED; 

String userIn, partString, stringPiece; // Use Arduino's String type

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
  pinMode(5, OUTPUT);
  pinMode(9, OUTPUT);
  pinMode(3, OUTPUT);
}

void loop() {
  if (Serial.available() > 0) {//read only when b
    userIn = Serial.readStringUntil('\n');
    Serial.println(userIn);
	//Serial.print("
    userIn.trim();
    
    //must be bigger than -1 and startPos
    endPos = userIn.indexOf(");");
    startPos = userIn.indexOf("On(");
    
     //Used as an indication to check if the phrase was found or not 
    if((startPos > -1)&&(endPos > startPos)){
      
    Serial.print("StartPos =");
    Serial.println(startPos);
    startPos = startPos + 3;  
      
    Serial.print("endPos =");
    Serial.println(endPos);
      
    stringPiece = userIn.substring(startPos, endPos);
    Serial.print("stringPiece = ");
    Serial.println(stringPiece);
      
    posLED = stringPiece.toInt();
      
    digitalWrite(posLED,HIGH);
    
    }else{
      Serial.println("Nothing to switch on");
    }
   
}
  }
```

### **Notes**