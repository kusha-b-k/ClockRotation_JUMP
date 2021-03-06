
class Mover 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  Mover() 
  {
    location = new PVector(0,0);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 1;
  }
  void applyForce(PVector force) 
  {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }  
  void update() 
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  void display() 
  {
    stroke(0);
    strokeWeight(2);
    fill(150);
    ellipse(location.x,location.y,33,33);
  }
  void checkEdges()
  {
    if (location.x > width)
    {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) 
    {
      velocity.x *= -1;
      location.x = 0;
    }
    if (location.y > height) 
    {
      velocity.y *= -1;
      location.y = height;
    }
  }
}