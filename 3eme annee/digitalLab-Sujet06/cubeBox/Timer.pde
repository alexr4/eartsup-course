class Timer {

  int savedTime;
  int totalTime;
  int passedTime;
  int remainingTime;
  boolean timerStarted, timerStopped;

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
    timerStarted = false;
    timerStopped = true;
  }

  void start() {
    if (timerStopped) {
      savedTime = millis();
      timerStarted = true;
      timerStopped = false;
    }
  }

  void stop() {
    timerStopped = true;
    timerStarted = false;
  }

  void reset() {
    savedTime = millis();
  }
  
  void setTotalTime(int time)
  {
    totalTime = time;
  }

  boolean isFinished() {
    if (timerStarted) {
      passedTime = millis()- savedTime;
      if (passedTime > totalTime) {
        timerStarted = false;
        timerStopped = true;
        return true;
      } 
      else {
        return false;
      }
    } 
    else {
      return true;
    }
  }

  int getRemainingTime() {
    if (timerStarted) {
      remainingTime = totalTime-passedTime;    
      return remainingTime;
    } 
    else {
      return -1;
    }
  }
}

