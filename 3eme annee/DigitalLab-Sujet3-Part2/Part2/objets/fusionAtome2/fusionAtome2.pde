/*"Fusion atome" est un skecth permettant de découvrir la programation orientée objet dans processing
 Dans ce skecth nous verrons comment créer un classe et gérer des comportements
 
 Nous allons créer un système de particule se deplacement à des vitesses et des sens différents et aléatoires.
 Lorsque deux particules se rencontre, une nouvelle se créer. Cette nouvelle particules est le resultat de la fusion des
 deux premières. Lorsque deux particules fusionnées se rencontre elles redeviennent des particules simples.*/
//--------------------------------------------------------------------------------------------------------//


ArrayList<Atom> myAtom; //declaration de mon tableau dynamique, ici nous utilisons un tableau dynamique de sorte à gérer sa taille de manière dynamique.
int nbAtomBegin; //nombre d'atome au départ du sketch

ArrayList<newAtom> myNewAtom; //déclarationd d'un tableau dynamique de nouveau atoms

void setup()
{
  size(displayWidth/2, displayHeight/2, OPENGL);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);

  nbAtomBegin = 10; // nombre d'atome au départ
  myAtom = new ArrayList<Atom>(); //création de mon tableau d'atome
  for (int i=0; i<nbAtomBegin; i++)
  {
    myAtom.add(new Atom(random(width), random(height), random(5, 40), int(random(5, 11))));
  }

  myNewAtom = new ArrayList<newAtom>(); //création de mon tableau de nouveaux Atomes
  background(0);

}

void draw()
{
  fill(200, 100, 15, 50);
  noStroke();
  rect(0, 0, width, height);
  
//rotate(radians(50), 1, 0, 0);
  for (int i=0; i<myAtom.size(); i++)
  {
    Atom pi = myAtom.get(i);

    for (int j=i+1; j<myAtom.size(); j++)
    {
      Atom pj = myAtom.get(j);
      float distanceBrute = dist(pi.x, pi.y, pj.x, pj.y);
      float distance = distanceBrute-(pi.masse/2+pj.masse/2);
      //float alphaP = map(d, 0, 50, 100, 0);

      if (distance<=0)
      {
        myNewAtom.add(new newAtom(pi.x, pi.y, pi.masse+pj.masse, pi.nbElectrons+pj.nbElectrons, pi.masse, pj.masse, pi.nbElectrons, pj.nbElectrons));      
        myAtom.remove(pi);
        myAtom.remove(pj);
      }
    }
  }

  for (int i=0; i<myNewAtom.size(); i++)
  {
    newAtom pi = myNewAtom.get(i);

    for (int j=i+1; j<myNewAtom.size(); j++)
    {
      newAtom pj = myNewAtom.get(j);
      float distanceBrute = dist(pi.x, pi.y, pj.x, pj.y);
      float distance = distanceBrute-(pi.masse/2+pj.masse/2);

      if (distance<=0)
      {
        myAtom.add(new Atom(pi.x-10, pi.y-10, pi.masse1, pi.nbElec1)); 
        myAtom.add(new Atom(pi.x+10, pi.y+10, pi.masse2, pi.nbElec2));
        myAtom.add(new Atom(pj.x-10, pj.y-10, pj.masse1, pj.nbElec1)); 
        myAtom.add(new Atom(pj.x+10, pj.y+10, pj.masse2, pj.nbElec2)); 
        myNewAtom.remove(pi);
        myNewAtom.remove(pj);
      }
    }
  }


  //affichage des atomes
  for (Atom a: myAtom)
  {
    a.display();
    a.motion();
    a.checkEdge();
  } 

  for (newAtom na: myNewAtom)
  {
    na.display();
    na.motion();
    na.checkEdge();
  }
}

void mouseReleased()
{

  myAtom.add(new Atom(mouseX, mouseY, random(5, 30), int(random(5, 11))));
}

