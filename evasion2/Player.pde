//Player Circle

class Player {

  float x;
  float y;
  float r;

Player(float xPos, float yPos){
  x = xPos;
  y = yPos;
  r = 27;
}

void display() {
  //basic shape of player
//  x = mouseX;
//  y = mouseY;
  fill(255,255,255);
  ellipse(x, y, r*2, r*2);
  
}

}

