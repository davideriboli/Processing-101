/*

http://arcanelab.com


*/

int halfw;
int halfh;

void setup()
{
  size(480,350);
  halfw = width/2;
  halfh = height/2;
  smooth();
}

float d = 0.0;
float PICONST = 2 * PI / 380;

void draw()
{
  float szirom = 10;
  float mouseXconst = (mouseX/(float)width);
  background(0);
  int i=0;
  while(i<380*4*mouseXconst)
  {
    float t = i*PICONST/4/mouseXconst;
    float sint = sin(t);
    float cost = cos(t);

    float r = cos(t*1)*128+128;
    float g = sin(t*3)*128+128;
    float b = sin(t*2)*128+128;
    stroke(r,g,b,128);
    
    float originx = halfw+sint*50;
    float originy = halfh+cost*50;
    float destx = halfw+sint*halfh*0.85;
    float desty = halfh+cost*halfh*0.85;
    
    float sziromConst = t*szirom+d;
    float finalx = destx + sin(sziromConst) * 20;
    float finaly = desty + cos(sziromConst) * 20;

    line(originx, originy, finalx, finaly);
    i++;
  } // while
  
  d += (mouseY/(float)height)*0.5 - 0.25;
}
