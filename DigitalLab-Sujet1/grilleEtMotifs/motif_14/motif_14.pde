int sWidth = 400;
int sHeight = sWidth*2;

int xA, yA, xB, yB, xC, yC, xD, yD;
float hue;
int Spacing=20;
int colorInc = 20;
int actualRandomSeed = 1000;

void setup()
{
  size(sWidth, sHeight, P2D);

  colorMode(HSB, 360, 100, 100, 100);
}



void draw()
{
  background(0, 0, 100);
  randomSeed(actualRandomSeed);

  for (int gridX = 0; gridX<width/Spacing; gridX ++)
  {
    for (int gridY = 0; gridY<height/Spacing; gridY ++)
    {
      xA = gridX*Spacing;
      yA = gridY*Spacing;

      xB = xA+Spacing;
      yB = yA;

      xC = xA;
      yC = yA+Spacing;

      xD = xA+Spacing;
      yD = yA+Spacing;


      hue = map(yA, 0, height, 180, 230);

      noStroke();

      //ABC
      fill(random(hue-colorInc, hue+colorInc), random(50, 100), random(50, 100), random(20, 100));
      triangle(xA, yA, xB, yB, xC, yC);

      //BCD
      fill(random(hue-colorInc, hue+colorInc), random(50, 100), random(50, 100), random(20, 100));
      triangle(xB, yB, xC, yC, xD, yD);

      //ABD
      fill(random(hue-colorInc, hue+colorInc), random(50, 100), random(50, 100), random(20, 100));
      triangle(xA, yA, xB, yB, xD, yD);

      //ADC
      fill(random(hue-colorInc, hue+colorInc), random(50, 100), random(50, 100), random(20, 100));
      triangle(xA, yA, xD, yD, xC, yC);
    }
  }
}

void mousePressed()
{
  actualRandomSeed = int(random(10000));
}

void keyPressed()
{
  if (key == ' ')
  {
    saveFrame("motif_1_#####.tif");
  }
}

