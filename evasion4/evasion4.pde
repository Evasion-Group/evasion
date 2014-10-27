// EVASION!!!!!

import apwidgets.*;

APMediaPlayer deathSoundPlayer;
APMediaPlayer winSoundPlayer;

final int PLAY = 0;
final int WIN = 1;
final int LOSE = 2;

int level = PLAY;

int currentTime;

Player me;
Obstacle obstacle1;
Thewall floyd; 
Thewall bottomfloyd;
Goal thegoal;
//Safezone safezone1;
Bomb bomb1;
Bomb bomb2;
Bomb bomb3;
float movement;

void setup() {
  size(1280, 736);
  //orientation(LANDSCAPE);
  
  deathSoundPlayer = new APMediaPlayer(this);
  winSoundPlayer = new APMediaPlayer(this);
  deathSoundPlayer.setMediaFile("death.wav");
  winSoundPlayer.setMediaFile("win.wav");
  
  me = new Player(75, height/2);
  floyd = new Thewall(0, -800, 1300, 800);
  bottomfloyd = new Thewall(0, 736, 1300, 800);
  thegoal = new Goal(width-115, height/2);
  bomb1 = new Bomb(me.x + me.r * 3, me.y);
  bomb2 = new Bomb(3*width/4, 3*height/5);
  bomb3 = new Bomb(width/2, 2*height/5);
  obstacle1 = new Obstacle(150, 0, width - 400, height);

  level = PLAY;
}

void draw() {
  background(0, 0, 0);

  switch (level) {

  case PLAY: // Play case
    thegoal.display();
    me.rollover(mouseX, mouseY);
    me.display();
    movement = me.drag(mouseX, mouseY);
    floyd.move(movement*.08);
    floyd.display();
    bottomfloyd.move(movement*-.08);
    bottomfloyd.display();

    // Deal with bombs
    if (bomb1.needsNextBomb()) {
      bomb1.placeNextBombNear(me.x, me.y, me.r);
    } else {
      bomb1.grow();
      bomb1.display();
    }
    if (bomb2.nextX == bomb2.x && bomb2.nextY == bomb2.y) {
      bomb2.placeNextBomb(random(width/2, width*3/4), random(height*2/5, height*3/5));
    } else {
      bomb2.grow();
      bomb2.display();
    }
    if (bomb3.nextX == bomb3.x && bomb3.nextY == bomb3.y) {
      bomb3.placeNextBomb(random(width/4, width/2), random(height/5, height*4/5));
    } else {
      bomb3.grow();
      bomb3.display();
    }

    obstacle1.shrinkArea(movement*.08);
    obstacle1.randomMove();
    obstacle1.display();

    if (wallCollision() || obstacleCollision(obstacle1) || bombCollision(bomb1) || bombCollision(bomb2) || bombCollision(bomb3)) {
      deathSoundPlayer.start();
      currentTime = millis();
      level = LOSE;
    }

    if (goalCollision()) {
      winSoundPlayer.start();
      level = WIN;
    } 
    break;

  case WIN: // Win case
    setup();
    break;
    
  case LOSE: // Loss case
    background(255);
    if (millis() > (currentTime + 1000)) {
      setup();
    }
    break;
    
  default:
    print("Shouldn't ever get here.");
    break;
  }
}


//destroy sound player
public void onDestroy() {
  super.onDestroy();
  if (deathSoundPlayer != null) {
    deathSoundPlayer.release();
  }
  if (winSoundPlayer != null) {
    winSoundPlayer.release();
  }
}

//***************************
//         Dragging         *
//***************************

void mousePressed() {
  me.clicked(mouseX, mouseY);
}

void mouseReleased() {
  me.stopDragging();
}

//***************************
//    Collision Checking    *
//***************************

boolean wallCollision() {
  if (me.y < (floyd.y + floyd.h + me.r)) {
    return true;
  } else if (me.y > bottomfloyd.y - me.r) {
    return true;
  } else {
    return false;
  }
}

boolean bombCollision(Bomb b) {
  if ((me.r + b.radius) > sqrt(sq(b.x - me.x) + sq(b.y - me.y))) { // distance formula
    return true;
  } else {
    return false;
  }
}

boolean goalCollision() {
  int margin = 5;
  if (abs(me.x - thegoal.x) < margin && abs(me.y - thegoal.y) < margin) {
    return true;
  } else {
    return false;
  }
}

boolean obstacleCollision(Obstacle obs) {
  int margin = 27;
  if (abs(me.x - obs.x) < margin && abs(me.y - obs.y) < margin) {
    return true;
  } else {
    return false;
  }
}

