/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(13, OUTPUT);    
  Serial.begin(9600); 
}

void loop() {
  int sensorValue = analogRead(A0);
  digitalWrite(13, HIGH);   // set the LED on
  delay(sensorValue);              // wait for a second
  digitalWrite(13, LOW);    // set the LED off
  delay(sensorValue);              // wait for a second
}
