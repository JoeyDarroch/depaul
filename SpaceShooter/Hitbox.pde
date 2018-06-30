class Hitbox
{
  boolean debugMode = false;
  float x, y, w, h;  
  
  Hitbox(float inX, float inY, float inW, float inH) {
    x = inX;
    y = inY;
    w = inW;
    h = inH;
  }
  
  void Update(float inX, float inY) {
     x = inX;
     y = inY;
     
     if(debugMode == true)
     {
       stroke(0,255, 0);
       noFill();
       rect(x, y, w, h); 
     }
  }
}

boolean Collision(Hitbox a, Hitbox b) 
{
  float thisTop = a.y;
  float thisBot = a.y + a.h;
  float thisLeft = a.x;
  float thisRight = a.x + a.w;
  
  float otherTop = b.y;
  float otherBot = b.y + b.h;
  float otherLeft = b.x;
  float otherRight = b.x + b.w;
  
  boolean output = true;
  
  if( thisBot < otherTop)
  {
    output = false; 
  }
  else if( thisTop > otherBot)
  {
    output = false; 
  }
  else if( thisRight < otherLeft)
  {
    output = false; 
  }
  else if( thisLeft > otherRight)
  {
    output = false; 
  }
  return output;
}