/*
Sainsmart LCD Shield for Arduino
Key Grab v0.2
Written by jacky

www.sainsmart.com

Displays the currently pressed key on the LCD screen.

Key Codes (in left-to-right order):
*/

const int KEY_NO_VALUE = -1;
const int KEY_NONE = 0;
const int KEY_Select = 1;
const int KEY_Left = 2;
const int KEY_Up = 3;
const int KEY_Down = 4;
const int KEY_Right = 5;

#include <LiquidCrystal.h>
#include <DFR_Key.h>

//Pin assignments for SainSmart LCD Keypad Shield
LiquidCrystal lcd(8, 9, 4, 5, 6, 7); 
//---------------------------------------------

DFR_Key keypad;
                 
void setup() 
{ 
  //Serial.begin(9600);
  lcd.begin(16, 2);
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Press a key!");
  
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
  int key = nextKeypadKey();
  
  if (key != KEY_NO_VALUE) {
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Current Key:");
    lcd.setCursor(0, 1);
    if (key == KEY_NONE) {
      lcd.print("(none)");
    } else if (key == KEY_Select) {
      lcd.print("Select");
    } else if (key == KEY_Left) {
      lcd.print("Left");
    } else if (key == KEY_Up) {
      lcd.print("Up");
    } else if (key == KEY_Down) {
      lcd.print("Down");
    } else if (key == KEY_Right) {
      lcd.print("Right");
    }
  }
}


//
// Code for reading and debouncing the keypad
//
int lastKey = 0;
int nextKeypadKey() {
  // keypad.getKey() grabs the current key.
  // Returns a non-zero integer corresponding to the pressed key, OR
  // Returns 0 for no keys pressed, OR
  // Returns -1 (sample wait) when no key is available to be sampled.
  int currKey = keypad.getKey();
  if (currKey == -1) {
    // There is no key available to be sampled
    return KEY_NO_VALUE;
  }
  if (currKey == lastKey) {
    // No change since last time
    return KEY_NO_VALUE;
  }
  
  lastKey = currKey;
  return currKey;
}

