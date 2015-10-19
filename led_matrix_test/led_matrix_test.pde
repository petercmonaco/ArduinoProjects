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

Sprite s_pacman = Sprite(
  3, 3,
  B111,
  B110,
  B111
);
Sprite s_shark = Sprite(
  7, 5,
  B0000000,
  B0100000,
  B0110000,
  B0111000,
  B1111111
);
Sprite s_all = Sprite(
  8, 8,
  B11111111,
  B11111111,
  B11111111,
  B11111111,
  B11111111,
  B11111111,
  B11111111,
  B11111111
);
Sprite diag = Sprite(
  8, 8,
  B10000000,
  B01000000,
  B00100000,
  B00010000,
  B00001000,
  B00000100,
  B00000010,
  B00000001
);
Sprite border = Sprite(
  7, 5,
  B1111111,
  B1000001,
  B1011101,
  B1000001,
  B1111111
);

void setup()
{ 
}



void loop()
{
  
  myMatrix.write(0,0, s_all);     // place sprite on screen
  delay(1000);                      // wait a little bit
  myMatrix.clear();               // clear the screen for next animation frame 
  
  
  myMatrix.write(0,0, diag);     // place sprite on screen
  delay(1000);                      // wait a little bit
  myMatrix.clear();               // clear the screen for next animation frame
  
  
  myMatrix.write(0,0, border);     // place sprite on screen
  delay(1000);                      // wait a little bit
  myMatrix.clear();               // clear the screen for next animation frame
  
  
  for (int xpos = -3; xpos <= 7; xpos++) {
    myMatrix.write(xpos,0, s_pacman);     // place sprite on screen
    delay(200);                      // wait a little bit
    myMatrix.clear();               // clear the screen for next animation frame
  }
    
  for (int xpos = -7; xpos <= 7; xpos++) {
    myMatrix.write(xpos,0, s_shark);     // place sprite on screen
    delay(200);                      // wait a little bit
    myMatrix.clear();               // clear the screen for next animation frame
  }
  
  
  
  delay(1000);
  
}
