PShape svg;
float r,v,b;

void setup()
{
  size(500, 500, JAVA2D);
  smooth();
  
  svg = loadShape("waterDrop.svg");
}

void draw()
{
  background(255);
  translate(width/2, height/2);
  
  
  /*changer le style du SVG*/
  svg.disableStyle();
  noStroke();
  fill(r, v, b);
  
  //position
  shapeMode(CENTER);
  shape(svg, 0, 0);
  
  /*
  println("svg.width : "+svg.width);
  println("svg.height : "+svg.height);
  */
}

void mousePressed()
{
  r = random(255);
  v = random(255);
  b = random(255);
}
