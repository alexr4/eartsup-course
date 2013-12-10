/**
 */


FFTObject fftObj;
Alinea alinea01;


void setup()
{
  size(800, 400, P2D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  
  initMinim();
  fftObj = new FFTObject();
  
  alinea01 = new Alinea(60000);
}

void draw()
{
  background(0);
  stroke(255);
  
  alinea01.run();
  
  //debug
  //fftObj.displayFFT(20, height-30, 1, 10, 30);//fftObj.fft.specSize()/3
  
}

