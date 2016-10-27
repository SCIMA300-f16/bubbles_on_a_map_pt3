// Be sure to put locations.tsv and names.tsv
// from b_getting_locations into your current data folder!


//introduce variables and objects
PImage mapImage;
Table locationTable; //this is using the Table object
int rowCount;
float dataMin = MAX_FLOAT;
float dataMax = MIN_FLOAT;

//global variables assigned values in drawData()
float closestDist;
String closestText;
float closestTextX;
float closestTextY;

void setup() {
  size(1316, 974);
  mapImage = loadImage("map1.jpg");

  //assign tables to object
  locationTable = new Table("GTA_locations.tsv");  
  
  // get number of rows and store in a variable called rowCount
  rowCount = locationTable.getRowCount();
  //count through rows to find max and min values in random.tsv and store values in variables
}

void draw() {
  background(255);
  image(mapImage, 0, 0);

  closestDist = MAX_FLOAT;

//count through rows of location table, 
  for (int row = 0; row<rowCount; row++) {
    //assign id values to variable called id
   String id = locationTable.getRowName(row);
    //get the 2nd and 3rd fields and assign them to
    float x = locationTable.getFloat(id, 1);
    float y = locationTable.getFloat(id, 2);
    //use the drawData function (written below) to position and visualize
    drawData(x, y,id);
  }

//if the closestDist variable does not equal the maximum float variable....
  if (closestDist != MAX_FLOAT) {
    fill(255);
    textAlign(CENTER);
    text(closestText, closestTextX, closestTextY);
  }
}

//we write this function to visualize our data 
// it takes 3 arguments: x, y and id
void drawData(float x, float y, String id) {
//value variable equals second field in row
  float value = locationTable.getFloat(id, 1);
  float radius = 0;
//if the value variable holds a float greater than or equal to 0
  if (value>=0) {
    //remap the value to a range between 1.5 and 15
 
    //and make it this color
   fill(#4422CC);
 } else {
    //otherwise, if the number is negative, make it this color.

   fill(#FF4422);
  }
  //make a circle at the x and y locations using the radius values assigned above
  ellipseMode(RADIUS);
  ellipse(x, y, 5, 5);

  float d = dist(x, y, mouseX, mouseY);

 //if the mouse is hovering over circle, show information as text
  if ((d<radius+4) && (d<closestDist)) {
   closestDist = d;
   String name = locationTable.getString(id,0);
   closestText = name +" "+value;
   closestTextX = x;
    closestTextY = y-radius-4;
  }
}