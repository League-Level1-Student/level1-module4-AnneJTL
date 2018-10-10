
//int maxSizeXY = 400;
int weightFrog = 15;
int heightFrog = 30;
int xStartingPoint = 200;
int yStartingPoint = 10;
int posXFrog = xStartingPoint;
int posYFrog = yStartingPoint;
int hopFrog = 25;
Car voiture1 = new Car(20, 50, 40, 5);
Car voiture2 = new Car(100, 200, 30, 10);
Car voiture3 = new Car(300, 300, 20, 10);

void setup() {
  size(400, 400);
}

void draw() {
  background(100, 196, 242);

  // The frog
  fill(22, 240, 161);
  ellipse(posXFrog, posYFrog, weightFrog, heightFrog);

  // Cars

  voiture1.goToLeft();
  voiture1.display();
  if (intersects(voiture1)) {
    returnStartingPoint();
  }

  voiture2.goToLeft();
  voiture2.display();
    if (intersects(voiture2)) {
    returnStartingPoint();
  }

  voiture3.goToRight();
  voiture3.display();
    if (intersects(voiture3)) {
    returnStartingPoint();
  }
}

void returnStartingPoint() {
  posXFrog = xStartingPoint;
  posYFrog = yStartingPoint;
}

void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP)
    {
      //Frog Y position goes up
      posYFrog -= hopFrog;
      posYFrog = testOutside(posYFrog, heightFrog);
    } else if (keyCode == DOWN)
    {
      //Frog Y position goes down 
      posYFrog += hopFrog;
      posYFrog = testOutside(posYFrog, -heightFrog);
    } else if (keyCode == RIGHT)
    {
      //Frog X position goes right
      posXFrog += hopFrog;
      posXFrog = testOutside(posXFrog, -weightFrog);
    } else if (keyCode == LEFT)
    {
      //Frog X position goes left
      posXFrog -= hopFrog;
      posXFrog = testOutside(posXFrog, weightFrog);
    }
  }
}

boolean intersects(Car car) {
  if ((posYFrog > car.getY() && posYFrog < car.getY()+50) && 
    (posXFrog > car.getX() && posXFrog < car.getX()+car.getSize()))
  {
    return true;
  } else   {
    return false;
  }
}

int testOutside(int value, int sizeShape) {
  sizeShape /= 2;
  if (value >= (width + sizeShape))
    return width + sizeShape;
  if (value <= (0 + sizeShape))
    return 1 + sizeShape;
  return value;
}

class Car {
  int xCarPosition;
  int yCarPosition;
  int sizeCar;
  int speedCar;

  Car(int x, int y, int size, int speed) {
    xCarPosition = x;
    yCarPosition = y;
    sizeCar = size;
    speedCar = speed ;
  }

  int getX() {
    return xCarPosition;
  }
  int getY() {
    return yCarPosition;
  }
  int getSize() {
    return sizeCar;
  }

  void display() 
  {
    fill(248, 255, 62);
    rect(xCarPosition, yCarPosition, sizeCar, 50);
  }

  void goToLeft() {
    xCarPosition -= speedCar;
    xCarPosition = enterOtherSide(xCarPosition, sizeCar);
  }

  void goToRight() {
    xCarPosition += speedCar;
    xCarPosition = enterOtherSide(xCarPosition, sizeCar);
  }

  int enterOtherSide(int position, int sizeShape) {
    sizeShape /= 2;
    if (position >= (width + sizeShape))
      return 1 + sizeShape;

    if (position <= (0 + sizeShape))
      return width + sizeShape;

    return position;
  }
}
