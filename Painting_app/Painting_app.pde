//Jerry Feng
//2-3
//2022-02-28

PGraphics canvas, preview, toolbar;
PImage GTA, circleIcon, lineIcon;
color red = #FF0000;
color orange = #FFB700;
color yellow = #FFFF00;
color green = #00FF00;
color blue = #0000FF;
color pink = #FFC0CB;
color purple = #800080;
color white = #FFFFFF;
color black = #000000;
color gray = #808080;
color draw;
color stroke;
button b1 = new button(10, 10, 80, 30, red);
button b2 = new button(10, 50, 80, 30, orange);
button b3 = new button(10, 90, 80, 30, yellow);
button b4 = new button(10, 130, 80, 30, green);
button b5 = new button(10, 170, 80, 30, blue);
button b6 = new button(10, 210, 80, 30, pink);
button b7 = new button(10, 250, 80, 30, purple);
button b8 = new button(10, 290, 80, 30, black);
button b9 = new button(10, 620, 80, 30, gray);
slider s = new slider(470);
slider2 s2= new slider2(185);
float thickness;
float shade;
float drawShade;
boolean refresh = false;

void setup() {
  size( 1200, 800);
  canvas = createGraphics (1200, 800);
  preview = createGraphics (1200, 800);
  toolbar = createGraphics ( 1200, 800);

  shade = 0;
  background(white);
  GTA = loadImage("Mc.png");
  circleIcon = loadImage("circle2.png");
  //lineIcon = loadImage("");
}

void draw() {
  if (refresh) {
    background(white);
    refresh = false;
  }
  shade = map(s.ypos, 350, 595, 0, 225);
  thickness = map(s2.xpos, 135, 335, 1, 50);
  drawShade = map(s.ypos, 350, 595, red, orange);

  toolbar.beginDraw();
  imageMode(CORNER);
  toolbar.strokeWeight(5);
  toolbar.stroke(black);
  toolbar.fill(gray);
  toolbar.rect( 0, 0, 100, 800);
  toolbar.rect(100, 0, 1100, 75);
  imageMode(CENTER);
  toolbar.image(circleIcon, 400, 15, 50, 50);
  imageMode(CORNER);
  b1.draw();
   if ( mouseX > 10 && mouseX < 90 && mouseY > 50 && mouseY < 80) {
    stroke = #FFFFFF;
  }
  else {
    stroke = 0;
  }
  b2.draw();
  if ( mouseX > 10 && mouseX < 90 && mouseY > 90 && mouseY < 120) {
    stroke = #FFFFFF;
  }
  else {
     stroke = 0;
  }
  b3.draw();
   if ( mouseX > 10 && mouseX < 90 && mouseY > 130 && mouseY < 160) {
    stroke = #FFFFFF;
  }
  else {
    stroke = 0;
  }
  b4.draw();
 if ( mouseX > 10 && mouseX < 90 && mouseY > 170 && mouseY < 200) {
    stroke = #FFFFFF;
  }
  else {
    stroke = 0;
  }
  b5.draw();
  if ( mouseX > 10 && mouseX < 90 && mouseY > 210 && mouseY < 240) {
    stroke = #FFFFFF;
  }
  else {
    stroke = 0;
  }
  b6.draw();
  if ( mouseX > 10 && mouseX < 90 && mouseY > 250 && mouseY < 280) {
    stroke = #FFFFFF;
  }
  else {
    stroke = 0;
  }
  b7.draw();
  if ( mouseX > 10 && mouseX < 90 && mouseY > 290 && mouseY < 320) {
    stroke = #FFFFFF;
  }
  else {
    stroke = 0;
  }
  b8.draw();
  if ( mouseX > 10 && mouseX < 90 && mouseY > 10 && mouseY < 40) {
    stroke = #FFFFFF;
  }
  else {
    stroke = 0;
  }
  //b9.draw();
  toolbar.stroke(black);
  toolbar.fill(gray);
  toolbar.rect(10, 630, 80, 30);
  toolbar.stroke(white);
  toolbar.fill(white);
  toolbar.textAlign( CENTER, CENTER);
  toolbar.textSize(25);
  toolbar.text("New", 50, 640);
  toolbar.strokeWeight(5);
  toolbar.stroke(black);
  toolbar.fill(black);
  s.draw();
  s2.draw();
  //image(GTA, 370, 20, 50, 50);
  toolbar.fill(gray);
  toolbar.rect( 10, 680, 80, 30);
  toolbar.fill(white);
  toolbar.text("Load", 50, 690);
  toolbar.fill(gray);
  toolbar.rect( 10, 730, 80, 30);
  toolbar.fill(white);
  toolbar.text("Save", 50, 740);
  toolbar.endDraw();
  image(toolbar, 0,0 );
  //fill(0);
  //text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY);
}

