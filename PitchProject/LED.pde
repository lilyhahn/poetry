class LED{
  int pin;
  int brightness;
  ColorType Color;
  Arduino arduino;
  public void SetColor(ColorType col){
    Color = col;
    arduino.analogWrite(pin, 0);
    if(Color == ColorType.RED){
        pin = 12;
    }
    else if(Color == ColorType.BLUE){
        pin = 11;
    }
    else if(Color == ColorType.GREEN){
        pin = 10;
    }
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
  LED(int b, ColorType c, Arduino a){
    arduino = a;
    Color = c;
    SetColor(c);
    brightness = b;
    arduino.analogWrite(pin, brightness);
  }
}
