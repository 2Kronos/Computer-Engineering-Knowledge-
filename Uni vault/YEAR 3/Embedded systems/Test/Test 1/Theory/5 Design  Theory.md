
# Design 5.2 

- Instead of writing each pinmode one by one we can create an array to loop around the,

```C++
int DT = 400; //Delay time
int PN []={3,5,5,9,10,11};
void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
   for (int count = 0; count<6; count++) {
    pinMode(PN[count], OUTPUT);
    //pinMode(A0, INPUY);
}
```

# 5.4

```C++

void loop() {
  // Gradually increase brightness
  for (int brightness = 0; brightness <= 255; brightness++) {
    for (int count = 0; count < 6; count++) {
      analogWrite(PN[count], brightness);
    }
    delay(DT);
  }

  // Gradually decrease brightness
  for (int brightness = 255; brightness >= 0; brightness--) {
    for (int count = 0; count < 6; count++) {
      analogWrite(PN[count], brightness);
    }
    delay(DT);
  }
}
```

- Use for loops and nested for loops 
- Outer loop to control the brightness
- Inner loop to control which led turns on with that corresponding brightness

# 5.5.1 One LED at a times goes brighter 

```C++
oid loop() {
  // Gradually increase brightness
  for(int count = 0; count<6; count ++){

    for (int brightness = 0; brightness <256; brightness++) {
        analogWrite(PN[count], brightness);
        delay(DT);}

  // Gradually decrease brightness
  for (int brightness = 255; brightness >-1; brightness--) {
    analogWrite(PN[count], brightness);
    delay(DT);}
  
  }
}

```

This is a reverse of 5.4 as the outer loop will flip threw the LEDS and the inner loop will go brighter and then dimmer but only for one pin at a time 

# 5.5.2 Does the same thing at 5.5.1 but when the last led flashes it must go in opposite direction
```c++
for(int count = 5; count> -1; count --){

    for (int brightness = 0; brightness <256; brightness++) {
        analogWrite(PN[count], brightness);
        delay(DT);}

  // Gradually decrease brightness
  for (int brightness = 255; brightness >-1; brightness--) {
    analogWrite(PN[count], brightness);
    delay(DT);}
  
  }
```

Here we just copied and pasted the same for loop but we changed the LED loop to start from the last pin and makes its was way to the first
- To make the last led not blink twice use in the top loop `count<5 `

>[! KEY CONCEPT]
>LOOPS

# 5.5.3 Make the code shorter remove duplicates 

[!KEY CONCEPT]

- **FUNCTIONS** (`setup()`, `loop()`)
    
- **HARDWARE CONTROL** (`pinMode`, `digitalWrite`)



- Create a function that does the brightning and dimming of leds for both directions 
- Since inner code is the same we can create a function that just does that 


>[! KEY CONCEPT]
>Functions that will do repetitive work

# 5.6 Make one go brighter while the other LED goes dimmer 

>[! KEY CONCEPT]
>Using 2 brightness values (different variables names )
>B1 for 0-255
>B2 to use B1 value to decrease B2
>Thus going in opposite directions
















