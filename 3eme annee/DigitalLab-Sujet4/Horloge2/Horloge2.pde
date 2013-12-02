import peasy.*;

PeasyCam cam;

int sWidth = 800;
int sHeight = sWidth/2;

ArrayList<secondsDial> mySD;
int lastElement;

void setup()
{
  size(sWidth, sHeight, P3D);
  smooth(8);

  mySD = new ArrayList<secondsDial>();
  mySD.add(new secondsDial(60, 0));
  
  cam = new PeasyCam(this, 200);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw()
{
  background(0);
  
 
  for (int i =0; i < mySD.size(); i++)
  {
    secondsDial sd = mySD.get(i);
    sd.run();
    
  }
  
  
  if(mySD.get(lastElement).cycle())
  {
    println("newElements");
    float newRadius = mySD.get(lastElement).radius+10;
    float z = mySD.get(lastElement).z+10;
    mySD.add(new secondsDial(newRadius, 0));
    lastElement = mySD.size()-1;
  }
  
  
  
}

