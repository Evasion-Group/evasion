//The Wall

class Thewall {

  float x;
  float y;
  float s;
  float w;
  float h;

  Thewall(float xPos, float yPos, float wallwidth, float wallheight) {
    x = xPos;
    y = yPos;
    w = wallwidth;
    h = wallheight;
  }

  void display() {
    // shape of the wall
    fill(192);
    rect(x, y, w, h); 
    //print(x);
  }
  
  void move(float speed) {
    y = y + speed;
  }
}
