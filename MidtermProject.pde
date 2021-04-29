// Midterm Assignment
// Coded by Diana Montalvo

// Global Variables

PImage mainscreen;
PImage background;
PImage spritesheetLeft;
PImage spritesheetRight;
PImage logo;
PImage backgroundDetails;

PImage[] textboxes = new PImage[3];
PImage[] sewing = new PImage[3];
PImage[] fabrics = new PImage[9];
PImage[] historicalReferences = new PImage[9];
PImage[] fashionfacts = new PImage[9];

PFont logoFont;
PFont primaryFont;

int state;
int xPos = 100;
int yPos = 500 ;
int i = -1;
int speed = 10;

String direction = "neutralRight";;
String facing;

void setup(){
  size(614, 800);
  background = loadImage("background.png");
  mainscreen = loadImage("mainbackdrop.png");
  logo = loadImage("logo.png");
  backgroundDetails = loadImage("backgroundetails.png");
  
  textboxes[0] = loadImage("textbox.png");
  textboxes[1] = loadImage("textboxbrown.png");
  textboxes[2] = loadImage("textboxbrownthin.png");
  
  sewing[0] = loadImage("handsewing.png.png");
  sewing[1] = loadImage("vintagesewing.png.png");
  sewing[2] = loadImage("sewingmachine.png.png");
  
  fabrics[0] = loadImage("bluesilk.png");
  fabrics[1] = loadImage("osnaburglinen.png");
  fabrics[2] = loadImage("browncotton.png");
  fabrics[3] = loadImage("blackvelvet.png");
  fabrics[4] = loadImage("greenwool.png");
  fabrics[5] = loadImage("bluewool.png");
  fabrics[6] = loadImage("brownfur.png");
  fabrics[7] = loadImage("metallicfabric.png");
  fabrics[8] = loadImage("blackfabric.png");
  
  historicalReferences[0] = loadImage("madamepompadour.jpeg");
  historicalReferences[1] = loadImage("daguerreotype.jpeg");
  historicalReferences[2] = loadImage("libertyleading.jpg");
  historicalReferences[3] = loadImage("oscarwilde.jpeg");
  historicalReferences[4] = loadImage("womenbiking.jpeg");
  historicalReferences[5] = loadImage("zootsuit.jpeg");
  historicalReferences[6] = loadImage("dapperdan.jpg");
  historicalReferences[7] = loadImage("spaceagetwiggy.jpeg");
  historicalReferences[8] = loadImage("younglords.jpg");
  
  fashionfacts[0] = loadImage("fashionfactspompadour.png");
  fashionfacts[1] = loadImage("fashionfactsslaves.png");
  fashionfacts[2] = loadImage("fashionfactsrevolution.png");
  fashionfacts[3] = loadImage("fashionfactswilde.png");
  fashionfacts[4] = loadImage("fashionfactsbicycle.png");
  fashionfacts[5] = loadImage("fashionfactszootsuits.png");
  fashionfacts[6] = loadImage("fashionfactsdapperdan.png");
  fashionfacts[8] = loadImage("fashionfactsyounglords.png");
  
  spritesheetLeft = loadImage("fibleft.png");
  spritesheetRight = loadImage("fibright.png");
  
  logoFont = createFont("LeckerliOne-Regular.ttf", 32);
  primaryFont = createFont("ThinPixel7-1Yq0.ttf", 32);
  
  state = 0;
}

void draw(){
  size(614, 800);
  println(mouseX, mouseY);
  if (state == 0){
    home();
  }
  else if (state == 1){
    tailors();
  }
  else if (state == 2){
    handsewing();
  }
  else if (state == 3){
    vintagesewing();
  }
  else if (state == 4){
    modernsewing();
  }
  else if (state == 5){
    blueSilk();
  }
  else if (state == 6){
    osnaburgLinen();
  }
  else if (state == 7){
    brownCotton();
  }
  else if (state == 8){
    blackVelvet();
  }
  else if (state == 9){
    greenWool();
  }
  else if (state == 10){
    blueWool();
  }
  else if (state == 11){
    brownFur();
  }
  else if (state == 12){
    silverPolyester();
  }
  else if (state == 13){
    blackAcrylic();
  }
}

