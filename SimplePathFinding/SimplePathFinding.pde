int manyRows = 30;
int manyColumn = 30;
float wFixed;
float hFixed;

void setup() {
  size(800, 600, P2D);
  
  wFixed = float(width) / manyRows;
  hFixed = float(height) / manyColumn;
  
  //println(wFixed);
}

int indexX = 0;
int indexY = 1;

void draw() {
  background(204);
  
  //rect();
  
  displayGrid();
  test();
}

void displayGrid() {
  for (int i = 0; i < manyRows; i++) {
    for (int j = 0; j < manyColumn; j++) {
      fill(255);
      if (i == 0)
        rect(j * wFixed, i * hFixed, wFixed, hFixed);
    }
  }
}

void test() {
  for (int j = 0; j < indexX; j++) {
    rect(j * wFixed, indexY * hFixed, wFixed, hFixed);
  }
}

void mousePressed() {
  indexX++;
  
  if (indexX >= manyRows) {
    indexY++;
    indexX = 0;
  }
  
  if (indexY >= manyColumn) indexY = 0;
}
