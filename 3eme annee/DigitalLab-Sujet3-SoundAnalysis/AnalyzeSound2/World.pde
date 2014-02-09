class World
{
  //Variables
  //lightl
  ArrayList<PVector> lightPos;
  ArrayList<Float> angleLight;
  float radius;
  float inc;
  boolean showLight, colorState;
  float bgColor, boxColor;
  float h, s, b, alphaC;
  float shineInc;


  //Constructeur
  World(float width_)
  {
    radius = width_;
    inc = 0;
    showLight = false;
    colorState = false;

    lightPos = new ArrayList<PVector>();
    angleLight = new ArrayList<Float>();

    addLight();
  }

  //Methodes
  void run(boolean debug)
  {
    if (debug)
    {
      drawAxis(100);
      showLight = true;
    }
    else
    {
      showLight = false;
    }
    colorBehavior();
    drawWorld();
    drawLight(showLight, 10);
  }

  void drawWorld()
  {
    pushStyle();
   stroke(0, 0, boxColor);
   noFill();
   box(sWidth);
    popStyle();
  }

  void drawAxis(float l)
  {
    pushStyle();
    strokeWeight(1);
    //x-axis
   stroke(255, 0, 0); 
    line(0, 0, 0, l, 0, 0);
    //y-axis
   stroke(0, 255, 0); 
    line(0, 0, 0, 0, l, 0);
    //z-axis
    stroke(0, 0, 255); 
    line(0, 0, 0, 0, 0, l);

    popStyle();
  }

  void colorBehavior()
  {
    if (colorState)
    {
      bgColor = 15;
      boxColor = bgColor+15;
    }
    else
    {
      bgColor = 98;
      boxColor = bgColor-20;
    }
  }



  void addLight()
  {
    float iMax = 4;

    for (int i=0; i<iMax; i++)
    {

      float angle = map(i, 0, iMax, 0, TWO_PI);

      float x0 = radius*cos(angle);
      float y0 = radius*sin(angle);
      float z0 = -inc;
      PVector pos0 = new PVector(x0, y0, z0);

      float x1 = radius*cos(angle);
      float y1 = 0;
      float z1 = radius*sin(angle)-inc;
      PVector pos1 = new PVector(x1, y1, z1);

      lightPos.add(pos0);
      lightPos.add(pos1);

      angleLight.add(angle);
      angleLight.add(angle);

      //println(angleLight);
    }
  }

  void changeColorLight(boolean colorState_, int index)
  {
    if (colorState_)
    {
       s = map(index, 0, lightPos.size()-1, 20, 60);;
       b = map(index, 0, lightPos.size()-1, 20, 100);
      h = map(index, 0, lightPos.size()-1, 180, 270);
      alphaC = 50;
    }
    else
    {
      /*
      s = 65; 
      b = 80;
      h = map(index, 0, lightPos.size()-1, 0, 360/2);
      */
      alphaC = 100;
      switch(index)
      {
      case 0 : 
        h = 20; 
        s=85;
        b=90; 
        break;
      case 1 :
        h = 38; 
        s=83;
        b=99; 
        break;
      case 2 :
        h = 10; 
        s=80;
        b=99; 
        break;
      case 3 :
        h = 3; 
        s=85;
        b=90; 
        break;
      case 4 :
        h = 347; 
        s=72;
        b=99; 
        break;
      case 5 :
        h=199; 
        s=74;
        b=79; 
        break;
      case 6 :
        h=198; 
        s=53;
        b=86;
        break;
      case 7 :
        h=200; 
        s=37;
        b=90; 
        break;
      case 8 :
        h=197; 
        s=23;
        b=92; 
        break;
      }
    }
    
     

  }
  
  void setShineInc(float inc)
  {
    shineInc = inc;
  }

  void drawLight(boolean etat, float t)
  {
    
    lightSpecular(0, 0, shineInc/2);
    specular(0, 0, 20);
    emissive(0, 0, 7);
    shininess(shineInc);

    for (int i=0; i<lightPos.size(); i++)
    {
      PVector v = lightPos.get(i);
      float angle = angleLight.get(i);


      v.setMag(sWidth);

      changeColorLight(colorState, i);
    

      if (etat)
      {
        pushStyle();
        stroke(h, s, b);
        strokeWeight(t);
        point(v.x, v.y, v.z);
        popStyle();
      }
      else
      {
      }
      pointLight(h, 0, 30, v.x, v.y, v.z);
    }
  }
}

