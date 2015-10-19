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
Sprite letterB = Sprite(
  6, 7,
  B111100,
  B100010,
  B100010,
  B111100,
  B100010,
  B100010,
  B111100
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
Sprite letterD = Sprite(
  6, 7,
  B111000,
  B100100,
  B100010,
  B100010,
  B100010,
  B100100,
  B111000
);
Sprite letterE = Sprite(
  6, 7,
  B111111,
  B100000,
  B100000,
  B111111,
  B100000,
  B100000,
  B111111
);
Sprite letterF = Sprite(
  6, 7,
  B111111,
  B100000,
  B100000,
  B111110,
  B100000,
  B100000,
  B100000
);
Sprite letterG = Sprite(
  6, 7,
  B111110,
  B100001,
  B100000,
  B100000,
  B100111,
  B100001,
  B111110
);
Sprite letterH = Sprite(
  6, 7,
  B100001,
  B100001,
  B100001,
  B111111,
  B100001,
  B100001,
  B100001
);
Sprite letterI = Sprite(
  6, 7,
  B111111,
  B001000,
  B001000,
  B001000,
  B001000,
  B001000,
  B111111
);
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
Sprite letterL = Sprite(
  6, 7,
  B100000,
  B100000,
  B100000,
  B100000,
  B100000,
  B100000,
  B111111
);
Sprite letterM = Sprite(
  6, 7,
  B100001,
  B110011,
  B101101,
  B100001,
  B100001,
  B100001,
  B100001
);
Sprite letterN = Sprite(
  6, 7,
  B100001,
  B110001,
  B101001,
  B100101,
  B100011,
  B100001,
  B100001
);
Sprite letterO = Sprite(
  6, 7,
  B011110,
  B100001,
  B100001,
  B100001,
  B100001,
  B100001,
  B011110
);
Sprite letterP = Sprite(
  6, 7,
  B111110,
  B100001,
  B100001,
  B111110,
  B100000,
  B100000,
  B100000
);
Sprite letterQ = Sprite(
  6, 7,
  B011110,
  B100001,
  B100001,
  B100001,
  B100101,
  B011110,
  B000001
);
Sprite letterR = Sprite(
  6, 7,
  B111110,
  B100001,
  B100001,
  B111110,
  B100100,
  B100010,
  B100001
);
Sprite letterS = Sprite(
  6, 7,
  B011110,
  B100001,
  B100000,
  B011110,
  B000001,
  B100001,
  B011110
);
Sprite letterT = Sprite(
  6, 7,
  B111111,
  B000100,
  B000100,
  B000100,
  B000100,
  B000100,
  B000100
);
Sprite letterU = Sprite(
  6, 7,
  B100001,
  B100001,
  B100001,
  B100001,
  B100001,
  B100001,
  B011110
);
Sprite letterV = Sprite(
  6, 7,
  B100001,
  B100001,
  B100001,
  B100001,
  B010010,
  B010010,
  B001100
);
Sprite letterW = Sprite(
  6, 7,
  B100001,
  B100001,
  B100001,
  B100001,
  B101101,
  B110011,
  B100001
);
Sprite letterX = Sprite(
  6, 7,
  B100001,
  B100001,
  B010010,
  B001100,
  B010010,
  B100001,
  B100001
);
Sprite letterY = Sprite(
  6, 7,
  B100001,
  B100001,
  B010010,
  B001100,
  B001000,
  B001000,
  B001000
);
Sprite letterZ = Sprite(
  6, 7,
  B111111,
  B000001,
  B000010,
  B000100,
  B001000,
  B010000,
  B111111
);
Sprite letterSpace = Sprite(
  6, 7,
  B000000,
  B000000,
  B000000,
  B000000,
  B000000,
  B000000,
  B000000
);
Sprite letterexclaimationpoint = Sprite(
  4, 7,
  B0110,
  B0110,
  B0110,
  B0110,
  B0000,
  B0110,
  B0110
);
Sprite lettersmile = Sprite(
  7, 7,
  B0100010,
  B0100010,
  B0000000,
  B0001000,
  B1000001,
  B0111110,
  B0000000
);
Sprite allLetters[26] = {
  letterA,
  letterB,
  letterC,
  letterD,
  letterE,
  letterF,
  letterG,
  letterH,
  letterI,
  letterJ,
  letterK,
  letterL,
  letterM,
  letterN,
  letterO,
  letterP,
  letterQ,
  letterR,
  letterS,
  letterT,
  letterU,
  letterV,
  letterW,
  letterX,
  letterY,
  letterZ
};

void setup()
{ 
}

int x = 0;
String message= "  arduino rocks!!! ";
int pointer = 0;
Sprite leftSprite = SpriteForLetterAt(pointer);
Sprite rightSprite = SpriteForLetterAt(pointer+1);


void loop()
{
  myMatrix.write(x, 1, leftSprite);     // place sprite on screen
  myMatrix.write(x + 7, 1, rightSprite); // place sprite again, elsewhere on screen
  delay(125);                      // wait a little bit
  myMatrix.clear();               // clear the screen for next animation frame
  x--;                            // advance x coordinate to the right
  if(x == -7)                      // if reached end of animation sequence
  {
    x = 0;                        // start from beginning
    
    pointer++;
    leftSprite = SpriteForLetterAt(pointer);
    rightSprite = SpriteForLetterAt(pointer+1);
    
  }
}

Sprite SpriteForLetterAt(int i) {
  i = i % message.length();
  return SpriteForLetter(message[i]);
}

Sprite SpriteForLetter(char theChar) {
    if (theChar == ' ') {
      return letterSpace;
    } 
    if (theChar == '!') {
      return letterexclaimationpoint;
    }
     if (theChar == '*') {
      return lettersmile;
    }
    int index = theChar - 'a';
    return allLetters[index];
}
