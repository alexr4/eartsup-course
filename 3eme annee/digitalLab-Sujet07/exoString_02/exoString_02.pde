String paragraphe = "Monsieur le président je vous fais une bafouille, le monsieur";
String[] words;
int nbMots;
Type[] myType;

int marge = 100;
int space = 100;

void setup()
{
  size(1000, 400, JAVA2D);
  smooth();

  words = paragraphe.split(" ");
  nbMots = words.length;
  myType = new Type[nbMots];
  
  for (int i=0; i<myType.length; i++)
  {
    int index = paragraphe.indexOf(words[i]);
    String subStr = paragraphe.substring(0, index);
    float position = textWidth(subStr)+i*7;
    //println(position+space);
    println("index = "+index+ " i = "+i);
    println("subStr.length() "+subStr.length());
    println("words["+i+"] : "+words[i]+"    subStr : "+subStr);
    myType[i] = new Type(words[i], position, height/2);
  }
}

void draw()
{
  background(0);


  for (int i=0; i<myType.length; i++)
  {
    myType[i].display();
  }
}

