/*Vector : Un vector possede deux parametre. Son point d'origine et la magnitude. Ce deux parametre définisse son emplacement et sa direction
on peut alors faire differents calculs tels que

1/ ADD / SUB : add() - sub() addition ou soustraire une vecteur
2/ MULT / DIV "SCALE USE" mult() - div() - Le multiplier pour l'agrandir
3/ MAGNITUDE mag() = sqrt(x*x + y*y) (pythagore) c'est la racine carré de l'hypothénuse. C'est la longeur du deplacement de mon vecteur
4/ NORMALIZE normalize() = agrandir ou reduire un vecteur par rapport à une taille fixe. Normaliser un vecteur c'est le ramener à sa valeur 1

*/



void setup()
{
  size(500, 500, JAVA2D);
  smooth();
}

void draw()
{
  background(0);
  
  translate(width/2, height/2);
  fill(255);
  ellipse(0, 0, 5, 5);
  
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);
  
  
  //1 soustraire un vecteur
  /*
  Sois mouse le vecteur de position mouseX, mouseY et Center le vecteur de position width/2, height/2.
  Soustraire le deux vecteur va me permettre de connaitre le vecteur séparant les deux elements.
  */
  
  mouse.sub(center); // j'ajoute l'inverse du vecteur center (soustraction)
   
  mouse.normalize(); // normaliser le vecteur à 1
  mouse.mult(50); // je le multiplie pas 50;
  
  /*--- normaliser et multiplier un cecteur peut etre simplifié par :
    
    mouse.setMag(50);
  Mais cette fonction n'est présente que dans processing 2.0  
  */
  
  stroke(255);
  line(0, 0, mouse.x, mouse.y);
  ellipse(mouse.x, mouse.y, 5, 5);
  
}

