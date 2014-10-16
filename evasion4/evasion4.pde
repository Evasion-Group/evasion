// EVASION!!!!!

boolean won;
Player me;
Obstacle obstacle1;
Obstacle obstacle2;
Thewall floyd; 
Goal thegoal;
Safezone safezone1;

void setup() {
//  size(1280, 736);
  orientation(LANDSCAPE);
  me = new Player(75, height/2);
  floyd = new Thewall(-1310, 0, 0.1);
  thegoal = new Goal(width-115, height/2);
  safezone1 = new Safezone(800, 300);
  obstacle1 = new Obstacle(150, 0, width - 400, height);
  obstacle2 = new Obstacle(150, 0, width - 400, height);
  won = false;
}

void draw() {
  background(0, 0, 0);
  if (won == false) {
    if (obstacle1.xLeftLimit <= (floyd.x + floyd.w)) {
      obstacle1.shrinkArea(floyd.s);
      obstacle2.shrinkArea(floyd.s);
    }
    obstacle1.randomMove();
    obstacle1.display();
    obstacle2.randomMove();
    obstacle2.display();
    thegoal.display();
    me.rollover(mouseX, mouseY);
    me.drag(mouseX, mouseY);
    boolean safe = safezonecollision();
    me.display(safe);
    safezone1.display(safe);
    floyd.display();

    if (wallcollision()) {
      setup();
    }

    if (safe) {
      print("BANG");
//      if (obstacle1.xOffset - obstacle1.xScalar < safezone1.x) {
//        obstacle1.shrinkArea(5);
//      }
    }

    if (won()) {
      won = true;
    } 

    if ((obstaclecollision(obstacle1) || obstaclecollision(obstacle2)) && !safe) {
      setup();
    }
  } else if (me.r > thegoal.fw + 100) {
    setup();
  } else {
    me.r += 2;
    floyd.display();
    obstacle1.display();
    obstacle2.display();
    safezone1.display(true);
    thegoal.display();
    me.display(true);
  }
}








void mousePressed() {
  me.clicked(mouseX, mouseY);
}

void mouseReleased() {
  me.stopDragging();
}




//***************************
//Collision Checking*********
//***************************


//Wall Collision
boolean wallcollision() {
  float xwall = floyd.x + floyd.w + me.r;
  //check to see if player is colliding with wall
  if (me.x < xwall) {
    return true;
  } else {
    return false;
  }
}

//SafeZone Collision
boolean safezonecollision() {
  //Check for collision between player and safezone
  float xc = safezone1.x + safezone1.w/2;
  float yc = safezone1.y + safezone1.w/2;
  float checksafezonex  = abs(me.x - xc);
  float checksafezoney = abs(me.y - yc);
  //check to see if x and y are both within 
  if (checksafezonex < (me.r+safezone1.w/2) && checksafezoney < (me.r+safezone1.w/2)) {
    return true;
  } else {
    return false;
  }
}

//Goal Collision
boolean won() {
  int margin = 5;
  if (abs(me.x - thegoal.x) < margin && abs(me.y - thegoal.y) < margin) {
    return true;
  } else {
    return false;
  }
}

//Obstacle Collision
boolean obstaclecollision(Obstacle obs) {
  int margin = 27;
  if (abs(me.x - obs.x) < margin && abs(me.y - obs.y) < margin) {
    return true;
  } else {
    return false;
  }
}
