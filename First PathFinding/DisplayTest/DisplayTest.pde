import processing.net.*;

JSONObject playerData;
JSONObject targetData;

PVector player;
PVector target;

int distance;

void setup() {
  size(400, 400);
  
  playerData = loadJSONObject("..\\PathFinding\\data\\player.json");
  targetData = loadJSONObject("..\\PathFinding\\data\\target.json");
  
  player = new PVector(playerData.getInt("x"), playerData.getInt("y"));
  target = new PVector(targetData.getInt("x"), targetData.getInt("y"));
  
  distance = int(PVector.dist(target, player));
}

void draw() {
  background(0);
  
  if (playerData != null || targetData != null || playerData.size() != 0 || targetData.size() != 0) {
    
    if (playerData != null && targetData != null) {
      playerData = loadJSONObject("..\\PathFinding\\data\\player.json");
      targetData = loadJSONObject("..\\PathFinding\\data\\target.json");
      
      player.x = playerData.getInt("x");
      player.y = playerData.getInt("y");
  
      target.x = targetData.getInt("x");
      target.y = targetData.getInt("y");
  
      distance = int(PVector.dist(target, player));
    }
  }
  
  // Display the distance
  textSize(20);
  textAlign(CENTER);
  text("Distance: " + distance, width/2, height/2);
}
