class Pt
{
  PVector loc;
  int idX, idY;
  Grid parent;

  float n, nOff;

  Pt(Grid parent_, PVector _loc, int idX_, int idY_)
  {
    loc = _loc;
    idX = idX_;
    idY = idY_;
    parent = parent_;

    n = loc.z;
    //nOff = 0.005;
    nOff = random(0.001, 0.03); 

    println("cols "+idX+" row: "+idY+" : "+loc);
  }

  void run()
  {
    //display();

    /*loc.z = noise(n);
    loc.z = map(loc.z, 0, 1, 0, 10);

    n += nOff; 
*/
    drawConnection();
  }

  void drawConnection()
  {
    if (idX < parent.cols-1 && idY < parent.rows-1)// && loc.z > 5) add this to use with kinect
    {
      PVector origine = parent.allPts[idX][idY].loc = loc;
      PVector neiRight = parent.allPts[idX+1][idY].loc;
      PVector neiDown = parent.allPts[idX][idY+1].loc;
      PVector neiDiag = parent.allPts[idX+1][idY+1].loc;

      addFace(origine, neiRight, neiDown);
      addFace(neiDown, neiRight, neiDiag);
    }
  }

  void addFace(PVector origine_, PVector neiOne_, PVector neiTwo_)
  {
    vertex(origine_.x, origine_.y, origine_.z);
    vertex(neiOne_.x, neiOne_.y, neiOne_.z);
    vertex(neiTwo_.x, neiTwo_.y, neiTwo_.z);
  }

  void display()
  {
    stroke(0, 255, 0);
    strokeWeight(2);
    noFill();
    point(loc.x, loc.y, loc.z);
  }
}

