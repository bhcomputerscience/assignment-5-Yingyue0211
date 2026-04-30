class NextButton
{
  float x, y, w, h;
  boolean visible = false;// Only show when needed

  public NextButton(float xPos, float yPos, float widthBtn, float heightBtn)
  {
    x = xPos;
    y = yPos;
    w = widthBtn;
    h = heightBtn;
  }

  public void display()
  {
    // Draw button
    if(!visible) 
        return;
    // Change color on hover(like a animation)
    if(mouseOver())
    {
      fill(180); 
    }
    else
    {
      fill(200);
    }
    stroke(255);
    rect(x, y, w, h, 10);
    fill(0);
    textSize(20);
    text("NEXT", x + w/3, y + h/1.5);
  }
  // Check mouse position
  public boolean mouseOver()
  {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
  // Check click
  public boolean isClicked()
  {
    return mouseOver();
  }
}
