/*
 * Adapted from one of the Adruino examples.
 * 
 * This is intended to be used with the ULN2003 5v stepper motor, and the
 * control chip that comes with it.  Different code is needed to use the
 * AdaFruit motor shield.
 * 
 * Documentation says that this motor has 513 steps per revolution.
 * 
 * Motor doesn't seem to go much faster than 10 RPMs.
 */
 
#include "MyStepper.h"

const int stepsPerRevolution = 513;  // change this to fit the number of steps per revolution
// for your motor


// initialize the stepper library on pins 8 through 11:
MyStepper myStepper(stepsPerRevolution, 8, 9, 10, 11);

void setup() {
  // nothing to do inside the setup
}

void loop() {
  double rpms = 10;
  // set the motor speed:
  myStepper.setRPMs(rpms);
  myStepper.step(-1000);
  //while (1) {}
}


