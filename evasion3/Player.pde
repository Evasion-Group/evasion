//Player Circle

class Player {

  float x;
  float y;
  float r;

  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?

  float offsetX, offsetY; // Mouseclick offset

  Player(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    r = 27;
  }

  void display(boolean safe) {
    //basic shape of player
    //  x = mouseX;
    //  y = mouseY;
    if (safe) {
      fill(150);
    } else {
      fill(255);
    }
    ellipse(x, y, r*2, r*2);
  }


  // Is a point inside the circle (for click)?
  void clicked(int mx, int my) {
    if (mx > x - r && mx < x + r && my > y - r && my < y + r) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
    }
  }

  // Is a point inside the circle (for rollover)
  void rollover(int mx, int my) {
    if (mx > x - r && mx < x + r && my > y - r && my < y + r) {
      rollover = true;
    } else {
      rollover = false;
    }
  }

  // Stop dragging
  void stopDragging() {
    dragging = false;
  }

  // Drag the rectangle
  void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }
  }
}

