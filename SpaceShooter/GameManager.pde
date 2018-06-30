
enum GAME_STATE
{
  MAINMENU,
  PLAY_LEVEL1
  
}


ArrayList<GameObject> gameObjectList;
ArrayList<Missile> missileList;
ArrayList<Asteroid> asteroidList;
ArrayList<SimpleEnemy> simpleEnemyList;
ArrayList<ExplosionParticle> explosionList;

ArrayList<PImage> missileImages;
ArrayList<PImage> explosionImages;
ArrayList<PImage> enemyExplosionImages;
ArrayList<PImage> asteroidImages;

Ship player1, mirrorShip;
PImage ship_straight;
PImage ship_straight_thrust;
PImage ship_left;
PImage ship_right;
PImage ship_left_thrust;
PImage ship_right_thrust;

PImage curShipImage;

int score;
boolean spawnerUpdated;
//boolean isTwoShips;
PFont font1;

AsteroidSpawner asteroidSpawner;
SimpleEnemySpawner simpleSpawner;

GAME_STATE state;

class GameManager
{
  GameManager()
  {
    font1 = loadFont("Arial.vlw");
    ship_straight = loadImage("ship_idle_straight.png");
    ship_straight_thrust = loadImage("ship_thrust_straight.png");
    ship_left = loadImage("ship_idle_left.png");
    ship_right = loadImage("ship_idle_right.png");
    ship_left_thrust = loadImage("ship_thrust_left.png");
    ship_right_thrust = loadImage("ship_thrust_right.png");
    curShipImage = ship_straight;
    
    missileImages = new ArrayList<PImage>();
    for(int i = 0; i < 7; i++)
    {
      missileImages.add(loadImage("rocket_" + i + ".png")); 
    }
    
    explosionImages = new ArrayList<PImage>();
    for(int i = 0; i < 7; i++)
    {
      explosionImages.add(loadImage("explosion_" + i + ".png")); 
    }
    
    enemyExplosionImages = new ArrayList<PImage>();
    for(int i = 0; i < 7; i++)
    {
      enemyExplosionImages.add(loadImage("explosion_r" + i + ".png")); 
    }
    
    asteroidImages = new ArrayList<PImage>();
    for(int i = 0; i < 6; i++)
    {
      asteroidImages.add(loadImage("asteroid_" + i + ".png"));
    }
    
    ResetGame();
  }
  
  void ResetGame()
  {
    explosionList = new ArrayList<ExplosionParticle>();
    
    gameObjectList = new ArrayList<GameObject>();
    missileList = new ArrayList<Missile>();
    asteroidList = new ArrayList<Asteroid>();
    simpleEnemyList = new ArrayList<SimpleEnemy>();
    
    asteroidSpawner = new AsteroidSpawner();
    simpleSpawner = new SimpleEnemySpawner();
    
    state = GAME_STATE.MAINMENU;
    textSize(40);
    score = 0;
    spawnerUpdated = false;
    //isTwoShips = false;
    
    player1 = new Ship(100, 400);
  }
  
  
  void Update()
  { 
    switch(state)
    {
      case MAINMENU:
        MainMenuUpdate();
        break;
      case PLAY_LEVEL1:
        Level1Update();
        break;
      default:
        break;
    
    }
    
  }
  
  // State: Main Menu
  void MainMenuUpdate()
  {
    // Run State Code
    fill(0);
    textSize(40);
    text("Space Shooter", 300, 200);
    textSize(30);
    text("Hit Space to Start", 325, 250);
    
    // Check for transition
    if(keyPressed)
    {
      if(key == ' ')
      {
         state = GAME_STATE.PLAY_LEVEL1;
      }
    }
  }
  
  void Level1Update()
  {
    RunCollisions();
    
    asteroidSpawner.Update();
    simpleSpawner.Update();
  
    for(int i = 0; i < gameObjectList.size(); i++)
    {
      GameObject obj = gameObjectList.get(i);
      obj.Update();
    }
    
    for(int i = 0; i < explosionList.size(); i++)
    {
      explosionList.get(i).Update();
    }
    
    updateSpawner();
    
    /* if(score % 5000 == 0)
    {
      if(!isTwoShips)
      {
        mirrorShip = new Ship(player1.x, height - player1.y, false);
        player1.health += 5;
        isTwoShips = true;
      }
    }
    if(player1.health <= 5) mirrorShip.Delete(); */
    
    fill(255);
    text("Score: " + score, 10, 550, width, 40);
    text("Health: " + player1.health, 200, 550, width, 40);
  }
  
  void updateSpawner()
  {
    if(score % 1000 == 0 && score > 0)
    {
      if(!spawnerUpdated)
      {
        player1.health++;
        if(asteroidSpawner.minSpawn > 0)
        {
          asteroidSpawner.minSpawn -= 2;
          asteroidSpawner.maxSpawn -= 2;
          spawnerUpdated = true;
        }
      }
    }
    if(score % 1000 != 0) spawnerUpdated = false;
  }
}