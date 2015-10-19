#include <Sprite.h>
#include <Matrix.h>

// Sprite Animation
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates the use of the Matrix & Sprite libraries
// Displays animated waveform graphic on screen

// Created 29 March 2006

/* create a new Matrix instance
   pin 0: data  (din)
   pin 1: load  (load)
   pin 2: clock (clk)
*/
Matrix myMatrix = Matrix(12, 10, 11);

/* create a new Sprite instance
   8 pixels wide, 4 pixels tall
*/
Sprite letterJ = Sprite(
  6, 7,
  B111111,
  B000100,
  B000100,
  B100100,
  B100100,
  B100100,
  B011000
);
Sprite letterA = Sprite(
  6, 7,
  B001100,
  B010010,
  B100001,
  B111111,
  B100001,
  B100001,
  B100001
);
Sprite letterC = Sprite(
  6, 7,
  B011110,
  B100001,
  B100000,
  B100000,
  B100000,
  B100001,
  B011110
);
Sprite letterK = Sprite(
  6, 7,
  B100010,
  B100100,
  B101000,
  B110000,
  B101000,
  B100100,
  B100010
);

void setup()
{ 
}

int x = 0;
Sprite leftSprite = letterJ;
Sprite rightSprite = letterA;
int state = 0;

void loop()
{
  myMatrix.write(x, 1, leftSprite);     // place sprite on screen
  myMatrix.write(x + 8, 1, rightSprite); // place sprite again, elsewhere on screen
  delay(125);                      // wait a little bit
  myMatrix.clear();               // clear the screen for next animation frame
  if(x == -8)                      // if reached end of animation sequence
  {
    x = 0;                        // start from beginning
    if (state == 0) {
       leftSprite = letterA;
       rightSprite = letterC;
      state = 1;
    } else if (state == 1) {
       leftSprite = letterC;
       rightSprite = letterK;
      state = 2;
    } else if (state == 2) {
       leftSprite = letterK;
       rightSprite = letterJ;
      state = 3;
    } else if (state == 3) {
       leftSprite = letterJ;
       rightSprite = letterA;
      state = 0;
    }
  }
  x--;                            // advance x coordinate to the right
}

