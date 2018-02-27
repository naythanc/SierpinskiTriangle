int startX = 0;
int triangleSize = width;
int triangleMinLength = 20;
import processing.sound.*;
SoundFile file;
String audioName = "spook.mp3";
String path;
  
public void setup()
{
  size(500,500);
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.play();
}
public void draw()
{
  background(0);
  sierpinski(startX,height, triangleSize);
  fill(255,0,0);

  if(triangleSize < 2*width-20)
  {
    triangleSize += 10;
  }
  if(triangleSize == 2*width-20)
  {
    triangleSize = width;
  }
}
//public void mouseDragged()

public void sierpinski(int x, int y, int len) 
{
  if(len <= triangleMinLength)
  {
    fill(0,255,0);
    triangle(x, y, x+len, y, x+len/2, y-len);
  }
  else
  {
    sierpinski(x, y, len/2);
    sierpinski(x+len/2, y, len/2);
    sierpinski(x+len/4, y-len/2, len/2);
  }
}