int sWidth = 400;
int sHeight = sWidth*2;

int resY = 5;
int resX = 5;

int A, B;
float x1, y1, x2, y2;

int actRandomSeed = 10000;


void setup()
{
  size(sWidth, sHeight, P2D);
  smooth(8);
  int A = int(random(4));
}

void draw()
{
  randomSeed(actRandomSeed);
  background(255);
  stroke(0);
  for (int gridY = 0; gridY<sHeight/resY; gridY++)
  {
    for (int gridX = 0; gridX<sWidth/resX; gridX++)
    {
      float x = gridX*resX;
      float y = gridY*resY;

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

      int B = (int)random(4);
      
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
      
     
      stroke(0, map(y2, 0, height, 255, 0), map(y1, 0, height, 0, 255));
      line(x1, y1, x2, y2);
      
       A = B;
       
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
    saveFrame("motif_1_#####.tif");
  }
}


