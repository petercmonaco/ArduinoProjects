
/*
 * Adapted from one of the Adruino examples.
 * 
 * This is intended to be used with the ULN2003 5v stepper motor, and the
 * control chip that comes with it.  Different code is needed to use the
 * AdaFruit motor shield.
 * 
 * Documentation says that this motor has 513 steps per revolution,
 * but I found it's more like 2052 (exactly 4x).  Wondering if that has
 * to do with the software making 4 clicks per motor click.
 */
 
#include <Stepper.h>

const int stepsPerRevolution = 2052;  // change this to fit the number of steps per revolution
// for your motor


// initialize the stepper library on pins 8 through 11:
Stepper myStepper(stepsPerRevolution, 8, 9, 10, 11);

int stepCount = 0;  // number of steps the motor has taken

void setup() {
  // nothing to do inside the setup
}

void loop() {
  // read the sensor value:
//  int sensorReading = analogRead(A0);
  // map it to a range from 0 to 100:
  int motorSpeed =5;// map(sensorReading, 0, 1023, 0, 100);
  // set the motor speed:
  if (motorSpeed > 0) {
    myStepper.setSpeed(motorSpeed);
    // step 1/100 of a revolution:
    myStepper.step(stepsPerRevolution);
    while (1) {}
  }
}


