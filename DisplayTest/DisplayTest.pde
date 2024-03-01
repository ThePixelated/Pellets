void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  
  // Create two vectors
  PVector vector1 = new PVector(2, 4);
  PVector vector2 = new PVector(2, 4);
  
  // Calculate the distance between the vectors
  float distance = PVector.dist(vector1, vector2);
  
  // Display the distance
  textSize(20);
  textAlign(CENTER);
  text("Distance: " + distance, width/2, height/2);
}
