boolean[] keys;

class InputData
{
  int horizontal;
  int vertical;
  boolean fire;
  
  
}

void InputSetup()
{
  keys = new boolean[20];
  
}


void Input()
{
  InputData p1Data = new InputData();
  
  // key a
  if(keys[0] == true)
  {
    p1Data.horizontal = -1;
  }
  // key d
  if(keys[1] == true)
  {
    p1Data.horizontal = 1; 
  }
  // key w
  if(keys[2] == true)
  {
    p1Data.vertical = -1;
  }
  // key s
  if(keys[3] == true)
  {
    p1Data.vertical = 1; 
  }
  
  // p1 fire key 'f'
  p1Data.fire = keys[4]; 
  
  player1.ProcessInput(p1Data);
}


void keyPressed()
{
  if(key == 'a')
  {
    keys[0] = true; 
  }
  if(key == 'd')
  {
    keys[1] = true; 
  }
  if(key == 'w')
  {
    keys[2] = true; 
  }
  if(key == 's')
  {
    keys[3] = true; 
  }
  if(key == ' ')
  {
    keys[4] = true; 
  }
  
}

void keyReleased()
{
  if(key == 'a')
  {
    keys[0] = false; 
  }
  if(key == 'd')
  {
    keys[1] = false; 
  }
  if(key == 'w')
  {
    keys[2] = false; 
  }
  if(key == 's')
  {
    keys[3] = false; 
  }
  if(key == ' ')
  {
    keys[4] = false; 
  }
  
}