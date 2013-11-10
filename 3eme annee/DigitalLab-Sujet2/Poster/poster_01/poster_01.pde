int sWidth = 400;
int sHeight = sWidth*2;
float r, y, x, resRadius, resY, rInc, rOff, xInc, xOff, rGlobal, rgInc, rgOff;

void setup()
{
  size(sWidth, sHeight, P2D);
  colorMode(HSB, 360, 100, 100, 100);
  smooth(4);
  background(0, 0, 80);

  r = 100;
  y = sHeight+100;
  x = sWidth/2;
  resRadius = random(5, 30);
  resY= random(2, 5);
  rInc = 0;
  rOff = random(0.001, 0.005);
  xInc = x;
  xOff = random(0.001, 0.01);
  rGlobal = 0;
  rgInc = rGlobal;
  rgOff = random(0.001, 0.01);
}

void draw()
{
  //background(255);
  
  if (y >= -100)
  {
    y-= resY;
    x = map(noise(xInc), 0, 1, 0, width);
    rGlobal = map(noise(rgInc), 0, 1, 0, 100);
    xInc += xOff;
    rgInc += rgOff;
  }
  
  noFill();
  stroke(0, 0, 0, 50);
  beginShape();
  for (int j=0; j<360/resRadius; j++)
  {
    float angle = radians(j*resRadius);

    r = map(noise(rInc, j), 0, 1, 80, 100);

    float nx = x+cos(angle)*r;//(r-rGlobal);
    float ny = y+sin(angle)*r;//(r-rGlobal);

    vertex(nx, ny);

    rInc += rOff;
  }
  endShape(CLOSE);
}

void mousePressed()
{
  background(0, 0, 80);

  r = 100;
  y = sHeight+100;
  x = sWidth/2;
  resRadius = random(5, 30);
  resY= random(2, 5);
  rInc = 0;
  rOff = random(0.001, 0.005);
  xInc = x;
  xOff = random(0.001, 0.01);
  rGlobal = 0;
  rgInc = rGlobal;
  rgOff = random(0.001, 0.01);

  y = height+100;
}


void keyPressed()
{
  if(key ==' ')
  {
    saveFrame("posterAleatoir_####.tif");
  }
}

