// Adafruit Motor shield library
// copyright Adafruit Industries LLC, 2009
// this code is public domain, enjoy!

#include <AFMotor.h>
#include <Servo.h> 
// DC hobby servo
Servo servo1;

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Motor party!");
  
  // turn on servo
  servo1.attach(9);
}

int i;
int MAX = 150;

// Test the DC motor, stepper and servo ALL AT ONCE!
void loop() {
  for (i=0; i<MAX; i++) {
    servo1.write(i);
    delay(6);
 }
 Serial.println(i);
 delay(500);
 
  for (i=MAX; i>0; i--) {
    servo1.write(i);
    delay(6);
 }
 Serial.println(i);
 delay(500);
}
