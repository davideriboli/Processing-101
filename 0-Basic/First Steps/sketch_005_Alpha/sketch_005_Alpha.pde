size(400,400);
background(255);
smooth();

//RED - Maximum Alpha
fill(255,0,0,255);
ellipse(width/3,height/2,width/3,height/3);

// GREEN - No Alpha
fill(0,255,0);
ellipse((width/3*2),height/2,width/3,height/3);

//BLUE - Half an Alpha
fill(0,0,255,127);
ellipse(width/2,height/2,width/3,height/3);
