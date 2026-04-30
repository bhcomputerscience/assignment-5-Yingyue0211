class Cat
{
  private PImage cat;
  private float x, y;
  private int numl; // illness type
  float boardX = width*3.5/5, boardY = 10;
  boolean isHealthy = false;
  int health = 50;
  public Cat(PImage pic, float xPos,float yPos, int num)
  {
    cat = pic;
    x = xPos;
    y = yPos;
    numl = num;
  }
  // Update illness type
  public void setIllness(int n)
  {
    numl = n;
  }
  // fill cat color depending on health
  public void display()
  {
    float t = map(health, 0, 100, 0, 1);
    //  from illness color to white
    color currentColor = lerpColor(illcolor, color(255), t);
    tint(currentColor);
    image(cat, x, y);
    noTint();
    // Special effect(wound case)
    if(numl == 4 && health < 80)
    {
      pushMatrix(); 
      translate(x+100, y+170);
      rotate(radians(35)); 
      noStroke();
      fill(#7d1017);
      ellipse(0, 0, 10, 50);  
      popMatrix();
    }
  }
  // Display illness description and set correct medicine
  public void boardDisplay()
  {
    color boardColor = #bad5e0;
    stroke(boardColor);
    strokeWeight(4);
    fill(255);
    rect(boardX, boardY, 200,75);
    textSize(12);
    if(numl == 1)
    {
      illcolor = #eb4034;
      fill(0);
      text("The kitten has been scratching itself all",boardX+5,boardY+20);
      text("day, and there seem to be many tiny", boardX+5,boardY+35);
      text("bugs in its fur.",boardX+5,boardY+50);
      correctMed = 2;
    }
    if(numl == 2)
    {
      illcolor = #48bd09;
      fill(0);
      text("The cat keeps sneezing and has a runny",boardX+5,boardY+20);
      text("nose. It also looks a bit low on energy.", boardX+5,boardY+35);
      correctMed = 1;
    }
    if(numl == 3)
    {
      illcolor = #e3a005;
      fill(0);
      text("The cat’s eyes are very red and watery",boardX+5,boardY+20);
      text("and they look a bit swollen.", boardX+5,boardY+35);
       correctMed = 3;
    }
    if(numl == 4)
    {
      illcolor = #e36d75;
      fill(0);
      text("The kitten’s leg has been scratched,",boardX+5,boardY+20);
      text("the wound is a bit red and swollen,", boardX+5,boardY+35);
      text("and it looks like it’s in pain.",boardX+5,boardY+50);
      correctMed = 3;
    }
  }
  public void healthBar()
  {
    // Position of the health bar (relative to the cat)
    float barX = x+50;
    float barY = y - 20;
    // Size of the health bar
    float barW = 120;
    float barH = 10;
    // Draw empty bar
    fill(200);
    rect(barX, barY, barW, barH);
    // Set color based on health level
    if(health < 40)
    {
      fill(255,0,0);// Red: low health
    }
    else if(health < 70)
    {
      fill(255,165,0);// Orange: medium health
    }
    else
    {
      fill(0,200,0);// Green: high health
    }
    // Calculate current width based on health
    float currentW = map(health, 0, 100, 0, barW);
    stroke(255);
    // Draw current health
    rect(barX, barY, currentW, barH);
  }
}
