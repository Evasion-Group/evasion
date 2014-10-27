//The Bomb

class Bomb {

  float x;
  float y;
  float radius;
  float maxRadius = 35;
  
  float nextX;
  float nextY;
  float warningRadius = 10;
  boolean nextBombPositioned = false;

  Bomb(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    nextX = x;
    nextY = y;
    radius = 1;
  }

  void nextBomb() {
    x = nextX;
    y = nextY;
    radius = 1;
    nextBombPositioned = false;
  }

  void placeNextBomb(float xPos, float yPos) {
    nextX = xPos;
    nextY = yPos;
  }

  void placeNextBombNear(float xPos, float yPos, float radius) {
    nextX = xPos + random(50, 75) + radius + this.radius;
    nextY = yPos + random(-.75 * radius, .75*radius);
  }

  void grow() {
    radius += .75;
  }

  boolean needsNextBomb() {
    if (nextBombPositioned == false && radius >= maxRadius * 3/4) {
      nextBombPositioned = true;
      return true;
    }
    return false;
  }

  void display() {
    // shape of the goal
    noStroke();
    fill(100);
    ellipse(x, y, warningRadius * 2, warningRadius * 2);
    fill(255);
    ellipse(x, y, radius * 2, radius * 2);
    if (radius > maxRadius * 3/4) {
      fill(100);
      ellipse(nextX, nextY, warningRadius * 2, warningRadius * 2);
    }
    if (radius > maxRadius) {
      nextBomb();
    }
  }
}

