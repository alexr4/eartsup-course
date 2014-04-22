char a = '1';
char b = '4';
char c = '2';
char[] data = {a, b, c};

int nbEtape = 3;


void setup()
{
  String dataToString = new String(data);
  println(dataToString);
  
  int value = int(dataToString);
  println(value);
}

void draw()
{
 checkData();
 
}

void checkData()
{
  if(nbEtape > 0)
  {
    //ajout de data
    println("ajout de data etape "+nbEtape);
    nbEtape -= 1;
  }
  else
  {
  }
}
