import processing.sound.*;

SoundFile homePageSound;
SoundFile level1Sound;
SoundFile level2Sound;
SoundFile winSound;
SoundFile lostSound;

//declare my image var
PImage parisImg;
PImage kitchenImg;
PImage sadremyImg;
PImage happyremyImg;
PImage cheeseImg;

PImage remyImage;

//make my timer vars
int startTime;
int endTime;
int interval;

//state vars
int state= 0;
//text
int text;
int textSize;


//declare my vars
ArrayList <Cheese> cheeseList;
ArrayList <RottenFood> rottenFoodList;

//make an individual player
Remy remy1;
//make an individual apple
Cheese cheese1;
Cheese cheese2;
//make an individual donut
RottenFood rottenFood1;
RottenFood rottenFood2;

int cheeselives;
int remyhealth;

void setup() {
  size(800, 600);

  cheeselives=5;
  remyhealth=100;

  //intializing my images
  remyImage= loadImage("remy.png");
  remyImage.resize(100, 150);

  happyremyImg= loadImage("happyremy.jpeg");
  happyremyImg.resize(800, 600);
  sadremyImg=loadImage("sadremy.jpeg");
  sadremyImg.resize(800, 600);
  cheeseImg=loadImage("cheese.png");
  cheeseImg.resize(50, 50);

  //initialize my vars

  remy1 = new Remy ();
  cheese1 =new Cheese();
  cheese2 =new Cheese();
  rottenFood1 = new RottenFood();
  rottenFood2 = new RottenFood();

  //initialize my image var
  parisImg=loadImage("paris2.jpeg");
  kitchenImg=loadImage("kitchen.JPG");

    // sound for homePage
  homePageSound= new SoundFile(this, "homePage.mp3");
  //homePage.play();
  homePageSound.rate(1.0);
  homePageSound.amp(1.0);

  //sound for level1
  level1Sound= new SoundFile(this, "level1.mp3");
  //level1.play();
  level1Sound.rate(1.0);
  level1Sound.amp(1.0);

    //sound for level2
  level2Sound= new SoundFile(this, "level2.mp3");
  //level2.play();
  level2Sound.rate(1.0);
  level2Sound.amp(1.0);

    //sound for win
  winSound= new SoundFile(this, "win.mp3");
  //winSound.play();
  winSound.rate(1.0);
  winSound.amp(1.0);

      //sound for lost
  lostSound= new SoundFile(this, "lost.mp3");
  //lostSound.play();
  lostSound.rate(1.0);
  lostSound.amp(1.0);


  cheeseList = new ArrayList<Cheese>();
  cheeseList.add(cheese1);
  cheeseList.add(cheese2);

  rottenFoodList = new ArrayList<RottenFood>();
  rottenFoodList.add(rottenFood1);
  rottenFoodList.add(rottenFood2);
}

