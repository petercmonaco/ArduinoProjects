/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

void setup() {                
  // initialize the digital pin as an output.
  // Pin 13 has an LED connected on most Arduino boards:
  pinMode(2, OUTPUT); 
  pinMode(3, OUTPUT); 
  pinMode(4, OUTPUT); 
  pinMode(5, OUTPUT); 
  pinMode(6, OUTPUT); 
  pinMode(7, OUTPUT); 
  pinMode(8, OUTPUT); 
  pinMode(9, OUTPUT); 
  digitalWrite(6, HIGH);
  clearAll();
  Serial.begin(9600); 
}

void loop() {
  showOne();
  delay(1000);
  showTwo();
  delay(1000);
  showThree();
  delay(1000);
  showFour();
  delay(1000);
  showFive();
  delay(1000);
  showSix();
  delay(1000);
  showSeven();
  delay(1000);
  showEight();
  delay(1000);
  showNine();
  delay(1000);
  clearAll();
  
  turnOnAndOff(4);
  turnOnAndOff(5);
  turnOnAndOff(2);
  turnOnAndOff(9);
  turnOnAndOff(8);
  turnOnAndOff(7);
  turnOnAndOff(2);
  turnOnAndOff(3);
}

void turnOnAndOff(int n) {
  digitalWrite(n, LOW);    // set the LED off
  delay(200);              // wait for a second
  digitalWrite(n, HIGH);
}

void clearAll() {  
  for (int i = 2; i < 10; i++) {
      digitalWrite(i, HIGH);
  }
}
void showOne() {  
  clearAll();
  digitalWrite(5, LOW);
  digitalWrite(7, LOW);
}

void showTwo() {  
  clearAll();
  digitalWrite(4, LOW);
  digitalWrite(5, LOW);
  digitalWrite(2, LOW);
  digitalWrite(9, LOW);
  digitalWrite(8, LOW);
}

void showThree() {  
  clearAll();
  digitalWrite(4, LOW);
  digitalWrite(5, LOW);
  digitalWrite(2, LOW);
  digitalWrite(7, LOW);
  digitalWrite(8, LOW);
}

void showFour() {  
  clearAll();
  digitalWrite(3, LOW);
  digitalWrite(2, LOW);
  digitalWrite(5, LOW);
  digitalWrite(7, LOW);
}

void showFive() {  
  clearAll();
  digitalWrite(4, LOW);
  digitalWrite(3, LOW);
  digitalWrite(2, LOW);
  digitalWrite(7, LOW);
  digitalWrite(8, LOW);
}

void showSix() {  
  clearAll();
  digitalWrite(4, LOW);
  digitalWrite(3, LOW);
  digitalWrite(9, LOW);
  digitalWrite(8, LOW);
  digitalWrite(7, LOW);
  digitalWrite(2, LOW);
}

void showSeven() {  
  clearAll();
  digitalWrite(4, LOW);
  digitalWrite(5, LOW);
  digitalWrite(7, LOW);
}

void showEight() {  
  clearAll();
  digitalWrite(4, LOW);
  digitalWrite(3, LOW);
  digitalWrite(9, LOW);
  digitalWrite(8, LOW);
  digitalWrite(7, LOW);
  digitalWrite(2, LOW);
  digitalWrite(5, LOW);
}

void showNine() {  
  clearAll();
  digitalWrite(4, LOW);
  digitalWrite(3, LOW);
  digitalWrite(5, LOW);
  digitalWrite(8, LOW);
  digitalWrite(7, LOW);
  digitalWrite(2, LOW);
}
