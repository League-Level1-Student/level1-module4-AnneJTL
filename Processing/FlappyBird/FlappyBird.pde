  int x = 10;
  int y = 10;
  int maxX = 400;
  int maxY = 400;
  int velocity = 30;
  
  void setup() {
    size(400, 400);
    background(255, 251, 16);
    fill(0, 0, 0);
    stroke(245, 35, 35);
  }
  
  
  void draw() {
    println(y);
  
      background(255, 251, 16);

    ellipse(x, y, 10, 10);
  
  
    if (y < maxY) {
      y += velocity;
    } else if (y >= maxY) {
      y = 0;
    }
  
  }