class button {
  int xpos, ypos, xwidth, xheight;
  color clr;

  public button(int x, int y, int w, int h, color c) {
    xpos = x;
    ypos = y;
    xwidth = w;
    xheight = h;
    clr = c;
  }

  public void draw() {
    toolbar.fill(clr);
    toolbar.stroke(stroke);
    toolbar.rect( xpos, ypos, xwidth, xheight);
    if (mousePressed) {
      if (mouseX > xpos && mouseX < (xpos + xwidth) && mouseY > ypos && mouseY < (ypos + xheight)) {
        draw = clr;
      }
    }
  }
}

class slider {
  int ypos;

  public slider(int y) {
    ypos = y;
  }

  public void draw() {
    toolbar.strokeWeight(8);
    toolbar.fill(draw);
    toolbar.line( 50, 340, 50, 600);
    toolbar.circle( 50, ypos, 60);
  }
}

class slider2 {
  int xpos;

  public slider2(int x) {
    xpos = x;
  }

  public void draw() {
    toolbar.strokeWeight(4);
    toolbar.fill(black);
    toolbar.line( 135, 40, 335, 40);
    toolbar.circle( xpos, 40, thickness);
  }
}

void mousePressed() {
  if (mouseX > 10 && mouseX < 90) {
    if ( mouseY > 620 && mouseY < 650) {
      refresh = true;
    }
  }
}


void mouseReleased() {
  controlSlider();
  controlSlider2();
  if ( mouseX> 100 && mouseX< 1200 && mouseY > 75 && mouseY < 800) {
    stroke(draw);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (mouseX > 10 && mouseX < 90 && mouseY > 680 && mouseY <710) {
    selectInput("Click an image to load", "openImage");
  }
  if (mouseX > 10 && mouseX < 90 && mouseY > 730 && mouseY < 760) {
    selectOutput("Choose a name for your new image file", "saveImage");
  }
}

void mouseDragged() {
  controlSlider();
  controlSlider2();
  if ( mouseX> 100 && mouseX< 1200 && mouseY > 75 && mouseY < 800) {
    stroke(draw);
    strokeWeight(thickness);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      if (s.ypos < 595) {
        s.ypos = s.ypos +2;
      }
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      if (s.ypos > 350) {
        s.ypos = s.ypos -2;
      }
    }
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (s2.xpos > 135) {
        s2.xpos = s2.xpos -2;
      }
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (s2.xpos < 335) {
        s2.xpos = s2.xpos +2;
      }
    }
  }
}

void controlSlider() {
  if ( mouseY > 360 && mouseY < 585  && mouseX > 30 && mouseX < 70) {
    s.ypos = mouseY;
  }
}

void controlSlider2() {
  if ( mouseY > 10 && mouseY < 60  && mouseX > 135 && mouseX < 335) {
    s2.xpos = mouseX;
  }
}

void saveImage(File f) {
  if ( f != null) {
    PImage canvas = get( 105, 80, width-105, height-80);
    canvas.save(f.getAbsolutePath());
  }
}

void openImage(File f) {
  if (f !=null ) {
    int n = 0;
    while (n < 10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 0, 0);
      n = n +1;
    }
  }
}

