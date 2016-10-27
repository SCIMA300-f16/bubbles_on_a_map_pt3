//andrews branch

//Defining Variables
//integers
int [] ypos = {20, 7, 35, 45};
int [] xpos = {10, 50, 125, 125};
int [] miles;
int y = 20;
int c = 0;
int b1 = 33;
int b2 = 47;
//int counter = 0;
//int count2=0;
float [] speed; //= {32, 43, 52, 56, 55, 44, 48, 24, 29, 33, 39};

//float speed;

//color
color tan = color(222, 213, 166);

//bools
boolean go = false;

//strings
String [] data;
String title= "The Last Leg";

//objects
car_field bg;
Car [] days = new Car [11];

void setup() {
  background(0);
  size(500, 495);
  data = loadStrings("A1a_Shoji_Andrew.txt"); //load data
  text(title, 250, 20);
 
  for (int i=0; i<days.length; i++) {
    days[i] = new Car(color(tan), xpos[3], (ypos[3] + (40*i)), speed[i]); //declare car array space by this amount of y
  }
  bg = new car_field(xpos[2], ypos[2], 350, 435, 255 ); // declare car field

  date(); // show dates
}
void draw() {
  bg.show();  // show car field
  bar(); // show bars
   //for (int i=0; i<data.length; i++) { // split data
   // String [] splitD = split(data[i], ",");
  ////  //rect(50, ypos[1], int(splitD[6]), 16);
  ///speed [i] = (int(splitD[6])*.01);
  //speed = (float(splitD[6])*.01); // call index 6 (miles driven) and use for speed
  //}

  for (int i=0; i<days.length; i++) {
    days[i].display(); // show cars
    if (go == true) { // if mouse clicked begin car movements
      days[i].move();
    } else if (go== false) { // if mouse clicked again, stop car movements
      days[i].display();
    }
  }
}
void mousePressed() { // boolean flipflop
  go = ! go;
}