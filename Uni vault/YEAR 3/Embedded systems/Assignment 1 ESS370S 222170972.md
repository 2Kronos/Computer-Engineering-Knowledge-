
```
// C++ code
// 222170972 Chrinovic Raya Tshiwaya
int alarmIn_1,tiltIn_1;
void setup()
{
  pinMode(2,INPUT);
  pinMode(3,INPUT);
  Serial.begin(9600);
}

void loop()
{
  tiltIn_1 = digitalRead(2);
  alarmIn_1 = digitalRead(3);
  Serial.print("alarm = ");
  Serial.print(alarmIn_1);
  Serial.print(" tilt = ");
  Serial.println(tiltIn_1);
}
```

[Circuit link](https://www.tinkercad.com/things/a6mHeSPQzHh-assignment-1-222170972)

![`Pasted image 20250923225657.png`](images/`Pasted image 20250923225657.png`)


```mermaid
flowchart LR
    subgraph Inputs
        A[Start Button<br>Pin 10]
        B[IR Remote<br>Power Control]
        C[Potentiometer<br>Water Level A5]
    end

    subgraph Control[Arduino Control]
        D[Cycle Controller]
        E[Power Manager]
        F[Water Monitor]
    end

    subgraph Outputs
        G[4 LEDs<br>Drum Motor Pins4-7]
        H[Valve LED Pin8]
        I[Pump Motor Pin9]
        J[Serial Display]
    end

    A --> D
    B --> E
    C --> F
    
    E --> D
    F --> D
    D --> G
    D --> H
    D --> I
    D --> J
```
