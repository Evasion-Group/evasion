//Safe Zone

class Safezone {

  float w;
  float x;
  float y;

Safezone(float xPos, float yPos){
  x = xPos;
  y = yPos;
  w = 50;
}

void display() {
  // shape of the Safezone
  fill(255,255,255);
  rect(x, y, w, w); 

}

}

