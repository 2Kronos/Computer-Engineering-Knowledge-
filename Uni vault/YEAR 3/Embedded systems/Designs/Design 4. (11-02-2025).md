# LED GAME
# 4.1 Set up

https://www.tinkercad.com/things/evZCsutYhDD-design-41?sharecode=PuYNqah9ynGsUA08u171fXbRRmPMs_3VjMvX5Kzfh6A

![[Pasted image 20250217024144.png]]

---

# 4.2.1 Each LED light up one after the other 

https://www.tinkercad.com/things/6jLlj7dKCzG-design-42?sharecode=-xi_p9AK-BxM_Yb3uK5tK2xYQBWNeO5ZAYV3lrkaBlI
If you want to enable pins **10 to 2**, you should set them **individually** in a loop:

```cpp
void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);

  // Loop to set pins 10 to 2 as OUTPUT
  for (int pin = 10; pin >= 2; pin--) {
    pinMode(pin, OUTPUT);
  }
}
```

### Explanation:

- A `for` loop iterates from **pin 10 down to pin 2**.
- `pinMode(pin, OUTPUT);` sets each pin as an **output**.

This ensures that all the pins from 10 to 2 are properly configured as **OUTPUT**.

# 4.2.2 Each LED flashes after one another (goes on then off)
https://www.tinkercad.com/things/5uk9ggpRRfq-design-422?sharecode=Asr8Bcr5CUVsVVeFVzHa8IusTUIpS1GgvqZe1jL5EOc

# 4.3 When you press a button it shows you which LED was lit up

https://www.tinkercad.com/things/lwERvVzwQto-design-423?sharecode=o16NjFVIjLPMEY6-T2vRJgZFzPulsetMp-joR-E3qfg

## What’s Fixed & Improved?

 - **`h_delay()` now checks the button continuously** instead of waiting for the full delay.  
 - **Only prints when the button is pressed** at the exact moment.  
 - **Prevents repeated messages by tracking previous state (`user_prev`).**

- Now, if you press the button at any instant during `h_delay()`, it will tell you which LED was ON at that moment!