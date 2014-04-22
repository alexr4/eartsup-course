/**
backface culling taken from http://wiki.processing.org/index.php?title=Backface_culling
@author John Gilbertson
*/
 
/** the Vector3f class, used to store a 3-dimensional vector */
class Vector3f {
  float x,y,z;
  Vector3f(float _x, float _y, float _z) {
    x=_x;
    y=_y;
    z=_z;
  }
}
 
/** calculates the dot product of two Vectors */
float dot(Vector3f a, Vector3f b) {
  return(a.x*b.x + a.y*b.y + a.z*b.z);
}
 
/** calculates the cross product of two Vectors */
Vector3f cross(Vector3f a, Vector3f b) {
  return new Vector3f(a.y*b.z - a.z*b.y, 
                      a.z*b.x - a.x*b.z, 
                      a.x*b.y - a.y*b.x);
}
 
/** checks if the given face is visible from the given camera position */
boolean visible(Vector3f cameraPosition, Vector3f[] face) {
 
  if(face.length!=3) {
    println("This only works with faces with 3 corners");
    return false;
  }
 
  // this works out the vector from the camera to the face.
  Vector3f cameraToFace = new Vector3f(cameraPosition.x-face[0].x,
                                       cameraPosition.y-face[0].y,
                                       cameraPosition.z-face[0].z);
 
  // we need to find out what direction the face is pointing, 
  // known as the normal. to do this we need to do a cross 
  // product of two of the sides of the face.
  // side 1
  Vector3f ab = new Vector3f(face[1].x-face[0].x,
                             face[1].y-face[0].y,
                             face[1].z-face[0].z);
  Vector3f cb = new Vector3f(face[1].x-face[2].x,
                             face[1].y-face[2].y,
                             face[1].z-face[2].z);
  Vector3f faceNormal = cross(cb,ab);
 
  // so that we can draw the normal later on outside of this function.
  triangleNormal = faceNormal;
 
  // We now know the vector from the camera to the face, 
  // and the vector that describes which direction the face 
  // is pointing, so we just need to do a dot-product and 
  // based on that we can tell if it's facing the camera or not
  float result = dot(cameraToFace,faceNormal);
 
  // if the result is positive, then it is facing the camera.
  return result > 0;
}
 
 
Vector3f[] verticies;
Vector3f camPos;
Vector3f triangleNormal;
 
float rotation;
 
void setup() {
  size(400,400,P3D);
  noStroke();
 
  // initialise triangle vertices
  verticies=new Vector3f[3];
  verticies[0]=new Vector3f(-20,-20,0);
  verticies[1]=new Vector3f(0,20,0);
  verticies[2]=new Vector3f(20,-20,0);
}
 
void draw() {
 
  background(0);
 
  // orbit around the triangle
  rotation += 0.01;
 
  camPos = new Vector3f(50*sin(rotation),0,50*cos(rotation));
  camera(camPos.x,camPos.y,camPos.z,0,0,0,0,-1,0);
 
  // We'll use different colours to show wether the triangle is visible
  // or not to make it easier to see that it's definately working. In 
  // practice you'd use the result to decide wether to draw it or not.
  boolean canBeSeen = visible(camPos,verticies);
  if(canBeSeen) {
    fill(128,255,128); 
  }
  else {
    fill(255,128,128); 
  }
 
  beginShape(TRIANGLES);
  vertex(verticies[0].x,verticies[0].y,verticies[0].z);
  vertex(verticies[1].x,verticies[1].y,verticies[1].z);
  vertex(verticies[2].x,verticies[2].y,verticies[2].z);
  endShape();  
 
  // And to make the "normal" of the triangle visible to show 
  // that the correct side of the triangle is being shown...
 
  stroke(0,0,255);
  beginShape(LINES);
  vertex(0,0,0); //the middle of the triangle
  vertex(triangleNormal.x/200,triangleNormal.y/200,triangleNormal.z/200);
  endShape();
  noStroke();
 
}
