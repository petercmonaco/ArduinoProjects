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
  Serial.begin(9600);
  randomSeed (analogRead(0));
}

void loop()
{
  //RobotForward
  digitalWrite(2, HIGH);   
  digitalWrite(3, HIGH);   
  digitalWrite(4, HIGH);   
  digitalWrite(5, HIGH);  
  
  do
  {
  
    // The PING))) is triggered by a HIGH pulse of 2 or more microseconds.
    // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
    pinMode(pingPin, OUTPUT);
    digitalWrite(pingPin, LOW);
    delayMicroseconds(2);
    digitalWrite(pingPin, HIGH);
    delayMicroseconds(5);
    digitalWrite(pingPin, LOW);

    // The same pin is used to read the signal from the PING))): a HIGH
    // pulse whose duration is the time (in microseconds) from the sending
    // of the ping to the reception of its echo off of an object.
    pinMode(pingPin, INPUT);
    duration = pulseIn(pingPin, HIGH);

    // convert the time into a distance
    inches = microsecondsToInches(duration);
 
  
    Serial.print(inches);
    Serial.print("in, ");
    Serial.println();
  
    delay(100);
    
  } while (inches > 6);
  
  //When it has encountered an obstruction, it backs up.
  RobotBackwards(500);

  randnum = random (500);
  if (randnum>250)
  {
    RobotSpinRight(randnum);
  }
  else
  {
    RobotSpinLeft(randnum+250);
  }
}

long microsecondsToInches(long microseconds)
{
  // According to Parallax's datasheet for the PING))), there are
  // 73.746 microseconds per inch (i.e. sound travels at 1130 feet per
  // second).  This gives the distance travelled by the ping, outbound
  // and return, so we divide by 2 to get the distance of the obstacle.
  // See: http://www.parallax.com/dl/docs/prod/acc/28015-PING-v1.3.pdf
  return microseconds / 74 / 2;
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