void mousePressed(){
  
  
}

void keyPressed(){
  if(keyCode == ENTER && state == 5 || state == 6 || state == 7 || state == 8 || state == 9 || state == 10 || state == 11 || state == 12 || state == 13){
    state = 0;
  }
  
  if(keyCode == RIGHT){
    if(xPos < 600) {
      xPos += speed;
      i++;
      direction = "right";
      facing = "right";
      if (i == 9){
        i = 0;
      }
    }
  } else if (keyCode == LEFT) {
    if (xPos > 20) {
      xPos -= speed;
      i++;
      direction = "left";
      facing = "left";
      if (i == 9) {
        i = 0;
      }
    }
  }
  
  if(keyCode == DOWN){
    if(facing == "right"){
     direction = "downRight";
    } else if(facing == "left"){
      direction = "downLeft";
    }
  }
  
  if(keyCode == UP){
    if(facing == "right"){
      direction = "neutralRight";
    } else if(facing == "left"){
      direction = "neutralLeft";
    }
  }
}

void keyReleased(){
  if (keyCode == RIGHT) {
    i = -1;
    direction = "neutralRight";
  } else if (keyCode == LEFT) {
    i = -1;
    direction = "neutralLeft";
  }
}

void move(){
  // Neutral Positions
  if(direction == "neutralRight"){
    copy(spritesheetRight, 1620, 150, 180, 150, xPos, yPos, 180, 150);
    i = -1;
  } else if(direction == "neutralLeft"){
    copy(spritesheetLeft, 0, 150, 180, 150, xPos, yPos, 180, 150);
    i = -1;
  }
  
  // Movement Animation
  if (direction == "right") {
    copy(spritesheetRight, 1620-(i*180), 1050, 180, 150, xPos, yPos, 180, 150);
  } else if (direction == "left") {
    copy(spritesheetLeft, 0+(i*180), 1050, 180, 150, xPos, yPos, 180, 150);
  }
}
 
void home(){
  state = 0;
  image(background, 0, 0, 614, 807);
  image(backgroundDetails, 30, 30, 550, 750);
  image(logo, 60, 250, 500, 83);
  textFont(logoFont, 64);
  fill(255);
  text("The Tailor's Shop", 60, 415);
  textFont(primaryFont, 48);
  fill(198, 89, 120);
  text("An Exploratory Guide to Fashion History", 75, 450);
  image(textboxes[0], 240, 600, 150, 50);
  text("Start", 285, 633);
  
  if (mouseX >= 240 && mouseX <= 380 && mouseY >= 600 && mouseY <= 640){
    cursor(HAND);
  } else if (mouseX <= 240 || mouseX >= 380 || mouseY <= 600 || mouseY >= 640){
    cursor(ARROW);
  }
  
  if (mousePressed && mouseX >= 240 && mouseX <= 380 && mouseY >= 600 && mouseY <= 640){
    state = 1;
  }
}

void tailors(){
  state = 1;
  image(mainscreen, 0, 0, 614, 800);
  move();
  cursor(ARROW);
  if (mouseX >= 430 && mouseX <= 490 && mouseY >= 430 && mouseY <= 480){
    cursor(HAND);
    image(textboxes[2], 160, 700, 300, 50);
    textFont(primaryFont, 28);
    fill(178, 151, 127);
    text("Click to use modern sewing machine.", 190, 730);
  }
  
  if (mouseX >= 290 && mouseX <= 370 && mouseY >= 520 && mouseY <= 590){
    cursor(HAND);
    image(textboxes[2], 160, 700, 300, 50);
    textFont(primaryFont, 28);
    fill(178, 151, 127);
    text("Click to use vintage sewing machine.", 185, 730);
  }
  
  if (mouseX >= 45 && mouseX <= 110 && mouseY >= 560 && mouseY <= 610){
    cursor(HAND);
    image(textboxes[2], 160, 700, 300, 50);
    textFont(primaryFont, 28);
    fill(178, 151, 127);
    text("Click to use hand sewing supplies.", 195, 730);
  }
  
  if (mousePressed && mouseX >= 430 && mouseX <= 490 && mouseY >= 430 && mouseY <= 480){
    state = 4;
  }
  
  if (mousePressed && mouseX >= 290 && mouseX <= 370 && mouseY >= 520 && mouseY <= 590){
    state = 3;
  }
  
  if (mousePressed && mouseX >= 45 && mouseX <= 110 && mouseY >= 560 && mouseY <= 610){
    state = 2;
  }
}

