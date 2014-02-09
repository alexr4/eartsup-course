int frameRateCapture;
int totalTimeCapture;
int frameCapture;
Timer timerCapture;
PImage capture;

void captureSetup() {
  capture = createImage(width, height, RGB);
  frameRateCapture = 60;
  totalTimeCapture = round(1000/frameRateCapture);
  frameCapture = 0;
  timerCapture = new Timer(totalTimeCapture);
  timerCapture.start();
}

void captureRun()
{
  if (timerCapture.isFinished())
  {
    capture = get();
    
    thread("saveCapture");

    frameCapture += 1;
    timerCapture.setTotalTime(totalTimeCapture);
    timerCapture.reset(totalTimeCapture);
    timerCapture.start();
  }
}

void saveCapture()
{
  capture.save("/captureVideo/matrice_"+frameCapture+".jpg");
  //saveFrame("/captureVideo/stimula_000"+frameCapture+".tiff");
}

