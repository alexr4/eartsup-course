int sWidth = 800;
int sHeight = sWidth;

String citation = "Design is a plan for arranging elements in such a way as best to accomplish a particular purpose.";
String auteur = "Charles Eames";
char[] caracteres;
PFont type;

ArrayList<Lettre> lettres;
float boxWidth;
float boxHeight;
float margeBoxHeight;
float margeBoxWidth;
float resX;
float resY;

//scene
float incAngleX, incAngleY, incAngleZ;

void setup()
{
  size(sWidth, sHeight, P3D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  
  type = loadFont("Dekar-20.vlw"); 

  caracteres = citation.toCharArray();

  boxWidth = sWidth/2;
  boxHeight = sHeight/2;
  resX = 40;
  resY = 40;
  margeBoxWidth = boxWidth/2;
  margeBoxHeight = boxHeight/2;

  lettres = new ArrayList<Lettre>();  

  for (int i=0; i<boxHeight/resY; i++)
  {
    for (int j=0; j<boxWidth/resX; j++)
    {
      float margeHorizontale = -width/2+margeBoxWidth+resX/2;
      float margeVerticale = -height/2+margeBoxHeight+resY/2;
      float y = margeVerticale+i*resX;
      float x = margeHorizontale+j*resY;
      float z = 0;

      lettres.add(new Lettre(x, y, z));
    }
  }

  for (int i=0; i<lettres.size(); i++)
  {
    Lettre le = lettres.get(i);

    char lettre = ' ';
    if (i<caracteres.length)
    {
      lettre = caracteres[i];
    }

    le.defineLetter(lettre);
  }
  
}

void draw()
{
  background(0, 0, 100);
  pushMatrix();
  translate(width/2, height/2);
  rotateX(incAngleX);
  rotateY(incAngleY);
  rotateZ(incAngleZ);  

  for (int i=0; i<lettres.size(); i++)
  {
    Lettre le = lettres.get(i);

    le.run();
  }
  popMatrix();
  
   incAngleX += 0.0005;
  incAngleY += 0.0003;
  incAngleZ += 0.0002;
  
  fill(0, 0, 50);
  textAlign(RIGHT, BOTTOM);
  text(auteur, width-10, height-10);
  
}


void keyPressed()
{
  for (int i=0; i<lettres.size(); i++)
  {
    Lettre le = lettres.get(i);

    if(key == le.lettre)
    {
      le.clicked = true;
    }
    else
    {
      le.clicked = false;
    }
  }
}

