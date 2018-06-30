
class Ship extends GameObject
{
  color shipColor;
  PVector velocity;
  float speed;
  int health;
  boolean attackInput;
  boolean canAttack;
  //boolean isMainShip;
  float attackTimer;
  
  Ship(float x, float y)
  {
    super(x, y, 50, 50);
    shipColor = color(0, 0, 255);
    velocity = new PVector(0, 0);
    speed = 5;
    health = 5;
    attackInput = true;
    type = OBJECT_TYPE.SHIP;
  }
  
  /* Ship(float x, float y, boolean isMainShip)
  {
    super(x, y, 50, 50);
    shipColor = color(0, 0, 255);
    velocity = new PVector(0, 0);
    speed = 5;
    health = 5;
    attackInput = true;
    type = OBJECT_TYPE.SHIP;
    this.isMainShip = isMainShip;
  } */
  
  void Update()
  {
    // Update Position
    x += velocity.x;
    y += velocity.y;
    
    if(x <= 0)
    {
      x = 0;  
    }
    if(x + w >= width)
    {
      x = width - w; 
    }
    if( y <= 0)
    {
      y = 0; 
    }
    if( y + h >= height)
    {
      y = height - h;
    }
    
    if(attackInput && canAttack)
    {
      canAttack = false; 
      attackTimer = 5;
      Missile m = new Missile(new PVector(x+w+5,y + h/2), new PVector(5,0), false);
      missileList.add(m);
      
    }
    
    if(canAttack == false)
    {
      attackTimer -= 1;
      if(attackTimer < 0)
      {
        canAttack = true; 
      }
    } 
    
    box.Update(x,y);
    image(curShipImage,x,y,w,h);
  }
  
  
  void ProcessInput(InputData data)
  {
    //if(isMainShip)
    //{
      velocity.x = data.horizontal * speed;
      velocity.y = data.vertical * speed;
      attackInput = data.fire;
    //}
    /* else
    {
      velocity.x = data.horizontal * speed;
      velocity.y = -(data.vertical * speed);
      attackInput = data.fire;
    } */
    
    // Thrusting?
    if(velocity.x > 0)
    {
      if(velocity.y > 0)
      { 
        curShipImage = ship_right_thrust;
      }
      else if(velocity.y < 0)
      {
        curShipImage = ship_left_thrust;
      }
      else
      {
        curShipImage = ship_straight_thrust;
      }
    }
    else
    {
      if(velocity.y > 0)
      { 
        curShipImage = ship_right;
      }
      else if(velocity.y < 0)
      {
        curShipImage = ship_left;
      }
      else
      {
        curShipImage = ship_straight;
      }
    }
    
  }
  
  void OnCollision(GameObject other)
  {
    if(health > 0) health--;
    if(health <= 0) gameMan.ResetGame();
  }
}