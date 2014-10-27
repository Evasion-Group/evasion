//The goal

class Goal {

  float x;
  float y;
  float gw;
  float fw;

  Goal(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    gw = 55;
    fw = 200;
  }

  void display() {
    // shape of the goal
    noStroke();
    fill(255, 255, 255);
    ellipse(x, y, fw, fw); 
    fill(0, 0, 0);
    ellipse(x, y, gw, gw);
  }
}
