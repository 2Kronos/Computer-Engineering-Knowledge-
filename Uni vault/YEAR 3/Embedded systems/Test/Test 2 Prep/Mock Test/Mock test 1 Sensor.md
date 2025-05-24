# Circuit link 
$distance =\frac{duration \times 0.343}{2}$

$Shortest \ distance =\frac{duration \times 0.343}{2}$
$Shortest \ distance =\frac{190 \times 0.343}{2}$
$Shortest \ distance =32.485$

$Furthest \ distance =\frac{duration \times 0.343}{2}$
$Furthest \ distance =\frac{19218 \times 0.343}{2}$
$Furthest \ distance = 3,295.887$

standby 3252- 1928

Arm 1928-968

flash 968-135

# Attempt 1 (Incomplete)

- Works but still need the Arm and disarm function
# Notes 

- Since I know that 

```
// C++ code
//
int trigPin = 10;
int echoPin = 9;
int length;
void setup()
{
  pinMode(trigPin, OUTPUT);
   pinMode(echoPin, INPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);
  
  Serial.begin(9600);
}

void loop()
{
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  
  long duration = pulseIn(echoPin, HIGH);
  //Serial.println(duration);
  long length = map(duration, 190, 19218, 32, 3295);
  Serial.print("Distance = ");
 Serial.print(length);
  Serial.println("mm");
  //Serial.println(duration);
  
  detection(length);
} 


void detection(int distance){
  
  if(distance < 3295 && distance  >1928){
    digitalWrite(11, HIGH);
   delay(10);
    digitalWrite(11, LOW);
    delay(10);
    Serial.print("Standby");
  }
  
  delay(100);
  if(distance < 1928 && distance  >968){
    digitalWrite(12, HIGH);
 	Serial.print("ARM");
  }
  //delay(100);
  
  if(distance  < 968 && distance  >135){
    digitalWrite(13, HIGH);
    Serial.print("Intruder");
 
  }
  //delay(100);


}
```


# ATTEMPT 2 (Fully works)

```
int trigPin = 10;
int echoPin = 9;
long length;
bool systemArmed = false; // Tracks if security is ON/OFF

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(11, OUTPUT); // Standby LED
  pinMode(12, OUTPUT); // Warning LED
  pinMode(13, OUTPUT); // Intruder LED
  
  Serial.begin(9600);
  Serial.println("Security System Ready");
  Serial.println("Send 'ARM' to enable, 'DISARM' to disable");
}

void loop() {
  // 1. Measure distance
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  long duration = pulseIn(echoPin, HIGH);
  length = map(duration, 190, 19218, 32, 3295);

  // 2. Check for commands
  if (Serial.available() > 0) {
    String command = Serial.readStringUntil('\n');
    command.trim(); // Remove extra spaces
    
    if (command == "ARM") {
      systemArmed = true;
      Serial.println("SYSTEM ARMED - Monitoring started");
    } 
    else if (command == "DISARM") {
      systemArmed = false;
      digitalWrite(11, LOW); // Turn off all LEDs
      digitalWrite(12, LOW);
      digitalWrite(13, LOW);
      Serial.println("SYSTEM DISARMED - Monitoring stopped");
    }
  }

  // 3. Only detect if armed
  if (systemArmed) {
    detection(length);
  }
  delay(100); // Small delay
}

void detection(int distance) {
  // Turn off all LEDs first
  digitalWrite(11, LOW);
  digitalWrite(12, LOW);
  digitalWrite(13, LOW);

  // Check distance zones
  if (distance < 3295 && distance > 1928) {
    digitalWrite(11, HIGH); // Standby
    Serial.println("Standby zone");
  } 
  else if (distance <= 1928 && distance > 968) {
    digitalWrite(12, HIGH); // Warning
    Serial.println("Warning zone!");
  }
  else if (distance <= 968) {
    digitalWrite(13, HIGH); // Intruder
    Serial.println("INTRUDER DETECTED!");
  }
}
```
