//voglio dare vita ad un Oracolo. Ogni volta che cliccherò salteranno fuori tre rune.
//questo codice è stato scritto completamente da me.

//utilizzo un Array per poter prendere le 24 rune che ho precedentemente disegnato.
PImage[] picArray = new PImage[3];
int count = 24;
int nImage = 3;
int screenWidth = 900;
int screenHeight = 900;

void settings(){
      size(screenWidth,screenHeight);
}

void setup(){
    noLoop();
}

void draw(){
    background(74, 180, 113);
    for(int i = 0; i < picArray.length; i ++){
      if(picArray[i] != null){
         image(picArray[i],screenWidth/3*i,screenHeight/3,width/3,height/3);
      }
    }
}
//quì dico quante immagini deve prendere a ogni click
void mouseClicked(){
  if(count % 3 == 0){
      count = 0;
   }
  picArray[count] = loadImage(int(random(1,nImage+1))+".png");  
  count++;
  loop();
}
