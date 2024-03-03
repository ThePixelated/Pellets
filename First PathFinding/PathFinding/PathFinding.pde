class Entity {
  int x;
  int y;
  int size;
  
  Entity(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void render(color c) {
    fill(c);
    circle(x, y, size);
    fill(255);
  }
}

Entity target;
Entity player;

int speed = 1;

JSONObject playerData;
JSONObject targetData;

void setup() {
  size(800, 600, P2D);
  smooth();
  
  player = new Entity(40, 50, 30);
  target = new Entity(int(random(12, width - 12)), int(random(12, height - 12)), 12);
  
  playerData = loadJSONObject("data/player.json");
  targetData = loadJSONObject("data/target.json");
  
  playerData.setInt("x", player.x);
  playerData.setInt("y", player.y);
  saveJSONObject(playerData, "data/player.json");
  
  targetData.setInt("x", target.x);
  targetData.setInt("y", target.y);
  saveJSONObject(targetData, "data/target.json");
  
  //String sketchPath = "..\\DisplayTest\\DisplayTest.pde";
  
  //String[] command = {"processing-java", "--sketch=" + sketchPath, "--run"};
  
  //exec(command);
  
  launch("..\\DisplayTest\\DisplayTest.pde");
}

void draw() {
  background(250);
  
  straightFinding();
  
  pos();
  lineRender();
  
  target.render(color(255, 0, 0));
  player.render(color(255));
}

void mousePressed() {
  target.x = mouseX;
  target.y = mouseY;
  
  targetData.setInt("x", target.x);
  targetData.setInt("y", target.y);
  saveJSONObject(targetData, "data/target.json");
}

void straightFinding() {
  // X axis
  if (abs((player.x + 1) - target.x) < abs((player.x - 1) - target.x)) {
    player.x += speed;
  } else {
    player.x -= speed;
  }
  
  // Y axis
  if (abs((player.y + 1) - target.y) < abs((player.y - 1) - target.y)) {
    player.y += speed;
  } else {
    player.y -= speed;
  }
  
  playerData.setInt("x", player.x);
  playerData.setInt("y", player.y);
  saveJSONObject(playerData, "data/player.json");
}

void lineRender() {
  stroke(255, 145, 0);
  line(player.x, player.y, target.x, target.y);
  stroke(0);
}

void pos() {
  int temp = 4;
  boolean xCondition = (player.x + temp >= target.x) && (player.x - temp <= target.x);
  boolean yCondition = (player.y + temp >= target.y) && (player.y - temp <= target.y);
  
  if (xCondition && yCondition) {
    target.x = int(random(40, width - 40));
    target.y = int(random(40, height - 40));
    
    targetData.setInt("x", target.x);
    targetData.setInt("y", target.y);
    saveJSONObject(targetData, "data/target.json");
  }
}
