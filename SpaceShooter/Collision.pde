
void RunCollisions()
{
  
  // Test Missiles vs. SimpleEnemies
  for(int i = 0; i < missileList.size(); i++)
  {
    for(int j = 0; j < simpleEnemyList.size(); j++)
    {
       Missile m = missileList.get(i);
       SimpleEnemy s = simpleEnemyList.get(j);
       if(!m.isEnemy) {
         if(Collision(m.box, s.box))
         {
           s.OnCollision(m);
           m.OnCollision(s);
         }
       }
    }
  }
  
  // Test Missiles vs Asteroids
  for(int i = 0; i < missileList.size(); i++)
  {
    for(int j = 0; j < asteroidList.size(); j++)
    {
       Missile m = missileList.get(i);
       Asteroid a = asteroidList.get(j);
       
       if(Collision(m.box, a.box))
       {
         m.OnCollision(a);
         a.OnCollision(m);
         
       }
    }
  }
  
  
  
  // Detect for Player vs Asteroid Collision
    for(int j = 0; j < asteroidList.size(); j++)
    {
       Asteroid a = asteroidList.get(j);
       
       if(Collision(player1.box, a.box))
       {
         player1.OnCollision(a);
         a.OnCollision(player1);
         // Player Died
         //gameMan.ResetGame();
       }
    }
    
    // Detect for Player vs. Missiles Collision
    for(int i = 0; i < missileList.size(); i++)
    {
      Missile m = missileList.get(i);
      if(Collision(player1.box, m.box))
      {
        player1.OnCollision(m);
        m.OnCollision(player1);
      }
    }
    
    // Detect for Player vs. Enemies Collision
    for(int i = 0; i < simpleEnemyList.size(); i++)
    {
      SimpleEnemy s = simpleEnemyList.get(i);
      if(Collision(player1.box, s.box))
      {
        player1.OnCollision(s);
        s.OnCollision(player1);
      }
    }
  
}