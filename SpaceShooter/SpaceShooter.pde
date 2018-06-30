import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;



GameManager gameMan;
Minim minim;

void setup()
{
  size(800, 600); 
  gameMan = new GameManager();
  InputSetup();
  minim = new Minim(this);
}

void draw()
{
  background(200);

  // Listen for all Input
  Input();
  
  // Update all GameObjects
  gameMan.Update();
  
}