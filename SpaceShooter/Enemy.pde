enum SIMPLE_ENEMY_STATE
{
  ENTER,
  ATTACK
}


class SimpleEnemy extends GameObject
{
  PVector EnterSpeed;
  PVector MoveSpeed;
  SIMPLE_ENEMY_STATE state;
  
  float attackSpeed;
  float count;
  
  float randomTimer;
  float count2;
  
  int health;
   
  SimpleEnemy(float inX, float inY)
  {
    super(inX, inY, 30, 30);
    
    EnterSpeed = new PVector(-5, 0);
    MoveSpeed = new PVector(0, 5);
    
    state = SIMPLE_ENEMY_STATE.ENTER;
    
    attackSpeed = 50;
    count = attackSpeed;
    
    randomTimer = 100;
    count2 = randomTimer;
    
    health = 3;
  }
  

  void Update()
  {
    if(!Alive)
    {
      Delete();
    }
    else {
      
      switch(state)
      {
       case ENTER:
         EnterState();
         break;
       case ATTACK:
         AttackState();
         break;
       default:
         break;  
      }
    }
    box.Update(x,y);
    fill(255, 0, 0);
    rect(x,y,w,h);
  }
  
  void EnterState()
  {
    // State code
    x += EnterSpeed.x;
    y += EnterSpeed.y;
    
    // Check Transition
    if(x <= 700)
    {
      state = SIMPLE_ENEMY_STATE.ATTACK; 
    }
    
  }
  
  void AttackState()
  {
    x += MoveSpeed.x;
    y += MoveSpeed.y;
    
    
    
    if(y < 0 || y + h > height )
    {
      MoveSpeed.y *= -1; 
    }
    if(x < 0 || x+w > width)
    {
      MoveSpeed.x *= -1; 
    }
    
    count2--;
    if(count <= 0)
    {
      MoveSpeed.x = random(-5, 5);
      MoveSpeed.y = random(-5, 5);
      count2 = randomTimer;
    }
    
    
    // Fire Code
    count--;
    
    if(count < 0)
    {
      // Fire
      Missile m = new Missile(new PVector(x - 5,y + h/2), new PVector(-5,0), true);
      missileList.add(m);
      
      count = attackSpeed;
    }
    
    
  }
  
  void OnCollision(GameObject other)
  {
    score += 10;
    if(other.type == OBJECT_TYPE.MISSILE)
    {
      if(health > 0) health--;
      if(health <= 0) Alive = false;
    }
    if(other.type == OBJECT_TYPE.SHIP)
    {
      health = 0;
      Alive = false;
    }
  }
  void Delete()
  {
    super.Delete(); 
    simpleEnemyList.remove(this);
    ExplosionParticle p = new ExplosionParticle(x,y,EXPLOSION_TYPE.ENEMY);
    explosionList.add(p);
  }

}