int sWidth = 700;
int sHeight = sWidth/2;

ArrayList<secondsDial> mySD;
int lastElement;

void setup()
{
  size(sWidth, sHeight, P2D);
  smooth(8);

  mySD = new ArrayList<secondsDial>();
  mySD.add(new secondsDial(50, width/2, height/2));
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
    //println("newElements");
    float newRadius = mySD.get(lastElement).radius+10;
    //println(mySD.get(lastElement).points.size());
    mySD.add(new secondsDial(newRadius, width/2, height/2));
    lastElement = mySD.size()-1;
  }
  
  
  
}

