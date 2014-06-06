class PoetryBot{
  Arduino arduino;
  PitchDetectorFFT audioAnalysis;
  AudioSource mic;
  float level;
  float frequency;
  float threshold;
  int time;
  int wait = 15000; // 15 seconds;
  int servotime;
  int servowait = 1500;
  LED volumeLED;
  Boolean talking = false;
  Boolean flowerOpen = false;
  PoetryBot(PitchDetectorFFT a, float t, Arduino ar, AudioSource m){
    audioAnalysis = a;
    threshold = t;
    arduino = ar;
    mic = m;
    time = millis();
    servotime = millis();
    volumeLED = new LED(0, ColorType.BLUE, arduino);
    arduino.pinMode(9, Arduino.SERVO);
  }
  public void botLoop(){
    level = mic.GetLevel();
    frequency = audioAnalysis.GetFrequency();
    println(frequency);
    volumeLED.SetBrightness(round((level) * 255));
    if(level > threshold && !talking){
      talking = true;
      if(!flowerOpen){
        arduino.servoWrite(9,60);
        servotime = millis();
        flowerOpen = true;
      }
    }
    if(level < threshold && talking){
     talking = false; 
    }
    if(millis() - servotime >= servowait){
      arduino.analogWrite(9,0);
      servotime = millis();
    }
    if(millis() - time >= wait){
      ColorType c = volumeLED.GetColor();
      if(c == ColorType.RED){
       volumeLED.SetColor(ColorType.BLUE); 
      }
      else if(c == ColorType.BLUE){
       volumeLED.SetColor(ColorType.GREEN);
      }
      else if(c == ColorType.GREEN){
       volumeLED.SetColor(ColorType.RED);
      }
      time = millis();
    }
  }
};
