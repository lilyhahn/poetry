class LED{
  int pin;
  int brightness;
  ColorType Color;
  Arduino arduino;
  public void SetColor(ColorType col){
    Color = col;
  }
  public ColorType GetColor(){
    return Color;
  }
  public void SetBrightness(int b){
   brightness = b; 
   arduino.analogWrite(pin, brightness);
  }
  public int GetBrightness(){
   return brightness; 
  }
  LED(int p, int b, ColorType c, Arduino a){
    pin = p;
    Color = c;
    brightness = b;
    arduino = a;
    arduino.analogWrite(pin, brightness);
  }
}
