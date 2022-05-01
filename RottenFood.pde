class RottenFood {
  /*
  Class variaable
   */

  PImage rottenFoodImg;

  int x; //x pos of the donut
  int y; //y pos of the donut
  int d; //diameter of the donut
  color fillColor; //color fill of the donut

  int xSpeed; // speed of the donut that move in x direction
  int ySpeed; // speed of the donut that move in y direction
  int yFast;

  int dTop;
  int dBottom;
  int dRight;
  int dLeft;

  /*
  Constructor
   */

  RottenFood() {
    //initialize values of all the variables


    rottenFoodImg = loadImage("rotten.png");
    rottenFoodImg.resize (50, 50);

    // x position
    x= 400;

    //y position
    y= 50;

    //diameter
    d=100;

    //fill color of the donut
    fillColor= #F50FDE;

    ySpeed = 2;
    yFast = 3;

    //hitbox vars
    dTop=y;
    dBottom=y+d;
    dLeft=x;
    dRight=x+d;
  }
  //draw the donut
  void render() {
    fill(fillColor);
    //rect(x, y, d, d);
    image(rottenFoodImg, x+20, y+20);
  }

  //move the donut
  void move() {
    y = y + ySpeed;

    if (state == 2) {
      y= y + yFast;
    }
  }

  //update frames
  void updateRottenFoodBounds() {
    dTop=y;
    dBottom=y+d;
    dLeft=x;
    dRight=x+d;
  }
}
