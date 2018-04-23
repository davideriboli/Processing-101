/*
THIS IS A PROCESSING SKETCH
Please change file suffix from .java to .pde
before running!

Coded by unknown student during 
"Digital Applications" class 2013/2014
Academy of Fine Arts Urbino Italy
Prof. Davide Riboli
*/

PImage img;

String nome = "muta";  // Nome del file.
String formato = ".jpg"; // Nome dell'estensione file.
float nc = random(126,255);  // nc sta per: numero colore.  Valore random da 126 a 255 che determina il valore massimo dei tre colori rgb. valore sotto il quale l'effetto funziona.
float nc1 = random(125);   // nc1 sta per: numero colore1. Valore random da 0 a 125 che determina il valore minimo del rosso(r). valore oltre il quale l'effetto funziona.
float nc2 = random(125);   // nc2 sta per: numero colore2. Valore random da 0 a 125 che determina il valore minimo del verde(g). valore oltre il quale l'effetto funziona.
float nc3 = random(125);   // nc3 sta per: numero colore3. Valore random da 0 a 125 che determina il valore minimo del blu  (b). valore oltre il quale l'effetto funziona.
void setup() {
  img = loadImage(nome + formato);
  size(443, 590);a
  image ( img, 0, 0);
  frameRate(20);
}

void draw() {



  for ( int y = 0; y < height; y+=6) {
    for (int x = 0; x < width; x+=6) {
      color r = (int)red(get(x, y));
      color g = (int)green(get(x, y));
      color b = (int)blue(get(x, y));
      //      stroke(pix);
      noStroke();
      if (r > nc1 && r < nc && g > nc2 && g < nc && b > nc3 && b < nc) {  // impostazione del range entro il quale il programma lavora.
        fill(r, g, b, 100);
        stroke(r,g,b);
        line(x+random(-5,5), y+random(-5,5), x+random(-16, 16), y+random(-6, 6)); //forma geometrica che genera la trasforazione, variando i valori farierà l'effetto.. di molto anche.
      }
    }
  }
  //nc+=0.2;
}

void keyPressed() {
  if (key == 'a') { // "a" like alt! Stop!
    noLoop();   //ferma l'effetto in atto
  }
  if (key == 'r') { // "r" like Restart!
    //fa ripartire l'effetto con altri valori numerici per i colori
    nc = random(255);
    float nc1 = random(255);
    float nc2 = random(255);
    float nc3 = random(255);
    loop();
  }

  if (key == 'i') {
    image ( img, 0, 0);  // resetta l'immagine di partenza e ferma l'effetto. per farlo ripartire premere "r"
    noLoop();
  }
  if (key == 's') {
    save(nome + hour()+ minute() + second() + formato); // salva l'immagine con il suo nome più l'ora il minuto e il secondo in cui viene salvata.
  }
}
