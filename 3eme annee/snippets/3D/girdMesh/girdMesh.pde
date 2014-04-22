import peasy.*;

PeasyCam cam;

Grid myGrid;


void setup() {
  size(800, 800, P3D);

  cam = new PeasyCam(this, width/2, height/2, 0, 1000);

  myGrid = new Grid(new PVector(0,0,0), 50, 50);
  
}

void draw() {
  background(0);


  myGrid.run();

  showFrameRate(-20, -20, 0, 60);
}


void lightsBehavior()
{
  pointLight(0, 255, 160, 0, 0, 100);
  drawLight(0, 255, 160, 0, 0, 100, 10); 
  
  pointLight(0,160, 255, 50*30, 50*30, 300);
  drawLight(0, 160, 255, 50*30, 50*30, 300, 10);
  
  pointLight(0,0, 100, 50*15, 50*15, 500);
  drawLight(0, 0, 100, 50*15, 50*15, 500, 10);
  
  pointLight(0, 160, 255, width, 0, -1000);
  drawLight(0, 160, 255, width, height, -1000, 10);
}

void drawLight(int r, int v, int b, float x, float y, float z, int t)
{
  pushStyle();
  stroke(r, v, b);
  strokeWeight(t);
  point(x, y, z);
  popStyle();
}

void showFrameRate(float x, float y, float z, float fontSize)
{
  pushStyle();
  fill(255);
  noStroke();
  textSize(fontSize);
  text(frameRate, x, y, z);
  popStyle();
}





