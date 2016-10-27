
class car_field { // car_field declaration
  int x;
  int y;
  int w;
  int h;
  color c;

car_field(int x_, int y_, int w_, int h_, color c_) { // constructor
  x=x_;
  y=y_;
  w=w_;
  h=h_;
  c=c_;
}
void show(){ // show function
  
 fill(c);
rect(x,y,w,h);
}
}