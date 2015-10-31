/*
 * Code to drive a time-lapse camera rig.
 * Peter Monaco
 * 10/31/2015
 */

const int KEY_NONE = 0;
const int KEY_Select = 1;
const int KEY_Left = 2;
const int KEY_Up = 3;
const int KEY_Down = 4;
const int KEY_Right = 5;

const int UNITS_Seconds = 1;
const int UNITS_Minutes = 2;
const int UNITS_Hours = 3;

#include <LiquidCrystal.h>
#include <DFR_Key.h>

//Pin assignments for SainSmart LCD Keypad Shield
LiquidCrystal lcd(8, 9, 4, 5, 6, 7); 
//---------------------------------------------

DFR_Key keypad;

boolean goLeft;
                 
void setup() 
{ 
  //Serial.begin(9600);
  lcd.begin(16, 2);
  
  /*
  OPTIONAL
  keypad.setRate(x);
  Sets the sample rate at once every x milliseconds.
  Default: 10ms
  */
  keypad.setRate(10);

}

void loop() 
{
  // Get seconds/minutes/hours per revolution
  int num = collectInt("S/M/H per rev:");
  
  // Determine units (seconds/minutes/hours)
  int units = determineUnits(num);

  // Announce the decision
  lcd.clear();
  lcd.noBlink();
  lcd.setCursor(0, 0);
  lcd.print(num);
  lcd.print(" ");
  lcd.print(unitsToString(units));
  delay(1000);

  
  // Next, choose Left or Right.  Only legal keys are left, right, and select
  chooseLeftOrRight();

  // Announce the decision
  lcd.clear();
  lcd.noBlink();
  lcd.setCursor(0, 0);
  if (goLeft) {
    lcd.print("To the Left!");
  } else {
    lcd.print("To the Right!");
  }
  delay(1000);
}

String unitsToString(int units) {
  if (units == UNITS_Hours) return "Hours";
  if (units == UNITS_Minutes) return "Minutes";
  if (units == UNITS_Seconds) return "Seconds";
  return "BadValue";
}

void chooseLeftOrRight() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Select dir:");
  lcd.setCursor(0, 1);
  lcd.print("Left/Right");
  int cursorX = 0;
  while (1) {
    lcd.setCursor(cursorX, 1);
    lcd.blink();
    int key = nextKeypadKey();
    if (key != KEY_Select) {
      // switch position
      cursorX = 5-cursorX;
    } else {
      // The decision is made!
      goLeft = (cursorX==0);
      return;
    }
  }
}

int determineUnits(int numUnits) {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print(numUnits);
  lcd.print(" what?");
  lcd.setCursor(0, 1);
  lcd.print("Hrs/Min/Sec");
  int cursorX = 0;
  while (1) {
    lcd.setCursor(cursorX, 1);
    lcd.blink();
    int key = nextKeypadKey();
    if (key == KEY_Right) {
      cursorX += 4;
      if (cursorX > 8) cursorX = 0;
    } else if (key == KEY_Left) {
      cursorX -= 4;
      if (cursorX < 0) cursorX = 8;
    } else if (key == KEY_Select) {
      // The decision is made!
      return (cursorX == 0) ? UNITS_Hours : (cursorX == 4) ? UNITS_Minutes : UNITS_Seconds;
    }
  }
}

int collectInt(String prompt) {
  int collectedNumber = 0;
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print(prompt);
  lcd.setCursor(0, 1);
  lcd.print("1234567890 Enter");
  // Valid position of X cursor are 0/1/2/3/4/5/6/7/8/9/11
  // Corresponding to               1/2/3/4/5/6/7/8/9/0/Enter
  int cursorX = 0;
  while (1) {
    lcd.setCursor(cursorX, 1);
    lcd.blink();
    int key = nextKeypadKey();
    if (key == KEY_Left) {
      // Move cursor left. Possible wrap to 'enter'.  Skip the blank space.
      cursorX--;
      if (cursorX < 0) cursorX = 11;
      if (cursorX == 10) cursorX = 9;
    } else if (key == KEY_Right) {
      // Move cursor right.  Skip the blank space.  Wrap if needed.
      cursorX++;
      if (cursorX > 11) cursorX = 0;
      if (cursorX == 10) cursorX = 11;
    } else if (key == KEY_Select) {
      if (cursorX == 11) {
        return collectedNumber;
      } else {
        // User added a digit
        collectedNumber = (collectedNumber * 10) + ((cursorX + 1) % 10);
        lcd.noBlink();
        lcd.setCursor(0, 0);
        lcd.print("                ");
        lcd.setCursor(0, 0);
        lcd.print(collectedNumber);
      }
    }
  }
}


//
// Code for reading and debouncing the keypad
//
int lastKey = 0;
int lastKeyUpTime = millis();
int nextKeypadKey() {
  while (1) {
    // keypad.getKey() grabs the current key.
    // Returns a non-zero integer corresponding to the pressed key, OR
    // Returns 0 for no keys pressed, OR
    // Returns -1 (sample wait) when no key is available to be sampled.
    int currKey = keypad.getKey();
    if (currKey == -1) {
      // There is no key available to be sampled
      continue;
    }
    if (currKey == lastKey) {
      // No change since last time
      continue;
    }

    if (currKey == 0 && lastKey != 0) {
      // Transition from key-down to no-key
      lastKey = 0;
      lastKeyUpTime = millis();
      continue;
    }
    
    // Do some de-bouncing.  Don't allow a key-down sooner than 100ms after key-up
    if (currKey > 0 && lastKey == 0 && ((millis()-lastKeyUpTime) > 100)) {
      // Transition from no-key to a key
      lastKey = currKey;
      return currKey;
    }
  }
}
