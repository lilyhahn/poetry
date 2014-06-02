class PoetryBot{
  Arduino arduino;
  PitchDetectorFFT audioAnalysis;
  AudioSource mic;
  float level;
  float frequency;
  float threshold;
  float timesincewrite;
  LED volumeLED;
  Boolean talking = false;
  LegoNXT nxt;
  PoetryBot(PitchDetectorFFT a, float t, Arduino ar, AudioSource m, LegoNXT n){
    audioAnalysis = a;
    threshold = t;
    arduino = ar;
    mic = m;
    timesincewrite = millis();
    volumeLED = new LED(12, 0, ColorType.RED, arduino);
    nxt = n;
  }
  public void botLoop(){
    level = mic.GetLevel();
    frequency = audioAnalysis.GetFrequency();
    println(frequency);
    volumeLED.SetBrightness(round((level) * 255));
    if(level > threshold && !talking){
      talking = true;
    }
    if(level < threshold && talking){
     talking = false; 
    }
  }
};
