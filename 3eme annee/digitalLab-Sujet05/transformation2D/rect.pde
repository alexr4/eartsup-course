class Rect
{
  //variable
  float x, y, w, h;
  color c;

  float angle, vAngle;

  //constructeur
  Rect(float x_, float y_, float w_, float h_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = color(int(random(100, 200)), int(random(50, 100)), int(random(50, 100)));

    vAngle = 0.4;
  }
  //méthode
  void run()
  {
    display();
  }

  void updateAngle(boolean rollOver)
  {
    if (rollOver)
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
    translate(x, y);
    rotate(angle);

    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, w, h);

    popMatrix();
  }
}