void handsewing(){
  state = 2;
  image(background, 0, 0, 614, 807);
  image(sewing[0], 55, 60);
  
  image(textboxes[2], 160, 450, 300, 50);
  textFont(primaryFont, 42);
  fill(178, 151, 127);
  text("Choose a fabric.", 228, 482);
  
  image(fabrics[0], 55, 550, 150, 150);
  image(textboxes[0], 55, 725, 150, 50);
  textFont(primaryFont, 32);
  fill(198, 89, 120);
  text("Blue Silk", 90, 755);
  
  image(fabrics[1], 235, 550, 150, 150);
  image(textboxes[0], 235, 725, 150, 50);
  textFont(primaryFont, 32);
  fill(198, 89, 120);
  text("Osnaburg Linen", 253, 755);

  image(fabrics[2], 415, 550, 150, 150);
  image(textboxes[0], 415, 725, 150, 50);
  textFont(primaryFont, 32);
  fill(198, 89, 120);
  text("Brown Cotton", 440, 755);
  
  cursor(ARROW);
  if (mouseX >= 60 && mouseX <= 205 && mouseY >= 555 && mouseY <= 700){
   cursor(HAND);
  }
  if (mouseX >= 240 && mouseX <= 385 && mouseY >= 555 && mouseY <= 700){
    cursor(HAND);
  }
  if (mouseX >= 420 && mouseX <= 565 && mouseY >= 555 && mouseY <= 700){
    cursor(HAND);
  }
  
  if (mousePressed && mouseX >= 60 && mouseX <= 205 && mouseY >= 555 && mouseY <= 700){
   state = 5;
  }
  if (mousePressed && mouseX >= 240 && mouseX <= 385 && mouseY >= 555 && mouseY <= 700){
    state = 6;
  }
  if (mousePressed && mouseX >= 420 && mouseX <= 565 && mouseY >= 555 && mouseY <= 700){
    state = 7;
  }
}

void vintagesewing(){
  state = 3;
  image(background, 0, 0, 614, 807);
  image(sewing[1], 55, 60);
  
  image(textboxes[2], 160, 450, 300, 50);
  textFont(primaryFont, 42);
  fill(178, 151, 127);
  text("Choose a fabric.", 228, 482);
  
  image(fabrics[3], 55, 550, 150, 150);
  image(textboxes[0], 55, 725, 150, 50);
  textFont(primaryFont, 32);
  fill(198, 89, 120);
  text("Black Velvet", 80, 755);
  
  image(fabrics[4], 235, 550, 150, 150);
  image(textboxes[0], 235, 725, 150, 50);
  textFont(primaryFont, 32);
  fill(198, 89, 120);
  text("Green Wool", 267, 755);
  
  image(fabrics[5], 415, 550, 150, 150);
  image(textboxes[0], 415, 725, 150, 50);
  textFont(primaryFont, 32);
  fill(198, 89, 120);
  text("Blue Wool", 452, 755);
  
  cursor(ARROW);
  if (mouseX >= 60 && mouseX <= 205 && mouseY >= 555 && mouseY <= 700){
   cursor(HAND);
  }
  if (mouseX >= 240 && mouseX <= 385 && mouseY >= 555 && mouseY <= 700){
    cursor(HAND);
  }
  if (mouseX >= 420 && mouseX <= 565 && mouseY >= 555 && mouseY <= 700){
    cursor(HAND);
  }
  
  if (mousePressed && mouseX >= 60 && mouseX <= 205 && mouseY >= 555 && mouseY <= 700){
   state = 8;
  }
  if (mousePressed && mouseX >= 240 && mouseX <= 385 && mouseY >= 555 && mouseY <= 700){
    state = 9;
  }
  if (mousePressed && mouseX >= 420 && mouseX <= 565 && mouseY >= 555 && mouseY <= 700){
    state = 10;
  }
}

