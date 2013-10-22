int sWidth = 300;
int sHeight = sWidth*2;

int resY = 20;
int resX = 50;

int A, B;
float x1, y1, x2, y2;

int actRandomSeed = 10000;


void setup()
{
  size(sWidth, sHeight, P2D);
  smooth(8);
}

void draw()
{
  randomSeed(actRandomSeed);
  background(255);
  stroke(0);
  for (int gridY = 0; gridY<sHeight/resY+resY; gridY++)
  {
    for (int gridX = 0; gridX<sWidth/resX+resX; gridX++)
    {
      float x = gridX*resX;;
      float y = gridY*resY;
      
      int pattern = gridY%2;
      
      if(pattern == 0)
      {
        x = gridX*resX;
      }
      else
      {
        x = gridX*resX+resX/2;
      }
      for(int k=0; k<5; k++)
      {
        float b = map(k, 0, 4, 255, 0);
        float v = map(y, 0, sHeight, 255, 0);
        fill(0,v,b);
        stroke(0);
        ellipse(x, y, resX-(k*10), resX-(k*10));
      }
      
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



