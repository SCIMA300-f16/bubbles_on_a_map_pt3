void bar() {
  for (int i=0; i<data.length; i++) { // call driven miles data again
    String [] splitD = split(data[i], ",");
   
    if(int(splitD[6]) <= b1){ // if miles driven is less than this number fill green
      fill(0,255,0);
    }
    else if (int(splitD[6])>=b2){ // if miles driven is more than this number fill red
      fill(255,0,0);
    }
   
    else{ // anything else fill white
      fill(255);
  }
   rect(50, ypos[1], int(splitD[6]), 16); // draw bars
    
    ypos[1]+=40; // y offset 40 for spacing
    
}
}