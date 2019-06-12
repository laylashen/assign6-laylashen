class Robot extends Enemy {
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float currentSpeed = 2f;

  Robot(float x, float y){
  super(x,y);
  }
  
  void display(){
    //image(robot, x, y);
    int direction = (currentSpeed > 0) ? RIGHT : LEFT;
    
    pushMatrix();
    translate(x, y);
    if (direction == RIGHT) {
      scale(1, 1);
      image(robot, 0, 0, w, h); 
    } else {
      scale(-1, 1);
      image(robot, -w, 0, w, h); 
    }
    popMatrix(); 
  }

  void update(){
    //boolean checkX = ( currentSpeed > 0 && player.x + w/2 > x+HAND_OFFSET_X_FORWARD )
    //        || ( currentSpeed < 0 && player.x + w/2 < x-HAND_OFFSET_X_BACKWARD );
  
    //boolean checkY = player.y >= y-(2*SOIL_SIZE) && player.y <= y+(2*SOIL_SIZE); 
    //if(checkX && checkY){
      x += currentSpeed ;
      if (x < 0 || x > width - w) { 
        currentSpeed *= -1 ;
      }
    }
  //}
  
  void checkCollision(Player player){

    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
      player.hurt();
    }
  }
}
