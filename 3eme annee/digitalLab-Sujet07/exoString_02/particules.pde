class Type
{

  String word;
  float x;
  float y;
  float z;

  float vy;
  boolean etat= false;


  Type(String _word, float _x, float _y)
  {
    //split Mot
    this.word = _word;

    this.x = _x;
    this.y = _y;
    this.vy = word.length()*2;
  }

  void display()
  {

    motion();

    textAlign(LEFT);
    text(word, this.x, this.y);
  }



  void motion()
  {
    if (key == 'a')
    {
      etat = true;
    }

    if (etat==true)
    {
      this.y+=this.vy;
    }
    else 
    {
      this.y=this.y;
    }
    
    //percussion mur bas
     if(this.y>=height)
    {
      this.y=height;
    }
  }
}

