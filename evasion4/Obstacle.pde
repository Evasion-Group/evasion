//Obstacle Class

class Obstacle {

  float x;
  float y;


  float xOffset;
  float yOffset;
  float xScalar;
  float yScalar;

//  float xSpeed = .1;
  float xSpeed = .05;
  float xIncrement = xSpeed / 10;
  float xMax = xSpeed * 1.5;
  float xAngle = 0;

//  float ySpeed = .0575;
  float ySpeed = .029;
  float yIncrement = ySpeed / 10;
  float yMax = ySpeed * 1.5;
  float yAngle = 0;


  Obstacle(float areaX, float areaY, float areaW, float areaH) {
    xOffset = areaX + (areaW/2); // center of rectangle
    yOffset = areaY + (areaH/2);
    xScalar = (areaW/2) - 10; // movement range of obstacle
    yScalar = (areaH/2) - 10;

    x = xOffset + cos(xAngle) * xScalar;
    y = yOffset + sin(yAngle) * yScalar;
  }

  void display() {
    //basic shape of obstacle
    fill(255, 255, 255);
    stroke(0);
    triangle(x, y+10, x+10, y-10, x-10, y-10);
  }


  void shrinkArea(float speed) {
      yScalar -= speed;
  }


  void randomMove() {
    xSpeed = randomizeSpeed(xSpeed, xIncrement, -1 * xMax, xMax);
    ySpeed = randomizeSpeed(ySpeed, yIncrement, .05, yMax);
    xAngle += xSpeed;
    yAngle += ySpeed;
    x = xOffset + cos(xAngle) * xScalar;
    y = yOffset + sin(yAngle) * yScalar;
  }

  float randomizeSpeed(float speed, float increment, float min, float max) {
    //  float min = -1 * max;
    float decrement = -1 * increment;
    if (speed <= min) {
      return speed + random(0, increment);
    } else if (speed >= max) {
      return speed + random(decrement, 0);
    } else {
      return speed + random(decrement, increment);
    }
  }

}