void draw() {
  background(42);


  println(state);

  //my switch statement/finite state machine
  switch(state) {

    //START SCREEN
  case 0:

     //sound for lose
    if (lostSound.isPlaying()==true) {
      lostSound.stop();
    }

     //sound for win
    if (winSound.isPlaying()==true) {
      winSound.stop();
    }
    
     //sound for level 1
    if (level1Sound.isPlaying()==true) {
      level1Sound.stop();
    }
    
    //sound for level 2
    if (level2Sound.isPlaying()==true) {
      level2Sound.stop();
    }

       //sound for homePage
    if (homePageSound.isPlaying()==false) {
      homePageSound.play();
    }


    //resize my image
    parisImg.resize(800, 600);

    background(parisImg);
    image(cheeseImg, 450, 108);

    //level 1 rectangle
    fill(#791D12);
    rect(180, 400, 180, 80);

    fill(#FFE06F);
    textSize(40);
    text("Level 1:", 200, 440);

    fill(#3B0909);
    textSize(30);
    text("Press 1 ", 225, 470);

    //level 2 rectangle
    fill(#791D12);
    rect(480, 400, 180, 80);

    fill(#FFE06F);
    textSize(40);
    text("Level 2:", 500, 440);

    fill(#3B0909);
    textSize(30);
    text("Press 2 ", 520, 470);


    //text Remy's Cheese Hunt

    textSize(70);
    fill(#791D12);
    text("Remy's", 130, 70);

    textSize(80);
    fill(#FFE06F);
    text("Cheese", 200, 150);

    textSize(70);
    fill(#DE4924);
    text("Hunt!", 350, 210);


    remy1.remyhealth = 100;
    remy1.cheeselives = 0;
    menuReset();

    break;


    //GAME SCREEN Level 1
  case 1:

    //sound for homePage
    if (homePageSound.isPlaying()==true) {
      homePageSound.stop();
    }

     //if(level1sound for level1
    if (level1Sound.isPlaying()==false) {
      level1Sound.play();
    }

    kitchenImg.resize(800, 600);
    background(kitchenImg);
    game1();
    println("case 1");

    if (remy1.remyhealth==remy1.healthDie ) {
      state = 4;
    }
    if (remy1.cheese==remy1.cheeseMax ) {
      state = 3;
    }

    break;



    //GAME SCREEN Level 2
  case 2:

//if(level1sound for level1
    if (homePageSound.isPlaying()==true) {
      homePageSound.stop();
    }
    
     //if(level1sound for level1
    if (level1Sound.isPlaying()==true) {
      level1Sound.stop();
    }

     //sound for level2
    if (level2Sound.isPlaying()==false) {
      level2Sound.play();
    }

    kitchenImg.resize(800, 600);
    background(kitchenImg);
    game2();

    if (remy1.remyhealth==remy1.healthDie  ) {
      state = 4;
    }
    if (remy1.cheeselives==remy1.cheeseMax ) {
      state = 3;
    }


    break;



    //WINNING SCREEN
  case 3:

     //if(level1sound for level1
    if (level1Sound.isPlaying()==true) {
      level1Sound.stop();
    }

       //sound for level2
    if (level2Sound.isPlaying()==true) {
      level2Sound.stop();
    }

    //sound for win
    if (winSound.isPlaying()==false) {
      winSound.play();
    }

    happyremyImg.resize(800, 600);
    background(happyremyImg);

    //back to main page rectangle
    fill(#791D12);
    rect(300, 500, 300, 70);
    fill(#FFE06F);
    textSize(30);
    text("Back to main page", 330, 530);

    fill(#FC9B38);
    textSize(20);
    text("Press m", 430, 560);

    textSize(80);
    fill(#FC9B38);
    text("Remy", 60, 80);

    textSize(100);
    fill(#F53939);
    text("LOVES", 60, 180);

    textSize(80);
    fill(#FC9B38);
    text("Cheese!", 60, 260);


    break;



    //Lose SCREEN
  case 4:

    //if(level1sound for level1
     if (level1Sound.isPlaying()==true) {
       level1Sound.stop();
     }

        //sound for level2
     if (level2Sound.isPlaying()==true) {
       level2Sound.stop();
     }

      //sound for lose
     if (lostSound.isPlaying()==false) {
       lostSound.play();
     }

    sadremyImg.resize(800, 600);                                 //???
    background(sadremyImg);

    //back to main page rectangle
    fill(#791D12);
    rect(300, 500, 300, 70);
    fill(#FFE06F);
    textSize(30);
    text("Back to main page", 330, 530);

    fill(#FC9B38);
    textSize(20);
    text("Press m", 430, 560);

    textSize(90);
    fill(#FFA54B);
    text("Remy", 570, 80);

    textSize(100);
    fill(#ED3932);
    text("HATES", 520, 180);

    textSize(90);
    fill(#FFA54B);
    text("Trash!", 560, 270);

    break;
  }
}


void keyPressed() {
  if (key== CODED) {
    if (keyCode == RIGHT) {
      remy1.isPlRight=true;
    }
    if (keyCode == LEFT) {
      remy1.isPlLeft=true;
    }
  }

  if (key=='1') {

    //make state cycle go back to beginning
    if (state==0) {
      state=1;
    } else
      state = 0;
  }

  if (key=='2') {

    //make state cycle go back to beginning
    if (state==0) {
      state=2;
    } else
      state = 0;
  }

  if (key=='m') {

    //make state cycle go back to beginning
    if (state==4) {
      state=0;
    } else
      state = 0;
  }

  if (key=='m') {

    //make state cycle go back to beginning
    if (state==5) {
      state=0;
    } else
      state = 0;
  }
}


void keyReleased() {
  if (key== CODED) {
    if (keyCode == RIGHT) {
      remy1.isPlRight=false;
    }
    if (keyCode == LEFT) {
      remy1.isPlLeft=false;
    }
  }
}

void game1() {


  fill(0, 0, 0);
  rect(0, 0, 370, 70);

  fill(0, 255, 0);
  text("Health= "+remy1.remyhealth, 10, 50);

  fill(0, 0, 0);
  rect(470, 0, 370, 70);

  fill(0, 255, 0);
  text("Cheese= "+remy1.cheese, 475, 50);

  for (Cheese aCheese : cheeseList) {
    aCheese.render();
    aCheese.move();
    aCheese.updateCheeseBounds();

    if (aCheese.y > height) {
      aCheese.x = int(random(200, 600));
      aCheese.y = int(random(-400, -100));
    }
  }

  if (cheese1.y > height) {
    cheeseList.remove(cheese1);
    Cheese addThis = new Cheese();
    cheeseList.add(addThis);
    println("hello");
  }

  for (RottenFood aRottenFood : rottenFoodList) {
    aRottenFood.render();
    aRottenFood.move();
    aRottenFood.updateRottenFoodBounds();

    if (aRottenFood.y > height) {
      aRottenFood.x = int(random(200, 600));
      aRottenFood.y = int(random(-400, -100));
    }
  }

  if (rottenFood1.y > height) {
    rottenFoodList.remove(rottenFood1);
    RottenFood addThis = new RottenFood();
    rottenFoodList.add(addThis);
    println("bye");
  }


  rottenFood1.render();
  rottenFood1.move();
  rottenFood1.updateRottenFoodBounds();

  remy1.cheeseCollision(cheese1);
  remy1.cheeseCollision(cheese2);
  remy1.rottenFoodCollision(rottenFood1);
  remy1.rottenFoodCollision(rottenFood2);
  remy1.updatePlayerBounds();

  remy1.render();
  remy1.moveRight();
  remy1.moveLeft();
}

void game2() {

  fill(0, 0, 0);
  rect(0, 0, 370, 70);

  fill(0, 255, 0);
  text("Health= "+remy1.remyhealth, 10, 50);

  fill(0, 0, 0);
  rect(470, 0, 370, 70);

  fill(0, 255, 0);
  text("Cheese= "+remy1.cheese, 475, 50);

  for (Cheese aCheese : cheeseList) {
    aCheese.render();
    aCheese.move();
    aCheese.updateCheeseBounds();

    if (aCheese.y > height) {
      aCheese.x = int(random(200, 600));
      aCheese.y = int(random(-400, -100));
    }
  }

  if (cheese1.y > height) {
    cheeseList.remove(cheese1);
    Cheese addThis = new Cheese();
    cheeseList.add(addThis);
    println("hello");
  }

  for (RottenFood aRottenFood : rottenFoodList) {
    aRottenFood.render();
    aRottenFood.move();
    aRottenFood.updateRottenFoodBounds();

    if (aRottenFood.y > height) {
      aRottenFood.x = int(random(200, 600));
      aRottenFood.y = int(random(-400, -100));
    }
  }

  if (rottenFood1.y > height) {
    rottenFoodList.remove(rottenFood1);
    RottenFood addThis = new RottenFood();
    rottenFoodList.add(addThis);
    println("bye");
  }


  rottenFood1.render();
  rottenFood1.move();
  rottenFood1.updateRottenFoodBounds();

  remy1.cheeseCollision(cheese1);
  remy1.cheeseCollision(cheese2);

  remy1.rottenFoodCollision(rottenFood1);
  remy1.rottenFoodCollision(rottenFood2);

  remy1.updatePlayerBounds();

  remy1.render();
  remy1.moveRight();
  remy1.moveLeft();
}


///////////////////////////////////////

void menuReset(){
  cheeselives=5;
  remyhealth=100;

  //intializing my images
  remyImage= loadImage("remy.png");
  remyImage.resize(100, 150);

  happyremyImg= loadImage("happyremy.jpeg");
  happyremyImg.resize(800, 600);
  sadremyImg=loadImage("sadremy.jpeg");
  sadremyImg.resize(800, 600);
  cheeseImg=loadImage("cheese.png");
  cheeseImg.resize(50, 50);

  //initialize my vars

  remy1 = new Remy ();
  cheese1 =new Cheese();
  cheese2 =new Cheese();
  rottenFood1 = new RottenFood();
  rottenFood2 = new RottenFood();

  //initialize my image var
  parisImg=loadImage("paris2.jpeg");
  kitchenImg=loadImage("kitchen.JPG");
  
  cheeseList = new ArrayList<Cheese>();
  cheeseList.add(cheese1);
  cheeseList.add(cheese2);

  rottenFoodList = new ArrayList<RottenFood>();
  rottenFoodList.add(rottenFood1);
  rottenFoodList.add(rottenFood2);
}
