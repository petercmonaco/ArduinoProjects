
/*
 * Adapted from one of the Adruino examples.
 * 
 * This is intended to be used with the ULN2003 5v stepper motor, and the
 * control chip that comes with it.  Different code is needed to use the
 * AdaFruit motor shield.
 * 
 * Documentation says that this motor has 513 steps per revolution.
 * 
 * Motor doesn't seem to go much faster than 5 RPMs with this code.
 * I can't make it go backwards yet (although the MotorShield code can
 * make it go both ways).
 */
 
#include "MyStepper.h"

const int stepsPerRevolution = 513;  // change this to fit the number of steps per revolution
// for your motor


// initialize the stepper library on pins 8 through 11:
MyStepper myStepper(stepsPerRevolution, 8, 9, 10, 11);

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
    //while (1) {}
  }
}


