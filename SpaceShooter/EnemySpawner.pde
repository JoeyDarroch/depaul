
class SimpleEnemySpawner
{
  float spawnTime;
  float maxEnemies;
  
  SimpleEnemySpawner()
  {
    spawnTime = random(10, 20);
    maxEnemies = 3;
  }
  
  void Update()
  {
    if(spawnTime <= 0)
    {
      // Create an asteroid
      if(simpleEnemyList.size() < maxEnemies)
      {
        SimpleEnemy e = new SimpleEnemy(900, random(50, height-50));
        simpleEnemyList.add(e);
      }
      
      spawnTime = random(50, 100);
    }
    spawnTime -= 1;
    
  }
  
}