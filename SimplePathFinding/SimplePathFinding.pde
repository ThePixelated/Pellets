float manyRows = 3;
float manyColumn = 3;
float wFixed;
float hFixed;

int index = 1;

void setup() {
  //size(800, 600, P2D);
  surface.setResizable(true);
  windowResize(800, 600);
  
  wFixed = float(width) / manyRows;
  hFixed = float(height) / manyColumn;
  
  //println(wFixed);
}

//int indexX = 0;
//int indexY = 1;

void target() {
  fill(255, 0, 0);
  
  rect(wFixed * index, hFixed * index, wFixed, hFixed);
  //rect(wFixed * x, hFixed * index, wFixed, hFixed);
  //rect(wFixed * x, hFixed * index, wFixed, hFixed);
  fill(255);
}

void draw() {
  background(204);
  
  //rect();  
  
  displayGrid();
  target();
  displayHeightMap();
  //test();
}

void displayGrid() {
  for (int i = 0; i < manyColumn; i++) {
    for (int j = 0; j < manyRows; j++) {
      fill(235);
      //if (i == 0)
      rect(j * wFixed, i * hFixed, wFixed, hFixed);
    }
  }
}

//void test() {
//  for (int j = 0; j < indexX; j++) {
//    rect(j * wFixed, indexY * hFixed, wFixed, hFixed);
//  }
//}

void mousePressed(MouseEvent event) {
  println(event.getCount());
  //indexX++;
  
  //if (indexX > manyRows) {
  //  indexY++;
  //  indexX = 0;
  //}
  
  ////println(indexX);
  
  //if (indexY >= manyColumn) indexY = 0;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e);
  
  if (e == 1 && manyRows < height) {
    manyRows += 2;
    manyColumn += 2;
    
    wFixed = float(width) / manyRows;
    hFixed = float(height) / manyColumn;
    
    index++;
    
    println(manyRows, manyColumn);
  }
  
  else if (e == -1 && manyRows > 1) {
    manyRows -= 2;
    manyColumn -= 2;
    
    wFixed = float(width) / manyRows;
    hFixed = float(height) / manyColumn;
    
    index--;

    println(manyRows, manyColumn);
  }
}

void displayHeightMap() {
  int rectWidth = 17  ;
  int rectHeight = height - 70;
  
  rect(width - (rectWidth + 10), height / 2 - rectHeight / 2, rectWidth, rectHeight);
  
  //for (int i = 0; i < height / 2; i++) {
  //  fill(0);
  //  //rect(width - 30, (i + 1) * height / 2 - rectHeight / 2 + 20, rectWidth, rectHeight / (height / 2));
  //  rect(width - 30, i * rectHeight / (height / 2) + height / 2 - rectHeight / 2, rectWidth, 0.1);
  //  fill(255);
  //}
  
  int barSize = 5;
  
  fill(255, 225, 0);
  //rect(width - 30, (i + 1) * height / 2 - rectHeight / 2 + 20, rectWidth, rectHeight / (height / 2));
  rect(width - (rectWidth + 10), (index * rectHeight / (height / 2)) + (height / 2 - rectHeight / 2) - ((barSize / 2) - 0.1), rectWidth, barSize);
  fill(255);
}
