//Vado a creare un'animazione basandomi sul seno e il coseno.
//credit: https://www.youtube.com/watch?v=Th7m7QEeUbI
void setup() {
  //imposto la mia area di lavoro
  size (900, 900);
  background(0);
}

void draw() {
  //vado a decidere quanto voglio che siano alte le linee disegnate
  translate(width/2, height/2);
  float mag = 400;
  float s = 2;
  noStroke();
  for (int i = 0; i < 100; i++) {
    float w = map(sin(radians(frameCount)), -1,1,-100,100);
    float wave1 = map(tan(radians(frameCount*0.7 + 1 + w)), -1, 1, -mag, mag);
    float wave2 = map(cos(radians(frameCount + i)), -1, 1, -mag, mag);
    float c = map(sin(radians(frameCount * 3 + i)), -1, 1, 3, 200);
    //Imposto colore
    fill(255, 0, 0);
    rect(wave1, wave2, s, s);
  }
}
