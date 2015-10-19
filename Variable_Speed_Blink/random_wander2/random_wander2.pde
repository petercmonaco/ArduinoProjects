/* random wander 2 */

#include "pitches.h"

// this constant won't change.  It's the pin number
// of the sensor's output:
const int pingPin = 7;
long randnum;
long duration, inches;

void setup() {
  pinMode(2, OUTPUT); 
  pinMode(3, OUTPUT);  
  pinMode(4, OUTPUT); 
  pinMode(5, OUTPUT);  
  randomSeed (analogRead(0));
  // initialize serial communication:
  Serial.begin(9600);
}

void loop()
{
  //Robot Forward
  digitalWrite(2, HIGH);   
  digitalWrite(3, HIGH);   
  digitalWrite(4, HIGH);   
  digitalWrite(5, HIGH);  

  do
  {
    PingRoutine();
    //Serial.print(inches);
    //Serial.print("in, ");
    //Serial.println();
    delay(100);
    
  } while (inches > 6);
  
  //When it has encountered an obstruction, it backs up.
  RobotStop(100);
  delay(500);
  groan();
  RobotBackwards(500);
  
  //Check distance in several directions.
  long Inch[6];
  RobotSpinLeft(400);
  PingRoutine();
  Inch[1] = inches;
  RobotSpinRight(200);
  PingRoutine();
  Inch[2] = inches;
  Inch[3] = 0;
  RobotSpinRight(400);
  PingRoutine();
  Inch[4] = inches;
  RobotSpinRight(200);
  PingRoutine();
  Inch[5] = inches;
  
  //Find direction with maximum distance.
  int moveLeft = 800;
  int MaxInch = Inch[1];
  for (int i = 2; i<=5; i++) {
    if (Inch[i] > MaxInch) {
      MaxInch = Inch[i];
      moveLeft = 800 - 200*(i-1);
    }
  }
  // Move to the position that had the maximum distance
  if (MaxInch > 6) {
    RobotSpinLeft(moveLeft);
  } else {
    RobotStop(750);
    RobotSpinRight(100);
  }
  RobotStop(100);
  delay(500);
  happy();
}

long PingRoutine()
{  
    // The PING))) is triggered by a HIGH pulse of 2 or more microseconds.
    // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
    pinMode(pingPin, OUTPUT);
    digitalWrite(pingPin, LOW);
    delayMicroseconds(2);
    digitalWrite(pingPin, HIGH);
    delayMicroseconds(5);
    digitalWrite(pingPin, LOW);

    pinMode(pingPin, INPUT);
    //Ping in inches = microseconds/74; distance = half that.
    inches = pulseIn(pingPin, HIGH)/148;
    return inches;
}

void RobotForward(int ms) {
  digitalWrite(2, HIGH);   
  digitalWrite(3, HIGH);   
  digitalWrite(4, HIGH);   
  digitalWrite(5, HIGH);  
  delay(ms); 
}

void RobotBackwards(int ms) {
  digitalWrite(2, HIGH);
  digitalWrite(3, LOW);
  digitalWrite(4, HIGH);
  digitalWrite(5, LOW);
  delay(ms);
}

void RobotStop(int ms) {
  digitalWrite(2, LOW);
  digitalWrite(4, LOW);
  delay(ms);
}

void RobotSpinRight(int ms) {
  digitalWrite(2, HIGH);
  digitalWrite(3, HIGH);
  digitalWrite(4, HIGH);
  digitalWrite(5, LOW);
  delay(ms);
}

void RobotTwistRight(int ms) {
  digitalWrite(2, HIGH);
  digitalWrite(3, HIGH);
  digitalWrite(4, LOW);
  digitalWrite(5, LOW);
  delay(ms);
}

void RobotSpinLeft(int ms) {
  digitalWrite(2, HIGH);
  digitalWrite(3, LOW);
  digitalWrite(4, HIGH);
  digitalWrite(5, HIGH);
  delay(ms);
}

void RobotTwistLeft(int ms) {
  digitalWrite(2, LOW);
  digitalWrite(3, LOW);
  digitalWrite(4, HIGH);
  digitalWrite(5, HIGH);
  delay(ms);
}

void groan()  {
// notes in the melody:
int melody[] = {NOTE_C3, NOTE_A2,NOTE_C2};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {2,2,1 };

  // iterate over the notes of the melody:
  for (int thisNote = 0; thisNote < 3; thisNote++) {

    // to calculate the note duration, take one second 
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 1000/noteDurations[thisNote];
    tone(8, melody[thisNote],noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(8);
 
  }
}

void happy()  {
int melody[] = {NOTE_F6, NOTE_G6,NOTE_A6};
int noteDurations[] = {8,8,8};
  for (int thisNote = 0; thisNote < 3; thisNote++) {
    int noteDuration = 1000/noteDurations[thisNote];
    tone(8, melody[thisNote],noteDuration);
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    noTone(8);
  }
}

void banner()  {
int melody[] = {NOTE_F6, NOTE_D6,NOTE_AS5,NOTE_D6, NOTE_F6,
   NOTE_AS6,NOTE_D7, NOTE_C7,NOTE_AS6,NOTE_D5, NOTE_E5,NOTE_F5};
int noteDurations[] = {2,8,2,2,2,1,2,8,2,2,2,1};
  for (int thisNote = 0; thisNote < 12; thisNote++) {
    int noteDuration = 1000/noteDurations[thisNote];
    tone(8, melody[thisNote],noteDuration);
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    noTone(8);
  }
}

