/**
 ported to Processing 1.5.1 and GLGraphics 1.0.0 by Amnon Owed (20/01/2013)
 update by Alexandre Rivaux - Bonjour, interactive Lab (in order to drawing icosahedron without GLModel, show Normals, and using radius variable instead of scale method);
 
 from code by Gabor Papp (13/03/2010): http://git.savannah.gnu.org/cgit/fluxus.git/tree/libfluxus/src/GraphicsUtils.cpp
 based on explanation by Paul Bourke (01/12/1993): http://paulbourke.net/geometry/platonic
 using vertex/face list by Craig Reynolds: http://paulbourke.net/geometry/platonic/icosahedron.vf
 
 find out more about geodesic dome : http://en.wikipedia.org/wiki/Geodesic_dome
 
 For information, from Paul Bourke's explanation :
 
 Icosahedron - made of 20 equilateral triangles
 Sommet/Vertices: 12
 Bords/Edges: 30
 Faces/Faces: 20
 Bords par face/Edges per face: 3
 Bords apr sommet / Edges per vertex: 5
 Sine of angle at edge: 2 / 3
 Aire / Surface area: 5 * sqrt(3) * edgelength^2
 Volume: 5 * (3 + sqrt(5)) / 12 * edgelength^3
 Rayon Circonscrit / Circumscribed radius: sqrt(10 + 2 * sqrt(5)) / 4 * edgelength
 Rayon inscrit / Inscribed radius: sqrt(42 + 18 * sqrt(5)) / 12 * edgelength
 */


class Icosahedron {
  ArrayList <PVector> positions; //Array of each vertex of the icosahedron 
  ArrayList <PVector> normals; //Array of each normal of the faces
  ArrayList <PVector> texCoords; //Array of each texture coordinates
  //The following list are used for drawing the icosahedron
  PVector[] uniqueVertices; //Array of each unique vertices. Icosahedron is made of triangle (face) and each vertice has 5 Edges. So some vertices share the some positions.  
  PVector[] uniqueNormals; //Array of each unique normal. Icosahedron is made of triangle (face) and each face has 3 normals. Each face share vertices with the some position, so some normals has the same position.

  float sqrt5 = sqrt(5); // square Root of 5 - Use for calcule phi (golden ratio)
  float phi = (1 + sqrt5) /2; //edgelength (golden ratio) 
  float ratio = sqrt(10 + (2 * sqrt5)) / (4 * phi); //Circumscribed radius  
  float a = (1 / ratio) * 0.5; //distance between center and point a
  float b = (1 / ratio) / (2 * phi); //distance between center and point b


  float r;//Radius of the geodesic sphere
  int level;//Number of Subdivision
  int makeFaceTotal;//Number of Faces


  //List of all the Vertices of our icosahedron. Remember our 12 Vertex from the Paul Bourke explanation ?
  //Here we need to create an icosahedron with value of 1 it volume == 1
  PVector[] vertices = {
    new PVector( 0, b, -a), 
    new PVector( b, a, 0), 
    new PVector(-b, a, 0), 
    new PVector( 0, b, a), 
    new PVector( 0, -b, a), 
    new PVector(-a, 0, b), 
    new PVector( 0, -b, -a), 
    new PVector( a, 0, -b), 
    new PVector( a, 0, b), 
    new PVector(-a, 0, -b), 
    new PVector( b, -a, 0), 
    new PVector(-b, -a, 0)
    };

    //Vertex/ Face liste (Coordinate matrix) by Craig Reynolds (Remember?)
  int[] indices = { 
    0, 1, 2, 3, 2, 1, 
    3, 4, 5, 3, 8, 4, 
    0, 6, 7, 0, 9, 6, 
    4, 10, 11, 6, 11, 10, 
    2, 5, 9, 11, 9, 5, 
    1, 7, 8, 10, 8, 7, 
    3, 5, 2, 3, 1, 8, 
    0, 2, 9, 0, 7, 1, 
    6, 9, 11, 6, 10, 7, 
    4, 11, 5, 4, 8, 10
  };

