PImage yi;

particle p[];

int num = 10000;
float zoom = 10;
float zoomf = .5;

float slice = 0;
float slice2 = 0;

slider s[];

void setup() {
  size(640, 480);
  noStroke();
  smooth();
  yi = loadImage("i.jpg", "jpg");
  p = new particle[num];
  for (int i=0; i<num; i++) {
    p[i] = new particle();
  }
  
  s = new slider[9];
  
  s[0] = new slider(10, 30, 150, 10, "Yin flock", .1);
  s[1] = new slider(10, 70, 150, 10, "Yin speed", .1);
  s[2] = new slider(10, 110, 150, 10, "Yin acc", .1);
  
  s[3] = new slider(10, 150, 150, 10, "Yang flock", .1);
  s[4] = new slider(10, 190, 150, 10, "Yang speed", .1);
  s[5] = new slider(10, 230, 150, 10, "Yang acc", .1);
  
  s[6] = new slider(10, 270, 150, 10, "Particle Count", .1);
  s[7] = new slider(10, 310, 150, 10, "Slice", .1);
  s[8] = new slider(10, 350, 150, 10, "Zoom", .5);
}

void draw() {

  //image(yi, 0, 0);
  fill(0, 0, 0, 50);
  rect(0, 0, width, height);

  yi.loadPixels();
  
  zoom = s[8].val * 10;
  
  
  for (int i=0; i<num*s[6].val; i++) {

    int index = int(p[i].pos.x * zoom - width * (zoomf * zoom -zoomf)) + int(p[i].pos.y * zoom - height * (zoomf * zoom -zoomf))*width;

    float bright = 0.0;

    if ( index > 0 && index < width * height ) {
      bright = brightness(  yi.pixels[ index  ]  );
    }
    //println(bright);
    if ( bright < 200 ) {
      p[i].check( 50*s[0].val, 50*s[1].val, 1*s[2].val,  slice, 80);
    }
    else {
      p[i].check( 5*s[3].val, 5*s[4].val, 1*s[5].val, slice, 255);
    }
    //slice += 1/(s[7].val*20000);
    //slice2 += slice/1000;
    slice += .00005;
  }
  
  if(slice > 200){
    slice = 0;
  }
  
  if(mousePressed){
   println(slice); 
  }
  
  if(keyPressed && keyCode == DOWN){
  
  s[0].check(50*s[0].val);
  s[1].check(50*s[1].val);
  s[2].check(1*s[2].val);
  s[3].check(5*s[3].val);
  s[4].check(5*s[4].val);
  s[5].check(1*s[5].val);
  s[6].check(num*s[6].val);
  s[7].check(s[7].val*20000);
  s[8].check(s[8].val*10);
  
  }
}

