
class Asteroid extends GameObject
{
  PVector velocity;
  int imageNumber;
  
  Asteroid()
  {
    super(width + 100, random(10, height -10), 30, 30);
    velocity = new PVector(-5, 0);
    imageNumber = int(random(0,asteroidImages.size()));
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
   
      if(x + w + 10 < 0)
      {
         Delete(); 
      }
    
      box.Update(x,y);
      //fill(0, 255, 0);
      //rect(x,y,w,h); // No longer needed!
      image(asteroidImages.get(imageNumber),x,y,w,h);
    }
  }
  
  void OnCollision(GameObject other)
  {
    Alive = false;
  }
  
  void Delete()
  {
    super.Delete(); 
    asteroidList.remove(this);
    score += 10;
    //gameMan.incrementScore(10);
    if(x + w + 10 >= 0) // makes sure it won't explode just by going off-screen
    {
      ExplosionParticle p = new ExplosionParticle(x,y,EXPLOSION_TYPE.ASTEROID);
      explosionList.add(p);
    }
  }
  
}