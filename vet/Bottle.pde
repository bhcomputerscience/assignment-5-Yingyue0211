class Bottle
{
  private PImage bottle;
  private float x, y;
  // Constructor
  public Bottle(PImage pic, float xPos, float yPos)
  {
    bottle = pic;
    x = xPos;
    y = yPos;
  }
  
  // Display bottle image
  public void display()
  {
    image(bottle, x, y);
  }
  // Checks if the mouse is inside the bottle's area
  public boolean isClicked()
  {
    return mouseX >= x && mouseX <= x + bottle.width && mouseY >= y && mouseY <= y + bottle.height;
  }

  // Handle click interaction
  public void click(int kindOFm)
  {
    // Correct medicine
    if(kindOFm == correctMed)
    {
      result = "Correct! The pet is getting better!";
      c1.health += HEAL_AMOUNT;
      if(c1.health > MAX_HEALTH) 
        c1.health = MAX_HEALTH;
    }
    // Wrong medicine
    else
    {
      result = "Wrong medicine!";
      c1.health -= DAMAGE_AMOUNT;
      if(c1.health < MIN_HEALTH) 
        c1.health = MIN_HEALTH;
    }
  }
}