void modernsewing(){
  state = 4; 
  image(background, 0, 0, 614, 807);
  image(sewing[2], 55, 60);
  
  image(textboxes[2], 160, 450, 300, 50);
  textFont(primaryFont, 42);
  fill(178, 151, 127);
  text("Choose a fabric.", 228, 482);
  
  image(fabrics[6], 55, 550, 150, 150);
  image(textboxes[0], 55, 725, 150, 50);
  textFont(primaryFont, 32);
  fill(198, 89, 120);
  text("Brown Fur", 90, 755);
  
  image(fabrics[7], 235, 550, 150, 150);
  image(textboxes[0], 235, 725, 150, 50);
  textFont(primaryFont, 32);
  fill(198, 89, 120);
  text("Silver Polyster", 250, 755);
  
  image(fabrics[8], 415, 550, 150, 150);
  image(textboxes[0], 415, 725, 150, 50);
  textFont(primaryFont, 32);
  fill(198, 89, 120);
  text("Black Acrylic", 437, 755);
  
  cursor(ARROW);
  if (mouseX >= 60 && mouseX <= 205 && mouseY >= 555 && mouseY <= 700){
   cursor(HAND);
  }
  if (mouseX >= 240 && mouseX <= 385 && mouseY >= 555 && mouseY <= 700){
    cursor(HAND);
  }
  if (mouseX >= 420 && mouseX <= 565 && mouseY >= 555 && mouseY <= 700){
    cursor(HAND);
  }
  
  if (mousePressed && mouseX >= 60 && mouseX <= 205 && mouseY >= 555 && mouseY <= 700){
   state = 11;
  }
  if (mousePressed && mouseX >= 240 && mouseX <= 385 && mouseY >= 555 && mouseY <= 700){
    state = 12;
  }
  if (mousePressed && mouseX >= 420 && mouseX <= 565 && mouseY >= 555 && mouseY <= 700){
    state = 13;
  }
 }
 
void blueSilk(){
  cursor(ARROW);
  state = 5;
  image(background, 0, 0, 614, 807);
  image(historicalReferences[0], 110, 50, 400, 300);
  image(fashionfacts[0], 60, 410, 500, 300);
}

void osnaburgLinen(){
  cursor(ARROW);
  state = 6;
  image(background, 0, 0, 614, 807);
  image(historicalReferences[1], 140, 50, 350, 400);
  image(fashionfacts[1], 60, 475, 500, 300);
}

void brownCotton(){
  cursor(ARROW);
  state = 7;
  image(background, 0, 0, 614, 807);
  image(historicalReferences[2], 105, 50, 400, 300);
  image(fashionfacts[2], 60, 410, 500, 300);
}

void blackVelvet(){
  cursor(ARROW);
  state = 8;
  image(background, 0, 0, 614, 807);
  image(historicalReferences[3], 55, 50, 500, 400);
  image(fashionfacts[3], 60, 470, 500, 300);
}

void greenWool(){
  cursor(ARROW);
  state = 9;
  image(background, 0, 0, 614, 807);
  image(historicalReferences[4], 55, 50, 500, 300);
  image(fashionfacts[4], 60, 415, 500, 300);
}

void blueWool(){
  cursor(ARROW);
  state = 10;
  image(background, 0, 0, 614, 807);
  image(historicalReferences[5], 55, 50, 500, 300);
  image(fashionfacts[5], 60, 400, 500, 300);
}

void brownFur(){
  cursor(ARROW);
  state = 11;
  image(background, 0, 0, 614, 807);
  image(historicalReferences[6], 55, 50, 500, 300);
  image(fashionfacts[6], 60, 400, 500, 300);
}

void silverPolyester(){
  cursor(ARROW);
  state = 12;
  image(background, 0, 0, 614, 807);
  image(historicalReferences[7], 20, 150, 250, 500);
}

void blackAcrylic(){
  cursor(ARROW);
  state = 13;
  image(background, 0, 0, 614, 807);
  image(historicalReferences[8], 55, 50, 500, 300);
  image(fashionfacts[8], 60, 400, 500, 300);
}
