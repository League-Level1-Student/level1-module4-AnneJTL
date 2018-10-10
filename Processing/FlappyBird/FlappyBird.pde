int birdX = 50;
int birdY = 10;
int maxX = 700;
int maxY = 400;
int birdYVelocity = 30;
int gravity = 1;
int pipeX = maxX;
int topPipeY = 50;
int pipeWidth = 100;
int lowerPipeHeight = 60;
int upperPipeHeight = 30;
int lowerPipeTop = 300;
int gap = 100;

void setup() {
  size(700, 400);
  background(255, 251, 16);
  fill(0, 0, 0);
  stroke(245, 35, 35);
  
    // pipes
  teleportPipes();
}

void draw() {
  //println(y);

  background(255, 251, 16);

  // bird 
  fill(0, 0, 0);
  stroke(245, 35, 35);
  ellipse(birdX, birdY, 10, 10);

  birdY += gravity;
  birdY = testMax(birdY, maxY);

  // pipes
  teleportPipes();
  
  if (intersectsPipes()){
    println("End !!!");
    exit();
  }
  
}

void teleportPipes(){

  pipeX--;
  pipeX = testMin(pipeX, maxX);
  
  if (pipeX == maxX){
     upperPipeHeight = (int) random(50, 200);
     println("upperPipeHeight :" + upperPipeHeight);
  }
  
  // topPipe
  fill(0, 255, 0);
  rect(pipeX, topPipeY, pipeWidth, upperPipeHeight);
  
  // bottomPipe
  lowerPipeTop = topPipeY + upperPipeHeight + gap;
  fill(255, 0, 0);
  rect(pipeX, lowerPipeTop, pipeWidth, lowerPipeHeight);
  
}


void mousePressed() {
  birdY += birdYVelocity;
  birdY = testMax(birdY, maxY);
}

int testMin(int value, int max) {
  if (value <= 0) {
    return max;
  }
  return value;
}

int testMax(int value, int max) {
  if (value >= max) {
    return 10;
  }
  return value;
}

boolean intersectsPipes() { 
  if (birdX > pipeX && birdX < (pipeX+pipeWidth)){
    if ((birdY > topPipeY + upperPipeHeight) && (birdY < lowerPipeTop - lowerPipeHeight)){
      return true;
    }
    return false;
  }
  
  return false;
}


boolean intersectsPipe() { 
     println("birdX: " + birdX + " - pipeX: " + pipeX + " - (pipeX+pipeWidth): " + (pipeX+pipeWidth) + 
       " - birdY: " + birdY + " - upperPipeHeight: " + upperPipeHeight + " - lowerPipeTop: " + lowerPipeTop );
     if (birdY < upperPipeHeight && birdX > pipeX && birdX < (pipeX+pipeWidth)){
         println("1");
          return true; }
     else if (birdY>lowerPipeTop && birdX > pipeX && birdX < (pipeX+pipeWidth)) {
                println("2");

          return true; }
     else {        return false; }
}
