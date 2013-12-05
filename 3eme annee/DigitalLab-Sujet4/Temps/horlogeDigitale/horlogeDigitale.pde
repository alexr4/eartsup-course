int sWidth = 800;
int sHeight = 400;


void setup()
{
  size(sWidth, sHeight, P2D);
}

void draw()
{
  background(0);
  fill(255);
  textSize(40);
  text(day()+" / "+month()+" / "+year()+" "+hour()+" : "+minute()+" : "+second()+" : "+millis(), 10, height/2);
}

