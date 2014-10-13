//The Wall

class Thewall {

  float x;
  float y;
  float s;
  float w;
  float h;

  Thewall(float xPos, float yPos, float speed) {
    x = xPos;
    y = yPos;
    s = speed; 
    w = 1300;
    h = 800;
  }

  void display() {
    // shape of the wall
    fill(255, 255, 255);
    x = x + s;
    rect(x, y, w, h); 
    //print(x);
  }

}


