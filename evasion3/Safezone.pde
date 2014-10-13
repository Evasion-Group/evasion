//Safe Zone

class Safezone {

  float w;
  float x;
  float y;

  Safezone(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    w = 50;
  }

  void display(boolean playerTouching) {
    // shape of the Safezone
    if (playerTouching) {
      fill(150);
    } else {
      fill(255, 255, 255);
    }
    rect(x, y, w, w);
  }
}

