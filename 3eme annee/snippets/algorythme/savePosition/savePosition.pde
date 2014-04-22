int w = 10;
int nbIteration = 800;

PVector a = new PVector(0, height/2);
PVector b = new PVector(w, a.y);

float n, noff, x;
float m, moff, y;


ArrayList<PVector> vec;


void setup()
{
  size(800, 400);
  vec = new ArrayList<PVector>();
   for(int i=0; i<nbIteration; i++)
  {
    b = new PVector(random(-w, w), random(-w, w));
    vec.add(a);
    vec.add(b);

    addPoint(a, b);
    
    //println(vec);
  }
}

void draw()
{
  translate(width/2, height/2);
  background(255);
  for(int i=0; i<vec.size(); i+=2)
  {
    PVector a = vec.get(i);
    PVector b = vec.get(i+1);
    
    line(a.x, a.y, b.x, b.y);
    
  }
 
}

void addPoint(PVector a_, PVector b_)
{
  b.add(a_);
  
  //store
  a = b.get();
}

void mousePressed()
{
  vec.clear();
  a = new PVector(0, 0);
  for(int i=0; i<nbIteration; i++)
  {
    b = new PVector(random(-w, w), random(-w, w));
    vec.add(a);
    vec.add(b);

    addPoint(a, b);
    
    //println(vec);
  }
}
