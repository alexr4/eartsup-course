
FFTObject fftObj;
Alinea alinea01;

int sWidth = 1280;//round(1280/2.5);//round(sWidth/2.5);
int  sHeight= 800;//round(sWidth*2);//round(1920/2.5);//

World myWorld;
/*
public void init()
 {
 frame.removeNotify();
 frame.setUndecorated(true);
 super.init();
 }
*/
void setup()
{
  size(sWidth, sHeight, P3D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  
  initMinim();
  fftObj = new FFTObject();
  
  alinea01 = new Alinea(96000);
  
  myWorld = new World(500);
 
  

}

void draw()
{
  background(50);
  myWorld.run(false);
  alinea01.run();
  
  //debug
  //fftObj.displayFFT(20, height-30, 5, fftObj.fftAverageSize);
}


