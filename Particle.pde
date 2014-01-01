class particle {
  PVector pos = new PVector(random(width), random(height));
  PVector vel = new PVector(0,0);
   
  void check(float clump, float spd, float myacc, float slice, int c) {
    noiseDetail(8,0.5);
    float x = noise(pos.x/clump, pos.y/clump, slice)*width;
    float y = noise(pos.x/clump, pos.y/clump, 200-slice)*height;
    
    PVector tmp = new PVector(x, y);
    PVector acc = PVector.sub(tmp, pos);
    
    acc.normalize();
    
    acc.mult(myacc);
    //acc.mult( float(mouseX)/width );
    
    vel.add(acc);
    vel.limit(spd);
    
    pos.add(vel);
    
    stroke(c);  
    fill(c);
    
    float convertx = pos.x * zoom - width * (zoomf * zoom -zoomf);
    float converty = pos.y * zoom - height * (zoomf * zoom -zoomf);
    point(convertx,converty);
    //ellipse(convertx, converty, 2,2);
  }
}