  //-----Constructor------
  Icosahedron(int level_, float r_) {

    r= r_;
    level = level_;
    positions = new ArrayList <PVector> ();
    normals = new ArrayList <PVector> ();
    texCoords = new ArrayList <PVector> ();
    makeFaceTotal =0;


    //Create eache 12 face of our icosahedron depending on the subdivision (12*level)
    for (int i=0; i<indices.length; i += 3) 
    {
      makeIcosphereFace(vertices[indices[i]], vertices[indices[i+1]], vertices[indices[i+2]], level);
    }

    //single vertices computation
    uniqueVertices = positions.toArray(new PVector[0]);
    Set<PVector> set1 = new HashSet<PVector>();
    Collections.addAll(set1, uniqueVertices);
    uniqueVertices = set1.toArray(new PVector[0]);

    //single normals computation
    uniqueNormals = normals.toArray(new PVector[0]);
    Set<PVector> set2 = new HashSet<PVector>();
    Collections.addAll(set2, uniqueNormals);
    uniqueNormals = set2.toArray(new PVector[0]);

    //Debug
    println("frequency : "+level);
    println("number of vecteurs : "+positions.size());
    println("number of vecteurs unique : "+uniqueVertices.length);
    println("number of faces "+makeFaceTotal);
  }

  //Create the face of the Icosphere
  void makeIcosphereFace(PVector a, PVector b, PVector c, int level) 
  {
    PVector origine = new PVector(0, 0, 0);
    PVector a_ = a.get();
    PVector b_ = b.get();
    PVector c_ = c.get();

    

    if (level <= 1) {//Create on icosahedron (on subdivision)
    a_.sub(origine); //substract a to o
    a_.normalize(); //normalize
    a_.mult(r); //multiply by radius

    b_.sub(origine); //substract a to o
    b_.normalize(); //normalize
    b_.mult(r); //multiply by radius

    c_.sub(origine); //substract a to o
    c_.normalize(); //normalize
    c_.mult(r); //multiply by radius

      // cartesian to spherical coordinates http://fr.wikipedia.org/wiki/Coordonn%C3%A9es_sph%C3%A9riques
      //each new vector is calculate depending on each plan wher it take place. In order to find 2D coordinate we use atan and cos in order to calculate each angle in radian
      //Remember, the coordinate of a point on a circle can be define by le radius and the angle for the origine.
      PVector ta = new PVector(atan2(a_.z, a_.x) / TWO_PI + 0.5, acos(a_.y) / PI);
      PVector tb = new PVector(atan2(b_.z, b_.x) / TWO_PI + 0.5, acos(b_.y) / PI);
      PVector tc = new PVector(atan2(c_.z, c_.x) / TWO_PI + 0.5, acos(c_.y) / PI);

      //Texture Coordinate & warping
      // texture wrapping coordinate limits
      float mint = 0.25;
      float maxt = 1 - mint;

      // fix north and south pole textures
      if ((a_.x == 0) && ((a_.y == 1) || (a_.y == -1))) {
        ta.x = (tb.x + tc.x) / 2;
        if (((tc.x < mint) && (tb.x > maxt)) || ((tb.x < mint) && (tc.x > maxt))) { 
          ta.x += 0.5;
        }
      } 
      else if ((b_.x == 0) && ((b_.y == 1) || (b_.y == -1))) {
        tb.x = (ta.x + tc.x) / 2;
        if (((tc.x < mint) && (ta.x > maxt)) || ((ta.x < mint) && (tc.x > maxt))) { 
          tb.x += 0.5;
        }
      } 
      else if ((c_.x == 0) && ((c_.y == 1) || (c_.y == -1))) {
        tc.x = (ta.x + tb.x) / 2;
        if (((ta.x < mint) && (tb.x > maxt)) || ((tb.x < mint) && (ta.x > maxt))) { 
          tc.x += 0.5;
        }
      }

      // fix texture wrapping
      if ((ta.x < mint) && (tc.x > maxt)) {
        if (tb.x < mint) { 
          tc.x -= 1;
        } 
        else { 
          ta.x += 1;
        }
      } 
      else if ((ta.x < mint) && (tb.x > maxt)) {
        if (tc.x < mint) { 
          tb.x -= 1;
        } 
        else { 
          ta.x += 1;
        }
      } 
      else if ((tc.x < mint) && (tb.x > maxt)) {
        if (ta.x < mint) { 
          tb.x -= 1;
        } 
        else { 
          tc.x += 1;
        }
      } 
      else if ((ta.x > maxt) && (tc.x < mint)) {
        if (tb.x < mint) { 
          ta.x -= 1;
        } 
        else { 
          tc.x += 1;
        }
      } 
      else if ((ta.x > maxt) && (tb.x < mint)) {
        if (tc.x < mint) { 
          ta.x -= 1;
        } 
        else { 
          tb.x += 1;
        }
      } 
      else if ((tc.x > maxt) && (tb.x < mint)) {
        if (ta.x < mint) { 
          tc.x -= 1;
        } 
        else { 
          tb.x += 1;
        }
      }

      //add each 3 vertex of the face to our arrayList in order to stock position, normal and texture coordinate
      addVertex(a_, a_, ta);
      addVertex(c_, c_, tc);
      addVertex(b_, b_, tb);

      //count face
      makeFaceTotal++;
    } 
    else { // level > 1

      //find the point between each vertex of the icosahedron we want to subdivide
      PVector ab = midpointOnSphere(a_, b_);
      PVector bc = midpointOnSphere(b_, c_);
      PVector ca = midpointOnSphere(c_, a_);

      level--; //decrease subdivison for loop and create the new faces
      makeIcosphereFace(a, ab, ca, level);
      makeIcosphereFace(ab, b, bc, level);
      makeIcosphereFace(ca, bc, c, level);
      makeIcosphereFace(ab, bc, ca, level);
    }
  }

