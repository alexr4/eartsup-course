String paragraphe = "Bonjour monsieur le président.";
String[] words;

void setup()
{
  size(800, 400, P2D);
  smooth();

  words = paragraphe.split(" ");
}

void draw()
{
  background(0);

  //manipulation de string

  for (int i=0; i<words.length; i++)
  {
    text(words[i], width/2, 20+i*20);
  }
}


