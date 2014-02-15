String paragraphe = "Life insurance pays off triple if you die on a business trip. Apart from seasoning the lobster bisque, he farted on the meringue, sneezed on braised endive, and as for the cream of mushroom soup, well... Seventh rule: fights will go on as long as they have to. All right, if the applicant is young, tell him he's too young. Old, too old. Fat, too fat. If the applicant then waits for three days without food, shelter, or encouragement he may then enter and begin his training. Ah... flashback humor.";
String[] words;

Type[] myType;
int nbMots;

void setup()
{
  size(1000, 500, JAVA2D);
  smooth();
  
  words = paragraphe.split(" ");
  nbMots = words.length;
  
  myType = new Type[nbMots];
  for(int i=0; i<myType.length; i++)
  {
    myType[i] = new Type(words[i], random(width), random(height));
  }
}

void draw()
{
  background(0);
  
  for(int i=0; i<myType.length; i++)
  {
    myType[i].display();
  }
}
