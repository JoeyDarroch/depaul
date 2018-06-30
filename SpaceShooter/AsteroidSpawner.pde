

class AsteroidSpawner
{
  float spawnTime;
  int minSpawn, maxSpawn;
  
  AsteroidSpawner()
  {
    minSpawn = 10;
    maxSpawn = 20;
    spawnTime = random(minSpawn, maxSpawn);
  }
  
  void Update()
  {
    if(spawnTime <= 0)
    {
      // Create an asteroid
      Asteroid a = new Asteroid();
      asteroidList.add(a);
      
      spawnTime = random(minSpawn, maxSpawn);
    }
    spawnTime -= 1;
    
  }
  
}