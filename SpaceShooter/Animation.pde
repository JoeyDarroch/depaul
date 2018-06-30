
class Animation
{ 
   ArrayList<PImage> images;
   int frame;
   int FrameRate;
   
   int count;
   
   boolean done;
   
   PImage image1;
   PImage image2;
   PImage image3;
   PImage image4;
   
   
   Animation(int fr)
   {
      images = new ArrayList<PImage>();
      FrameRate = fr;
      
      done = false;
   }
   
   void AddImage(PImage i)
   {
     images.add(i); 
   }
   
   void Play(float x, float y, float w, float h)
   {
     count++;
     if(count > FrameRate)
     {
         count = 0;
         frame++; 
         if(frame >= images.size()-1)
         {
            done = true;
         }
      }
      image(images.get(frame), x, y, w, h);
   }
  
   void PlayLoop(float x, float y, float w, float h)
   {
      count++;
      if(count > FrameRate)
      {
         count = 0;
         frame++; 
         if(frame >= images.size())
         {
            frame = 0;
            done = true;
         }
         else
         {
            done = false; 
         }
      }
      
      image(images.get(frame), x, y, w, h);
   }
   
}