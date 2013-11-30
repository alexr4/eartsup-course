int sWidth = 800;
int sHeight = 400;

//Limit de frame
int maxFrame = 600;

//Taille Max de la ligne
float maxWidth;

void setup()
{
  size(sWidth, sHeight, P2D);
}

void draw()
{
  background(0);

  if (frameCount <= maxFrame)
  {
    maxWidth = map(frameCount, 0, maxFrame, 0, width);
  }
  else
  {
    noLoop();
  }
  
  stroke(255);
  line(0, height/2, maxWidth, height/2);
  
  println("nombre total de frame : "+frameCount);
  println("FrameRate : "+frameRate);
}

