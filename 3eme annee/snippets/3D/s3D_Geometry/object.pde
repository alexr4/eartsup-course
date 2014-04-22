class object3D
{
  ArrayList<face> f;
  int nbFace;
  int taille;

  PVector[] vertices = {
    new PVector(-1, -1, 1), 
    new PVector(-1, 1, 1), 
    new PVector(1, 1, 1), 
    new PVector(1, -1, 1), 
    
    new PVector(1, -1, -1), 
    new PVector(1, 1, -1), 
    new PVector(-1, 1, -1), 
    new PVector(-1, -1, -1),
    
    new PVector(1, -1, -1), 
    new PVector(-1, -1, -1), 
    new PVector(-1, -1, 1), 
    new PVector(1, -1, 1), 
   
    new PVector(1, 1, -1), 
    new PVector(1, -1, -1), 
    new PVector(1, -1, 1), 
    new PVector(1, 1, 1), 
   
    new PVector(-1, 1, -1), 
    new PVector(1, 1, -1), 
    new PVector(1, 1, 1), 
    new PVector(-1, 1, 1),
   
    new PVector(-1, -1, -1), 
    new PVector(-1, 1, -1), 
    new PVector(-1, 1, 1), 
    new PVector(-1, -1, 1)
    };

    object3D(int s)
    {
      nbFace = 6;
      taille = s;
      f = new ArrayList<face>();

      for (int j = 0; j<vertices.length; j+=4)
      {
        float x0 = vertices[j].x;
        float y0 = vertices[j].y;
        float z0 = vertices[j].z;
        PVector loc0 = new PVector(x0, y0, z0);
        loc0.mult(taille);

        float x1 = vertices[j+1].x;
        float y1 = vertices[j+1].y;
        float z1 = vertices[j+1].z;
        PVector loc1 = new PVector(x1, y1, z1);
        loc1.mult(taille);

        float x2 = vertices[j+2].x;
        float y2 = vertices[j+2].y;
        float z2 = vertices[j+2].z;
        PVector loc2 = new PVector(x2, y2, z2);
        loc2.mult(taille);

        float x3 = vertices[j+3].x;
        float y3 = vertices[j+3].y;
        float z3 = vertices[j+3].z;
        PVector loc3 = new PVector(x3, y3, z3);
        loc3.mult(taille);

        f.add( new face(loc0, loc1, loc2, loc3, j, j+1, j+2, j+3));
       
      }
      
      //debug
      println("nombre de faces : "+f.size());
      for(int i=0; i<f.size(); i++)
      {        
       println("Nombre de sommet sur la Face n°"+i+" : "+f.get(i).pts.size());
      }
    }

  void draw3D()
  {
    beginShape(QUADS);

    //noStroke();
    for (int i=0; i<f.size(); i++)
    {
      for (int j=0; j<f.get(i).pts.size(); j++)
      {
        PVector loc = f.get(i).pts.get(j).location.get();

        float r = map(loc.x, 0, taille, 0, 255);
        float g = map(loc.y, 0, taille, 0, 255);
        float b = map(loc.z, 0, taille, 0, 255);

        fill(r, g, b);
        vertex(loc.x, loc.y, loc.z);
      }
    }
    endShape(CLOSE);
  }

  void debug()
  {
    for (int i=0; i<f.size(); i++)
    {
      for (int j=0; j<f.get(i).pts.size(); j++)
      {
        PVector loc = f.get(i).pts.get(j).location.get();
        loc.sub(new PVector(0,0,0));
        loc.normalize();
        loc.mult(taille*2);

        pushMatrix();
        translate(loc.x, loc.y, loc.z);
        rotateY(radians(-mouseX));
        rotateX(radians(-mouseY));
        fill(0);
        noStroke();
        textSize(20);
        textAlign(CENTER);
        text(f.get(i).pts.get(j).index, 0, 0, 0);
        popMatrix();
      }
    }
  }
}

