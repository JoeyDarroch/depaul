enum OBJECT_TYPE
{
  SHIP,
  MISSILE
}

abstract class GameObject
{
  float x, y, w, h;
  Hitbox box;
  OBJECT_TYPE type;
  
  boolean Alive;
  
  GameObject(float inX, float inY, float inW, float inH)
  {
    x = inX;
    y = inY;
    w = inW;
    h = inH;
    box = new Hitbox(x,y,w,h);
    gameObjectList.add(this);
    Alive = true;
  }
  
  abstract void Update();
  
  abstract void OnCollision(GameObject obj);
  
  void Delete()
  {
     gameObjectList.remove(this);
  }
  
}