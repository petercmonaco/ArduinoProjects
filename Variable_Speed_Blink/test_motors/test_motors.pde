/* random wander
  
 */

// this constant won't change.  It's the pin number
// of the sensor's output:
const int pingPin = 7;
long randnum;
long duration, inches, cm;

void setup() {
  // initialize serial communication:
  pinMode(2, OUTPUT); 
  pinMode(3, OUTPUT);  
  pinMode(4, OUTPUT); 
  pinMode(5, OUTPUT);  
  pinMode(7, OUTPUT);  
  digitalWrite(7, LOW); 
  Serial.begin(9600);
  randomSeed (analogRead(0));
}

void loop()
{
  RobotForward(2000);
  RobotStop(1000);
  
  RobotSpinLeft(2000);
  RobotStop(1000);
  
  RobotTwistLeft(2000);
  RobotStop(1000);
  
  RobotSpinRight(2000);
  RobotStop(1000);
  
  RobotTwistRight(2000);
  RobotStop(1000);
  
  RobotBackwards(2000);
  RobotStop(5000);
  
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
