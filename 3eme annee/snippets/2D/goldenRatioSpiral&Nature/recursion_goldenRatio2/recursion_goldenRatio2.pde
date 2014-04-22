int w = 10;
int nbIteration = 500;

PVector a = new PVector(0, height/2);
PVector b = new PVector(w, a.y);
PVector Origine = new PVector(0,0);
float d = 0;

float n, noff, x;
float m, moff, y;

float phi = (1 + sqrt(5)) /2; //edgelength (golden ratio) 

ArrayList<PVector> vec;

//font
PFont didot;


void setup()
{
  size(800, 400, P2D);
  smooth(8);
  colorMode(HSB, 360, 100,100,100);
  vec = new ArrayList<PVector>();
  
  didot = loadFont("didot.vlw");
}

void draw()
{
  translate(width/2, height/2);
  background(0, 0, 20);

  addPoint(new PVector(0, 0), new PVector(sin(random(TWO_PI))*d, cos(random(TWO_PI))*d));
  

  for (int i=0; i<vec.size(); i+=2)
  {
    PVector a = vec.get(i);
    PVector b = vec.get(i+1);
    
    PVector fin = vec.get(vec.size()-1);
    
    float d = PVector.dist(a, new PVector(0,0));
    float d2 = PVector.dist(new PVector(0,0), fin);
    float opacity = map(d, 0, d2, 100, 0);
    float blue = map(d, 0, d2, 180, 230);
    float sw = map(d, 0, d2, 2, 0);
    
    strokeWeight(sw);
    stroke(blue, 100, 100, opacity);
    line(a.x, a.y, b.x, b.y);
  }
  
  textInformations();
}

void addPoint(PVector a_, PVector b_)
{
  if (nbIteration <= 0)
  {
  }
  else
  {
    b = new PVector(sin(d)*d, cos(d)*d);

    vec.add(a);
    vec.add(b);


    b.add(a_);
    //store
    a = b.get();
    
    d+=phi/100;
    
    nbIteration --;
    
    addPoint(a, b);
  }
}

void textInformations()
{
  fill(0,0,20);
  noStroke();
  rectMode(CENTER);
  rect(0, height/2, width, 100);
  
  textAlign(CENTER);
  textFont(didot);
  textSize(14);
  fill(0, 0, 100);
  text("angle += golden ratio/10", 0, height/2-20);
  
  stroke(0,0,100,100);
  strokeWeight(1);
  noFill();
  //line(-60, height/2-40, 60,  height/2-40);
}

void mousePressed()
{
  vec.clear();
  a = new PVector(0,0);
  d = 0;
  phi = (1 + sqrt(5)) /2; //edgelength (golden ratio) 
  b = new PVector(sin(random(TWO_PI))*d, cos(random(TWO_PI))*d);
  nbIteration = int(random(10, 500));
}

void keyPressed()
{
  if(key == ' ')
  {
    saveFrame("goldenRatioTest_####.tif");
  }
}

