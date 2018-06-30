enum EXPLOSION_TYPE
{
  ASTEROID,
  ENEMY
}

class ExplosionParticle
{
   Animation anim;
   float x,y,w,h;
   EXPLOSION_TYPE type;
   
   ExplosionParticle(float inX, float inY, EXPLOSION_TYPE type)
   {
     x = inX;
     y = inY;
     w = 40;
     h = 40;
     this.type = type;
     anim = new Animation(5);
     
     if(type == EXPLOSION_TYPE.ASTEROID)
     {
       for(int i = 0; i < explosionImages.size(); i++)
       {
         anim.AddImage(explosionImages.get(i));
       }
     }
     if(type == EXPLOSION_TYPE.ENEMY)
     {
       for(int i = 0; i < explosionImages.size(); i++)
       {
         anim.AddImage(enemyExplosionImages.get(i));
       }
     }
     
   }
   
   
   void Update()
   {
     anim.Play(x,y,w,h);
     
     if(anim.done)
     {
        explosionList.remove(this);
     }
   }
  
  
  
}