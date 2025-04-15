![[Pasted image 20250401090146.png]]

```C++
int green
For(int blue = 0; blue< array.length(); blue++){
green = blue +1;
array(blue) = array(green);
}
array[array.length()-1] = temp
```

- On second loop
  
  ![[Pasted image 20250401090509.png]]
- The one has dissappeard and will place  into a tempolarily value
- Green into blue
- We shit to the right while moving values to the left



# 9.1.1 Using the serial monitor and serial functions to read the input data from user. 
## Determining the length of the Input & String

## Determining the location of a single character 

https://www.tinkercad.com/things/6QEe7axDLEj-design-911

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

- Make sure to use the appropriate baud rate 

### 1. Main Loop
```cpp
void loop() {
  inputLength = Serial.available();
  
  if (inputLength > 0) {
    userIn = Serial.readString();
```

#### Key Serial Functions:
1. `Serial.available()` - Returns the number of bytes available to read from serial buffer
2. `Serial.readString()` - Reads the incoming serial data as a String

### 2. Getting Character at Position 3
```cpp
    // Ensure string has at least 4 characters before accessing index 3
    if (userIn.length() > 3) {
      readChar = userIn.charAt(3);
    } else {
      readChar = '\0'; // Default to null character if out of bounds
    }
```
- Checks if string is long enough (indices start at 0, so index 3 is the 4th character)
- Uses `String.charAt(index)` to get the specific character
- If string is too short, sets `readChar` to null character
- Must  **Measure `inputLength` AFTER reading**

### 3. Getting String Length
```cpp
    stringLength = userIn.length();
```
- `String.length()` returns the number of characters in the string



## Key Code Snippets for Specific Functions

### 1. Reading Serial Input
```cpp
String readSerialInput() {
  while (Serial.available() == 0) {} // Wait for input
  return Serial.readString();
}
```

### 2. Getting String Length
```cpp
int getStringLength(String str) {
  return str.length();
}
```

### 3. Getting Character at Specific Index
```cpp
char getCharAtIndex(String str, int index) {
  if (index >= 0 && index < str.length()) {
    return str.charAt(index);
  }
  return '\0'; // Return null if index out of bounds
}
```

### 4. Complete Process in One Function
```cpp
void processSerialInput() {
  if (Serial.available() > 0) {
    String input = Serial.readString();
    int length = input.length();
    char thirdChar = length > 3 ? input.charAt(3) : '\0';
    
    Serial.println("Received: " + input);
    Serial.println("Length: " + String(length));
    Serial.println("3rd char: " + String(thirdChar));
  }
}
```

## How It Works
1. The program waits for serial input (from Serial Monitor or other serial device)
2. When data arrives, it reads the entire input as a String
3. It then:
   - Measures the raw byte count available (`inputLength`)
   - Measures the string character count (`stringLength`)
   - Safely extracts the 4th character (index 3)
4. Finally, it prints all this information back to the serial monitor



### How to read a character at a specific value 
```C++
//use the objec.charAt(3) function
readchar = userIn.charAt(3);
```

- **Loop Function (`loop()`)**:
    
    - Checks if there is incoming serial data using `Serial.available()`.
        
    - If data is available, it reads the full input string using `Serial.readString()`.
        
    - Extracts the **fourth character** (index 3) from `userIn` using `charAt(3)`, but only if the string is long enough. Otherwise, `readChar` is set to `'\0'`.
        
    - Stores the length of `userIn` using `userIn.length()`.
        
    - Prints:
        
        - The number of bytes available before reading.
            
        - The full received string.
            
        - The string's length.
            
        - The extracted character at index 3.
            

### **How It Works with Strings**

- **Reading Strings**: `userIn = Serial.readString();` reads a full line from the serial buffer.
    
- **Finding String Length**: `userIn.length();` returns the total number of characters.
    
- **Accessing Characters**: `userIn.charAt(3);` retrieves the character at position 3 (if available).
    
- **Handling Out-of-Bounds Access**: If `userIn` is shorter than 4 characters, it sets `readChar` to `'\0'` (null character) to prevent errors.

----



# 9.1.2 Using substring and getting the position of the data required 

https://www.tinkercad.com/things/4m8qvyViJkS-design-912

## Main code 

```C++
  inputLength = userIn.length(); // Correct length
    
    partString = userIn.substring(2,5);
    
    startPos = userIn.indexOf(" ");
      
    Serial.print("User input:");
    Serial.println(userIn);
   
    Serial.print("This is a substring:");
    Serial.println(partString);
    
    Serial.print("Position of 'space':");
    Serial.println(startPos);
```

- This code will create a substring at the desired start and end point specified in the code
	- `partString = userIn.substring(start,end);`

- It also searches the position of a specific data
	- `startPos = userIn.indexOf("data we are looking for ");`

# 9.2.1 Using indexOf()

https://www.tinkercad.com/things/7DzMk4N7V5T-design-92

- If you trying to find the position of data that is not present you will get a `-1`
- In order to get the end position of a string it has to be bigger than `-1` and 
  and bigger than the starting position 
- This is done in the code below
	- ` if((startPos > -1)&&(endPos > startPos)){`
	- This line will make sure of that 

```C++
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
```

# 9.2.2

https://www.tinkercad.com/things/iguccydT2T1-design-922

- We want whats is inside the brackets 
- We will use a substring

` stringPiece = userIn.substring(startPos, endPos);`

- Here we will the output would be like e.g 
	- `stringPiece = On(9`
	- But we want the data in between the brackets only so we must move the index three times in order to get what is between the brackets 
	- `startPos = startPos + 3;  `

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

# 9.3 Bluetooth Module 


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

# 9.4