
class Missile extends GameObject
{
  PVector velocity;
  boolean isEnemy;
  int frame;
  Animation missileAnimLoop;
  Animation missileAnimLaunch;
  
  AudioPlayer sfx;
  
  Missile(PVector pos, PVector vel, boolean isEnemy)
  {
    super(pos.x, pos.y, 20, 10);
    type = OBJECT_TYPE.MISSILE;
    velocity = vel;
    this.isEnemy = isEnemy;
    frame = 5;
    
    missileAnimLaunch = new Animation(2);
    for(int i = 0; i < 5; i++)
    {
      missileAnimLaunch.AddImage(missileImages.get(i)); 
    }
    
    missileAnimLoop = new Animation(10);
    missileAnimLoop.AddImage(missileImages.get(5));
    missileAnimLoop.AddImage(missileImages.get(6));
    
    sfx = minim.loadFile("laser_hit.wav");
    sfx.play();
  
  }
  
  void Update()
  {
    if(!Alive)
    {
      Delete();
    }
    else
    {
    
      x += velocity.x;
      y += velocity.y;
   
      if(x < -100 || x > width + 100 || y < 0 || y > height)
      {
        Delete(); 
      }
    
      box.Update(x,y);
      fill(255,0,0);
      
      if(missileAnimLaunch.done == false)
      {
        missileAnimLaunch.Play(x,y,w,h);
      }
      else
      {
        missileAnimLoop.PlayLoop(x,y,w,h);
      }
    }
  }
  
  void Delete()
  {
    super.Delete();
    missileList.remove(this);
    // relocated explosion effects elsewhere
    //ExplosionParticle p = new ExplosionParticle(x,y);
    //explosionList.add(p); 
  }
  
  void OnCollision(GameObject other)
  {
    Alive = false;
  }
}