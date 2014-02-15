class Type
{
  String word;
  float x, y, vy;
  int nbChar;
  char[] lettres;

  Type(String _word, float _x, float _y)
  {
    this.word = _word;
    lettres = word.toCharArray();
    this.nbChar = lettres.length;
    println(nbChar);
    
    this.x = _x;
    this.y = _y;
    this.vy = this.nbChar;
  }

  void display()
  {
    motion();
    for(int i=0; i<nbChar; i++)
    {
      float ftSize =1+i*10;
      textAlign(LEFT);
      //textSize(ftSize);
      text(this.lettres[i], this.x+(i*10), this.y);
    }
  }
  
  void motion()
  {
    this.y += this.vy;
    //percussion mur bas
     if(this.y>=height+100)
    {
      this.y=random(-100, 0);
    }
  }
}

