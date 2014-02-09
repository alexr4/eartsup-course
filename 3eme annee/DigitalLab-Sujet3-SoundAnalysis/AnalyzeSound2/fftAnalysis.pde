import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer music;
int timeSize;

void initMinim()
{
  timeSize = 1024;
  minim = new Minim(this);
  music = minim.loadFile("casseNoisetteTchaikovski.mp3", timeSize);
}

class FFTObject
{
  //variables
  FFT fft;
  float fftAverageSize;

  //constructeur
  FFTObject()
  {
    fft = new FFT( music.bufferSize(), music.sampleRate() );
    fft.linAverages(50);
    fftAverageSize = fft.avgSize();
    println(fftAverageSize);
    music.play();
  }

  //methode
  void displayFFT(float x, float y, float heightBande, float nbBande)
  {

    // perform a forward FFT on the samples in jingle's mix buffer,
    // which contains the mix of both the left and right channels of the file
    fft.forward( music.mix );
   int w = int( width/nbBande);
    for (int i = 0; i < nbBande; i++)
    {
      fill(0, 0, 100);
      noStroke();
      float newX = w;//i*(w*2);
      // draw the line for frequency band i, scaling it up a bit so we can see it
      rect(x+i*newX, y, w, -fft.getBand(i)*heightBande );
      text(i, x+i*newX, y+20);
    }
  }

  float getFFTLevel(int index)
  {
    fft.forward( music.mix );
    float fftLevel = fft.getBand(index);

    return fftLevel;
  }
}

