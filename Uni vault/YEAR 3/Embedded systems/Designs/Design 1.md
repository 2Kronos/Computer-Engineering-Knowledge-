## Code 

```C
// C++ code
//
void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop()
{
  digitalWrite(LED_BUILTIN, HIGH);
  delay(1000); // Wait for 1000 millisecond(s)
  digitalWrite(LED_BUILTIN, LOW);
  delay(1000); // Wait for 1000 millisecond(s)
}
```

- Set up can be seen as the reboot function
- Once the set up is done it will go into the loop
- If we dont have the delay we will not be able to see the LED flashing 

## Example

```
 pinMode(13, OUTPUT);
```

- Here we will make pin 13 an output in the code 
- So when it goes into the loop and now on `digitalwrite` 13 will go high (5V)