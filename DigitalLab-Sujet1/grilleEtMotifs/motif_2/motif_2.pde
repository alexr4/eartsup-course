int sWidth = 400;
int sHeight = sWidth*2;

int resY = 20;
int resX = 20;

int A, B, C, D;
float x1, y1, x2, y2;

int actRandomSeed = 10000;


void setup()
{
  size(sWidth, sHeight, P2D);
  smooth(8);
  A = int(random(3));
  B = int(3);
  
   C = int(random(3));
  D = int(3);
}

void draw()
{
  randomSeed(actRandomSeed);
  
  background(255);
  
  stroke(0);
  
  
   for (int gridX = 0; gridX<sWidth/resX; gridX++)
  {
    for (int gridY = 0; gridY<sHeight/resY; gridY++)
    {
      float x = gridX*resX;
      float y = gridY*resY;

      if (A == B)
      {
        B = int(random(4));
      }

      switch (A)
      {
      case 0:
        x1 = (gridX*resX)+(resX/2);
        y1 = gridY* resY;
        break;
      case 1:
        x1 = (gridX*resX)+resX;
        y1 = (gridY*resY)+(resY/2);
        break;
      case 2:
        x1 = (gridX*resX)+(resX/2);
        y1 = (gridY*resY)+resY;
        break;
      case 3:
        x1 = (gridX*resX);
        y1 = (gridY*resY)+resY/2;
        break;
      }

      

      switch (B)
      {
      case 0:
        x2 = (gridX*resX)+(resX/2);
        y2 = gridY* resY;
        break;
      case 1:
        x2 = (gridX*resX)+resX;
        y2 = (gridY*resY)+(resY/2);
        break;
      case 2:
        x2 = (gridX*resX)+(resX/2);
        y2 = (gridY*resY)+resY;
        break;
      case 3:
        x2 = (gridX*resX);
        y2 = (gridY*resY)+resY/2;
        break;
      }
      /*
      stroke(127);
      strokeWeight(1);
      noFill();
      rect(x, y, resX, resY);
      */
      strokeWeight(10);
      strokeCap(SQUARE);
     stroke(0, map(y2, 0, height, 255, 0), map(y1, 0, height, 0, 255));
      line(x1, y1, x2, y2);
      
      A = B;
    }
  }
  
  for (int gridX = 0; gridX<sWidth/resX; gridX++)
  {
    for (int gridY = 0; gridY<sHeight/resY; gridY++)
    {
      float x = gridX*resX;
      float y = gridY*resY;

      if (D == C)
      {
        D= int(random(4));
      }

      switch (C)
      {
      case 0:
        x1 = (gridX*resX)+(resX/2);
        y1 = gridY* resY;
        break;
      case 1:
        x1 = (gridX*resX)+resX;
        y1 = (gridY*resY)+(resY/2);
        break;
      case 2:
        x1 = (gridX*resX)+(resX/2);
        y1 = (gridY*resY)+resY;
        break;
      case 3:
        x1 = (gridX*resX);
        y1 = (gridY*resY)+resY/2;
        break;
      }

      

      switch (D)
      {
      case 0:
        x2 = (gridX*resX)+(resX/2);
        y2 = gridY* resY;
        break;
      case 1:
        x2 = (gridX*resX)+resX;
        y2 = (gridY*resY)+(resY/2);
        break;
      case 2:
        x2 = (gridX*resX)+(resX/2);
        y2 = (gridY*resY)+resY;
        break;
      case 3:
        x2 = (gridX*resX);
        y2 = (gridY*resY)+resY/2;
        break;
      }
      /*
      stroke(127);
      strokeWeight(1);
      noFill();
      rect(x, y, resX, resY);
      */
      
      strokeWeight(5);
      strokeCap(ROUND);
      stroke(map(y2, 0, height, 255, 0), 0, map(y1, 0, height, 0, 255));
      line(x1, y1, x2, y2);
      
      C = D;
    }
  }

}

void mousePressed()
{
  actRandomSeed = (int) random(100000);
}

void keyPressed()
{
  if(key == ' ')
  {
    saveFrame("motif_3_#####.tif");
  }
}



