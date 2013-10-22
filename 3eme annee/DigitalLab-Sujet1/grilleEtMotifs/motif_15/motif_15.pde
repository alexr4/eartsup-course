int m=1;
int XPos=0;
int YPos=0;
int sWidth = 400;
int sHeight = sWidth*2;
int Spacing=20;
int colorInc = 20;
int actualRandomSeed = 1000;

float cOff;

float increment = 0.01;
float cOff3 = 0.0;  
float increment2 = 0.02; 

void setup()
{
  size(sWidth, sHeight, P2D);
  smooth(8);

  colorMode(HSB, 360, 100, 100, 100);
}



void draw()
{
  //randomSeed(actualRandomSeed);

  float cOff = 0.0; // Start xoff at 0

  for (int gridX = 0; gridX<width/Spacing; gridX ++)
  {
    cOff += increment;   
    float cOff2 = 0.0;   
    for (int gridY = 0; gridY<height/Spacing; gridY ++)
    {
       cOff2 += increment;
       
       float inc = noise(cOff,cOff2,cOff3);
       float inc2 = noise(cOff2,cOff,cOff3);
       float inc3 = noise(cOff3,cOff2,cOff);
       
       inc = map(inc, 0, 1, 130, 250);
       inc2 = map(inc, 0, 1, 0, 130);
       inc3 = map(inc, 0, 1, 250, 360);
       
       float alpha1 = noise(cOff)*100;
       float alpha2 = noise(cOff2)*100;
       float alpha3 = noise(cOff3)*100;
      
      XPos = gridX*Spacing;
      YPos = gridY*Spacing;

      float hue =  map(YPos, 0, height, 180, 230);

      noStroke();

      fill(inc2, 100, 100, alpha1);
      triangle(XPos, YPos, XPos, YPos+Spacing, XPos+Spacing, YPos+Spacing); //ACD

      fill(inc3, 100, 100, alpha2);
      triangle(XPos, YPos, XPos+Spacing, YPos, XPos+Spacing, YPos+Spacing); //ABD

      fill(inc, 100, 100, alpha3);
      triangle(XPos, YPos+Spacing, XPos+Spacing, YPos+Spacing, XPos+Spacing, YPos);//BCD

      //fill(inc, 100, 100, 50); //random(hue-colorInc, hue+colorInc)+
      //
      
      triangle(XPos, YPos, XPos+Spacing, YPos, XPos, YPos+Spacing);//ABC
    }
  }
  
  cOff3 += increment2; // Increment zoff
}

void mousePressed()
{
  actualRandomSeed = int(random(10000));
}

void keyPressed()
{
  if(key == ' ')
  {
    saveFrame("motif_1_#####.tif");
  }
}


