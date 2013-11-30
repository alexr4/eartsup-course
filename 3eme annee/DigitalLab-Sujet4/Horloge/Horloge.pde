int sWidth = 800;
int sHeight = sWidth/2;

ArrayList<secondsDial> mySD;
int lastElement;

void setup()
{
  size(sWidth, sHeight, P2D);
  smooth(8);

  mySD = new ArrayList<secondsDial>();
  mySD.add(new secondsDial(50));
}

void draw()
{
  background(255);
  
 
  for (int i =0; i < mySD.size(); i++)
  {
    secondsDial sd = mySD.get(i);
    sd.run();
    
  }
  
  
  if(mySD.get(lastElement).cycle())
  {
    println("newElements");
    float newRadius = mySD.get(lastElement).radius+10;
    mySD.add(new secondsDial(newRadius));
    lastElement = mySD.size()-1;
  }
  
  
  
}

