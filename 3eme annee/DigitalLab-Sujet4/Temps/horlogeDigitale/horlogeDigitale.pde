int sWidth = 800;
int sHeight = 400;


void setup()
{
  size(sWidth, sHeight, P2D);
}

void draw()
{
  background(0);
  textSize(30);
  
  textAlign(RIGHT);
  text(hour()+" : "+minute()+" : "+second()+" : "+millis(), width/2-20, height/2);
  
  textAlign(LEFT);
  text(day()+" / "+month()+" / "+year(), width/2+20, height/2);
}

