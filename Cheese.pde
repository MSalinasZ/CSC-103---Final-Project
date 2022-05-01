class Cheese {

  /*
  Class variable
   */

  //declare my image var
  PImage cheeseImg;

  int x; //x pos of the apple
  int y; //y pos of the apple
  int d; //diameter of the apple
  color fillColor; //color fill of the cheese

  int xSpeed; // speed of the cheese that move in x direction
  int ySpeed; // speed of the cheese that move in y direction
  int yFast;

  int aTop;
  int aBottom;
  int aRight;
  int aLeft;
  /*
  Constructor
   */

  Cheese() {
    //initialize values of all the variables
    //initialize my image var

    cheeseImg=loadImage("cheese.png");
    //resize my image
    cheeseImg.resize(50, 50);

    // x position
    x= 200;

    //y position
    y= 50;

    ////diameter
    d=80;

    ////fill color of the apple
    //fillColor= #F50F17;

    //  //initialize my image var
    //  cheeseImg=loadImage("cheese.png");

    //    //resize my image
    //cheeseImg.resize(800,600);


    //speed of the cheese
    ySpeed = 2;
    yFast = 3;

    //hitbox vars
    aTop=y;
    aBottom=y+d;
    aLeft=x;
    aRight=x+d;
  }



  //draw the cheese
  void render() {
    fill (fillColor);
   // rect(x, y, d, d);
    image (cheeseImg, x+20, y+20);
  }


  //move the apple
  void move() {
    y= y + ySpeed;

    if (state == 2) {
      y= y + yFast;
    }
  }

  //update frames
  void updateCheeseBounds() {
    aTop=y;
    aBottom=y+d;
    aLeft=x;
    aRight=x+d;
  }
}
