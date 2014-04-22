//PVector : les forces simple : gravité et vent
/*
Un force appliqué à un objet influ sur son acceleration, elle s'ajoute à elle.
 On peut donc facilement deviné que :
 
 acceleration = acceleration.add(Force);
 velocité = velocity.add(acceleration);
 location = location.add(velocity).
 
 Contrairement à la velocité d'un objet qui peut avoir une constante (voiture accelerant à 100km)
 L'acceleration subit toujours une force identique. Or si acceleration.add(force) est la methode pour appliqué une force on
 remarque que cette force s'ajoute toujorus à la force précédente et ainsi de suite.
 Pour cela à la fin de chaque cycle nous repasseront l'acceleration à 0 afin que l'objet puisse de nouveau subir une force identique.
 
 Penchons nous sur la force à présent. En physique nous savons que la masse d'un objet influ sur son acceleration.
 On peut ainsi définir la force comme ceci :
 
 Force = Mass * Acceleration
 
 et par extension :
 
 Acceleration = Force / Mass
 
 Ainsi si nous souhaitons ajouter une force à notre objet il faudra :
 1 - calculer l'acceleration produite par cette force
 2 - l'appliquer à l'acceleration de notre objet
 
 soit :  PVector force = PVector.div(_f, masse);
 acceleration.add(force);
 
 
 Si la masse influe sur l'acceleration d'un objet elle n'influe pas sur la gravité.
 pour cela, lorsque que on desire appliqué la gravité à un objet on multiplie son vecteur par la mass pour rendre la gavité constance puis que
 G = vecteurG * mass
 w.applyForce(G)
 applyForce = G/mass
 applyForce = G/mass*mass = G
 
 Dans la nature les objet subisse une autre force à la gravité : la friction.
 Cette force va influer sur la chute d'un objet. AInsi la friction subit dans un liquide visqueux n'étant pas la même que l'air (superieur)
 l'objet chutera plus lentement.
 
 La friction F est une force inverse à la direction d'un objet du à la friction entre l'objet et une surface
 La Normale N est la force inverse à la gravité permettant à l'objet de ne pas s'enfoncer
 
 La formule de la Friction F est
 F = -1*u*||N||*normalized(velocity)
 
 où u est le coefficient de la friction et ||N|| est la magnitude du vecteur Normale
 */

Walker[] myWalker;
int nbWalker;


void setup()
{
  size(500, 500, JAVA2D);
  smooth();
  nbWalker = 10;
  myWalker = new Walker[nbWalker];
  for (int i=0; i<nbWalker; i++)
  {
    myWalker[i] = new Walker();
  }
  background(0);
}

void draw()
{
  background(255);

  //orientation du vent
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);
  mouse.sub(center); // j'ajoute l'inverse du vecteur center (soustraction) 


  //voir l'orientation
  pushMatrix();
  translate(width/2, height/2);

  mouse.normalize(); // normaliser le vecteur à 1
  mouse.mult(50); // je le multiplie pas 50;

  stroke(0);
  line(0, 0, mouse.x, mouse.y);
  ellipse(mouse.x, mouse.y, 5, 5);
  popMatrix(); 


  for (Walker w : myWalker)
  {
    mouse.normalize(); // normaliser le vecteur à 1
    mouse.mult(0.5); // je le multiplie pas 50;

    PVector wind = new PVector(mouse.x, 0);

    PVector gravity = new PVector(0.0, 0.8);
    gravity.mult(w.masse);
    w.applyForce(gravity);

    //Friction F = -1*u*||N||*normalized(velocity)
    PVector friction = w.velocity.get(); // F= velocity
    friction.normalize(); // F= normalize(velocity)
    friction.mult(-1); // F = normalize Velocity *-1
    float c = 2.0; // c est mon coefficient de friction
    friction.mult(c); // F = normalize Velocity *-1 *c = friction 
    w.applyForce(friction);


    w.applyForce(wind);
    w.walk();
    w.display();
  }
}

