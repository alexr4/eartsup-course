
class Cube
{
  //variable
  float x, y, z, w, h, d;
  color c;
 
  float angle, vAngle;
 
  //constructeur
  Cube(float x_, float y_, float z_, float w_, float h_, float d_)
  {
    x = x_;
    y = y_;
    z = z_;
    w = w_;
    h = h_;
    d = d_;
    c = color(int(random(100, 200)), int(random(50, 100)), int(random(50, 100)));
 
    vAngle = 0.05;
  }
  //méthode
  void run()
  {
    display();
  }
 
  void updateAngle(boolean etat)
  {
    if (etat)
    {
      angle += vAngle;
    }
    else
    {
    }
  }
 
  void display()
  {
    pushMatrix();
    translate(x, y, z);
    rotateX(angle);
    rotateY(angle);
    rotateZ(angle);
 
   fill(c, 5);
   stroke(c, 50);
    box(w, h, d);
 
    popMatrix();
  }
}
