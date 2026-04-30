/**
 * This game is about the player treats a sick cat by selecting the correct
 * medicine based on its symptoms. The cat health changes depending on the 
 * player's choices, and cat skin color will changing with health bar.
 * @Yingyue Zhang
 * @April 28, 2026
 */

//Images
PImage cat1; 
PImage cold, dewarm, anti, eyedrops, stomach; 
PImage backgroundPic; 

//Objects
Cat c1; //cat
ArrayList<Bottle> bottles = new ArrayList<Bottle>(); //3 type of medicines
NextButton nextBtn;//next level button

int numill; //Current disease number
color illcolor; //The color when sick
int health;
int correctMed;// Correct medicines number
String result = "";// Display hint information

final int distanceOfBT = 20;//button position

//cold bottle
final int coldmX = 10, coldmY = 10; 
final int coldmW = 50, coldmH = 91;//the width and height of the pic

// deworm bottle
final int wormmX = coldmX, wormmY = coldmY + coldmH + distanceOfBT;
final int wormmW = 50, wormmH = 107;

// antibiotic bottle
final int antimX = coldmX, antimY = wormmY + wormmH + distanceOfBT;
final int antimW = 50, antimH = 89;

//constant variable (number)
final int MAX_HEALTH = 100;
final int MIN_HEALTH = 0;
final int HEAL_AMOUNT = 30;
final int DAMAGE_AMOUNT = 20;
void setup()
{
  size(700,393);
  //Picture loading
  cat1 = loadImage("cat1.png");
  cold = loadImage("cold.png");
  dewarm = loadImage("deworm.png");
  anti = loadImage("anti.png");
  backgroundPic = loadImage("background.png");
  //random diseases
  numill = int(random(1,5));
  //creat objects
  c1 = new Cat(cat1, width/2.7, height/5.5, numill);//cat
  bottles.add(new Bottle(cold, coldmX, coldmY));
  bottles.add(new Bottle(dewarm, wormmX, wormmY));
  bottles.add(new Bottle(anti, antimX, antimY));
  nextBtn = new NextButton(width/2 - 60, height/2, 120, 50);//Next button (hidden)
}
void draw()
{
  background(0);
  image(backgroundPic, 0,0);
  c1.boardDisplay();//diseases description board
  c1.display();
  nextBtn.display();
  c1.healthBar();
  if(c1.health < 100)
    c1.health -= 0.005; // Health slowly decreases over time
  if(c1.health >= 100)//If fully healed
  {
    result = "Fully healed!";
    nextBtn.visible = true;
  }
  for(int i = 0; i < bottles.size(); i++)
  {
    bottles.get(i).display();
  }
  
  // Display result message
  fill(0);
  textSize(30);
  text(result, width/2 - 100, height - 20);
}
void nextCase()
{
  numill = int(random(1,5)); // New illness
  c1.setIllness(numill);
  c1.health = 50;// Reset health
  
   result = "";// Clear message
  
  // Assign correct medicine
  if(numill == 1) 
    correctMed = 2;
  if(numill == 2) 
    correctMed = 1;
  if(numill == 3) 
    correctMed = 3;
  if(numill == 4) 
    correctMed = 3;
}
void mousePressed()
{
  // Click next button
  if(nextBtn.visible && nextBtn.isClicked())
  {
    nextCase();
    nextBtn.visible = false;
  }
  // Check if clicking on each bottle
  
  for(int i = 0; i < bottles.size(); i++)
  {
    Bottle b = bottles.get(i);
    if(b.isClicked())
    {
      b.click(i + 1); 
    }
  }
}
