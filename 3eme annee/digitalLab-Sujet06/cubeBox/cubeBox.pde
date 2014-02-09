int sWidth = 700;
int sHeight = sWidth/2;

ArrayList<Cube> cubeList;
float res;


float angleX, angleY, angleZ;

//timer
Timer monTimer;
int tempsTimer;
int cubeToRotate;

void setup()
{
  size(sWidth, sHeight, P3D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  

  cubeList = new ArrayList<Cube>();
  res = 100;
  for (int i=0; i<width/res; i++)
  {
    for (int j=0; j<height/res; j++)
    {
      for (int k=0; k<400/res; k++)
      {
        float taille = res-2;
        float marge = taille/2;
        
        float departX = (width/2)*-1;
        float departY = (height/2)*-1;
        float departZ = 100;
        
        cubeList.add(new Cube(departX+marge+i*res, departY+marge+j*res, (departZ+marge+k*res)*-1, taille, taille, taille));
      }
    }
  }
  
  
   tempsTimer = int(random(1, 3)*1000);
  monTimer = new Timer(tempsTimer);
  cubeToRotate = int(random(cubeList.size()-1));
  monTimer.start();
}

void draw()
{
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);
  
  background(0, 0, 100);
  for (int i=0; i<cubeList.size(); i++)
  {
    Cube cube = cubeList.get(i);

    cube.run();
  }
  popMatrix();
  
  println(cubeList.size());

  angleX += 0.001;
  angleY += 0.001;
  angleZ += 0.001;
  
  
  if(monTimer.isFinished())
  {
    
    cubeList.get(cubeToRotate).updateAngle(false);
    chooseCube();
    monTimer.reset();
    monTimer.start();
  }
  else
  {
    cubeList.get(cubeToRotate).updateAngle(true);
  }
}

void chooseCube()
{
  cubeToRotate = int(random(cubeList.size()-1));
}

