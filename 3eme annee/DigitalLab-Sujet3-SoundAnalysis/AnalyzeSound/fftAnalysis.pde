import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer music;

void initMinim()
{
  minim = new Minim(this);
  music = minim.loadFile("singsingsing.mp3", 1024);
  // loop music
  //music.loop();
}

class FFTObject
{
  //variables
  FFT fft;


  //constructeur
  FFTObject()
  {




    fft = new FFT( music.bufferSize(), music.sampleRate() );
    music.play();
  }

  //methode
  void displayFFT(float x, float y, float heightBande, float widthBande, float nbBande)
  {
    // perform a forward FFT on the samples in jingle's mix buffer,
    // which contains the mix of both the left and right channels of the file
    fft.forward( music.mix );

    for (int i = 0; i < nbBande; i++)
    {
      fill(0, 0, 100);
      noStroke();
      float newX = i*(widthBande*2);
      // draw the line for frequency band i, scaling it up a bit so we can see it
      rect(x+newX, y, widthBande,  -fft.getBand(i)*heightBande );
      text(i, x+newX, y+20);
      //line( x+newX, y, x+newX, y - fft.getBand(i)*heightBande );
    }
  }
  
  float getFFTLevel(int index)
  {
    fft.forward( music.mix );
    float fftLevel = fft.getBand(index);
    
    return fftLevel;
  }
}