  //Add vertex, normal, 
  void addVertex(PVector p, PVector n, PVector t) {
    positions.add(p);
    normals.add(n);
    t.mult(-1); //invert texture Coordinate in order to place the image in the upside down
    texCoords.add(t);
  }

  PVector midpointOnSphere(PVector a, PVector b) {
    PVector midpoint = PVector.add(a, b);
    midpoint.mult(0.5);
    midpoint.normalize();
    return midpoint;
  }

  void displayNormals(PVector o)
  {
    for (int i=0; i<uniqueNormals.length; i++)
    {
      PVector normalTemp = uniqueNormals[i].get();
      normalTemp.sub(o); // j'ajoute l'inverse du vecteur center (soustraction)
      normalTemp.normalize(); // normaliser le vecteur à 1
      normalTemp.mult(r);


      PVector normalDir = normalTemp.get();
      normalDir.mult(1.05);
      
      beginShape(LINES);
      stroke(255, 0, 255);
      vertex(normalTemp.x, normalTemp.y, normalTemp.z);
      stroke(0, 255, 255);
      vertex(normalDir.x, normalDir.y, normalDir.z);
      endShape(CLOSE);
    }
  }

  void displayFace()
  { 
    for (int i=0; i<positions.size(); i += 3) {
      PVector a_ = positions.get(i).get();
      PVector b_ = positions.get(i+1).get();
      PVector c_ = positions.get(i+2).get();
      PVector origine = new PVector(0, 0, 0);

      a_.sub(origine); //substract a to o
      a_.normalize(); //normalize
      a_.mult(r); //multiply by radius

      b_.sub(origine); //substract a to o
      b_.normalize(); //normalize
      b_.mult(r); //multiply by radius

      c_.sub(origine); //substract a to o
      c_.normalize(); //normalize
      c_.mult(r); //multiply by radius




      float limiteB = -r;
      float limiteH = r;

      float h = map(a_.x, limiteB, limiteH, 130, 230);
      float s = map(a_.y, limiteB, limiteH, 50, 100);
      float b = map(a_.z, limiteB, limiteH, 50, 100);


      if (wireframe)
      {
        noFill();
        stroke(h, s, b);
      }
      else
      {
        noStroke();
        fill(h, s, b, 100);
      }

      beginShape();
      vertex(a_.x, a_.y, a_.z);
      vertex(b_.x, b_.y, b_.z);
      vertex(c_.x, c_.y, c_.z);
      endShape();
    }
  }

  void showVertices(float angleY)
  {
    for (int i=0; i< uniqueVertices.length; i++)
    {
      PVector s = uniqueVertices[i].get();
      PVector o = new PVector(0, 0, 0);

      s.sub(o); // j'ajoute l'inverse du vecteur center (soustraction)
      s.normalize(); // normaliser le vecteur à 1
      s.mult(r*1.1);

      pushMatrix();
      translate(s.x, s.y, s.z);
      rotateY(angleY);
      fill(255);
      textAlign(CENTER);
      text(i, 0, 0);
      popMatrix();
    }
  }
}

