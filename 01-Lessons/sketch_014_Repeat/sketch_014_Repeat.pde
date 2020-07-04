
//Stuff like this...
  size(200, 200);
  
//Verticals
 line(20, 0, 20, height);
 line(40, 0, 40, height);
 line(60, 0, 60, height);
 line(80, 0, 80, height);
 line(100, 0, 100, height);
 line(120, 0, 120, height);
 line(140, 0, 140, height);
 line(160, 0, 160, height);
 line(180, 0, 180, height);
 
//Horizontals
 line(0, 20, width, 20);
 line(0, 40, width, 40);
 line(0, 60, width, 60);
 line(0, 80, width, 80);
 line(0, 100, width, 100);
 line(0, 120, width, 120);
 line(0, 140, width, 140);
 line(0, 160, width, 160);
 line(0, 180, width, 180);
 
//... should be written this way.
/*
size(200, 200);
for (int i=20; i<200; i+=20) {
  line(i, 0, i, height);
  line(0, i, width, i);
}
*/
