import peasy.*;
PeasyCam cam;


void setup()
{
  size(600, 600, P3D);
  smooth();
  cam = new PeasyCam(this, width/2, height/2, 0, 1500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(2000);

}

void draw()
{
  background(255);
  translate(width/2, height/2);
  
  drawAxis(100);
  
  
  float resAlpha = 10;
  float resBeta = 10;
  float r = 200;
  for(int i = 0; i<180/resAlpha; i++)
  {
    for(int j= 0; j<360/resBeta; j++)
    { 
      float alpha = map(i*resAlpha, 0, 180, 0, PI);
      float beta = map(j*resBeta, 0, 360, 0, TWO_PI);
      
      float inc = map(i, 0, 180/resAlpha, -200, 200);
      
      float x = cos(beta)*cos(alpha)*r;//(r+inc);
      float y = cos(beta)*sin(alpha)*r;//(r+inc);
      float z = sin(beta)*r;//(r+inc);
      /*
      strokeWeight(2);
      stroke(0);
      point(x,y,z);
      */
      fill(0);
      text("a", x, y, z);
    }
    
  }
}

void drawAxis(float l)
{
  pushStyle();
  strokeWeight(1);
  //x-axis
  stroke(255,0,0); 
  line(0,0,0,l,0,0);
  //y-axis
  stroke(0,255,0); 
  line(0,0,0,0,l,0);
  //z-axis
  stroke(0,0,255); 
  line(0,0,0,0,0,l);
  popStyle();
}
