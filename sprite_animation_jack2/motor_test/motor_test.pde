void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(2, OUTPUT); 
  pinMode(3, OUTPUT);  
  pinMode(4, OUTPUT); 
  pinMode(5, OUTPUT);  
  
  
  

}

void loop() {
 
  RobotForward(1000);  
  RobotStop(500);
  
  RobotSpinLeft(250);  
  RobotStop(500);
  
  RobotForward(1000);  
  RobotStop(500);
  
  RobotSpinRight(250); 
  RobotStop(500);
  
  RobotBackwards(1000);
  RobotStop(500);
  
  RobotSpinRight(250); 
  RobotStop(500);
  
  RobotForward(1000);
  RobotStop(500);
  
  RobotSpinLeft(250);
  RobotStop(500);
}

void RobotForward(int ms) {
  digitalWrite(2, HIGH);   
  digitalWrite(3, HIGH);   
  digitalWrite(4, HIGH);   
  digitalWrite(5, HIGH);  
  delay(ms); 
}

void RobotStop(int ms) {
  digitalWrite(2, LOW);
  digitalWrite(4, LOW);
  delay(ms);
}

void RobotSpinRight(int ms) {
  digitalWrite(2, HIGH);   // set the LED on
  digitalWrite(3, HIGH);   // set the LED on
  digitalWrite(4, HIGH);   // set the LED on
  digitalWrite(5, LOW);   // set the LED on
  delay(ms);
}

void RobotTwistRight(int ms) {
  digitalWrite(2, HIGH);   // set the LED on
  digitalWrite(3, HIGH);   // set the LED on
  digitalWrite(4, LOW);   // set the LED on
  digitalWrite(5, LOW);   // set the LED on
  delay(ms);
}

void RobotTwistLeft(int ms) {
  digitalWrite(2, LOW);   // set the LED on
  digitalWrite(3, HIGH);   // set the LED on
  digitalWrite(4, HIGH);   // set the LED on
  digitalWrite(5, HIGH);   // set the LED on
  delay(ms);
}

void RobotBackwards(int ms) {
  digitalWrite(2, HIGH);   // set the LED on
  digitalWrite(3, LOW);
  digitalWrite(4, HIGH);   // set the LED on
  digitalWrite(5, LOW);   // set the LED on  // set the LED of
  delay(ms);
}

void RobotSpinLeft(int ms) {
  digitalWrite(2, HIGH);   // set the LED on
  digitalWrite(3, LOW);   // set the LED on
  digitalWrite(4, HIGH);   // set the LED on
  digitalWrite(5, HIGH);   // set the LED on
  delay(ms);
}
