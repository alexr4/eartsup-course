int sWidth = 700;
int sHeight = sWidth/2;

ArrayList<Rect> rectList;
float res;

PImage cursor;

void setup()
{
  size(sWidth, sHeight, P2D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  
  cursor = loadImage("cursor.png");
  
  rectList = new ArrayList<Rect>();
  res = 20;
  for(int i=0; i<width/res; i++)
  {
    for(int j=0; j<height/res; j++)
    {
      float taille = res-2;
      float marge = taille/2;
      rectList.add(new Rect(marge+i*res, marge+j*res, taille, taille));
    }
  }
  
  captureSetup();
}

void draw()
{
  background(0, 0, 100);
  for(int i=0; i<rectList.size(); i++)
  {
    Rect rect = rectList.get(i);
    
    rect.run();
    
   if(mouseX >= rect.x-rect.w/2 && mouseX <= rect.x+rect.w/2 && mouseY >= rect.y-rect.h/2 && mouseY <= rect.y+rect.h/2)
   {
     rect.updateAngle(true);
   }
  }
  
  
  image(cursor, mouseX, mouseY);
  
  captureRun();
}
