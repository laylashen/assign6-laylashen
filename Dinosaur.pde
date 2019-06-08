class Dinosaur extends Enemy {
  
  Dinosaur(float x, float y){
    super(x,y);
  }
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed=1;
  float currentSpeed =speed;

  void display(){
    image(dinosaur, x, y);
        int direction = (speed > 0) ? RIGHT : LEFT;
    
    pushMatrix();
    translate(x, y);
    if (direction == RIGHT) {
      scale(1, 1);
      image(dinosaur, 0, 0, w, h); 
    } else {
      scale(-1, 1);
      image(dinosaur, -w, 0, w, h); 
    }
    popMatrix();    
  }

  void update(){
    x += currentSpeed;
    if(y==player.y) {
      currentSpeed=TRIGGERED_SPEED_MULTIPLIER;
    }else{
      currentSpeed = speed;
    }
    
    if(x>width ||x<0){
      currentSpeed*=-1;
    }
  }
}
