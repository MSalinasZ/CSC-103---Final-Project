class Remy {

  /*
  Class variable
   */


  PImage remyImage;

  int x; //x pos of the player
  int y; //y pos of the player
  int w; //width of the player
  int h; // height of the player

  color fillColor; //color fill of the player

  int xSpeed; // speed of the player that move in x direction
  int ySpeed; // speed of the player that move in y direction

  int remyhealth;
  int cheeselives;
  int healthDie;
  int cheeseMax;
  int cheese;

  boolean isPlRight;
  boolean isPlLeft;

  //player hitbox vars
  int pTop;
  int pBottom;
  int pRight;
  int pLeft;



  /*
  Constructor
   */

  Remy() {


    remyImage = loadImage("remy.png");
    remyImage.resize (100, 150);

    // x position
    x= 500;

    //y position
    y= 450;

    //width
    w=90;

    //height
    h=50;

    //fill color of the player
    fillColor= #0FF55D;

    //speed of the player
    xSpeed = 10;

    //remys lives
    remyhealth=100;

    //cheese lives
    cheeselives=0;

    //cheese
    cheese=0;

    healthDie = 0;
    cheeseMax = 300;



    //hitbox vars
    pTop = y;
    pBottom = y+h;
    pRight=x+w;
    pLeft=x;
  }






  //draw the player
  void render() {
    fill(fillColor);
    //rect(x, y, w, h);
    image(remyImage, x+20, y+20);
  }

  //move the player
  void moveRight() {
    if (isPlRight == true && x + w < width) {
      x = x + xSpeed;
    }
  }

  void moveLeft() {
    if (isPlLeft == true && x > 0) {
      x = x - xSpeed;
    }
  }



  //update frames
  void cheeseCollision(Cheese aCheese) {
    // collision detection if statements
    if (pTop<aCheese.aBottom) {
      if (pBottom>aCheese.aTop) {
        if (pLeft<aCheese.aRight) {
          if (pRight>aCheese.aLeft) {
            println("cheese collision!");
            //remyhealth=remyhealth+1;
            cheese=cheese+1;
            if (cheese==cheeseMax) {
              println("WIN!");
            }
          }
        }
      }
    }
  }

  void rottenFoodCollision(RottenFood aRottenFood) {
    // collision detection if statements
    if (pTop<aRottenFood.dBottom) {
      if (pBottom>aRottenFood.dTop) {
        if (pLeft<aRottenFood.dRight) {
          if (pRight>aRottenFood.dLeft) {
            println("rotten food collision!");
            remyhealth=remyhealth-1;
            if (remyhealth==0 ) {
              println("LOST!");
            }
          }
        }
      }
    }
  }



  void updatePlayerBounds() {
    pTop = y;
    pBottom = y+h;
    pRight=x+w;
    pLeft=x;
  }
}
