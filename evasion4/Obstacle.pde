//Obstacle Class

class Obstacle {

  float x;
  float y;

  float xLeftLimit;

  float xOffset;
  float yOffset;
  float xScalar;
  float yScalar;

  float shrinkSpeed;

  float xSpeed = .1;
  float xIncrement = xSpeed / 10;
  float xMax = xSpeed * 2;
  float xAngle = 0;

  float ySpeed = .0575;
  float yIncrement = ySpeed / 10;
  float yMax = ySpeed * 2;
  float yAngle = 0;


  Obstacle(float areaX, float areaY, float areaW, float areaH) {
    xLeftLimit = areaX;
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
    noStroke();
    triangle(x, y+10, x+10, y-10, x-10, y-10);
  }


  void shrinkArea(float speed) {
    xOffset += (speed / 2);
    xScalar -= (speed / 2);
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

  //float randomizeSpeed(float speed, float increment, float max) {
  //  float min = -1 * max;
  //  float decrement = -1 * increment;
  //  if (speed <= min) {
  //    return speed + random(0, increment);
  //  } else if (speed >= max) {
  //    return speed + random(decrement, 0);
  //  } else {
  //    return speed + random(decrement, increment);
  //  }
  //}
}
