//una mia fantastica fototessera al primo anno di università, riscritta con un passo della divina commedia
//credit: http://www.generative-gestaltung.de/2/sketches/?01_P/P_4_3_2_01
String inputText = "Da poppa stava il celestial nocchiero, tal che faria beato pur descripto, e più di cento spirti entro sediero. In exitu Isräel de Aegypto cantavan tutti insieme ad una voce con quanto di quel salmo è poscia scripto.";
int fontSizeMax = 15;
int fontSizeMin = 2;
int spacing = 10; // line height
float kerning = 0.7; // between letters


// se true, la grandezza del font non verrà mai cambiata
boolean fontSizeStatic = true;
//Se true, l'immagine verrà disegnata in bianco e nero
boolean blackAndWhite = false;

PImage img;

void setup() {
  //Carica immagine da disegnare
  img = loadImage("fototesserax4.jpg");
  size(533, 796);
  textSize(10);
  textAlign(LEFT, CENTER);
  print(img.width + " • " + img.height);
}

void draw() {
  background(0);

  int x = 0;
  int y = 10;
  //Sceglie randomicamente la prima lettera da disegnare
  float  counter = random(inputText.length());

  while (y < height) {
    // translate position (display) to position (image)
    img.loadPixels();
    // get current color
    var imgX = round(map(x, 0, width, 0, img.width));
    var imgY = round(map(y, 0, height, 0, img.height));
    var c = color(img.get(imgX, imgY));
    var greyscale = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);

    push();
    translate(x, y);

    /**
      Se il fontStatico è true disegna l'immagine con fontSize = fontmax, se blackAndWhite è true disegna lo sfondo in bianco e nero
    */
    if (fontSizeStatic) {
      textSize(fontSizeMax);
      if (blackAndWhite) {
        fill(greyscale);
      } else {
        fill(c);
      }
    } else {
      //Se fontSizeStatic è false randomizza il font ad ogni iterazione
      // greyscale to fontsize
      var fontSize = map(greyscale, 0, 255, fontSizeMax, fontSizeMin);
      fontSize = max(fontSize, 1);
      textSize(fontSize);
      if (blackAndWhite) {
        fill(255);
      } else {
        fill(c);
      }
    }
    //Estrae randomicamente una lettera dalla stringa in input tramite counter
    var letter = inputText.charAt(int(counter));
    //disegna la lettera
    text(letter, 0, 0);
    var letterWidth = textWidth(letter) + kerning;
    // aumenta la coordinata x della prossima lettera 
    x += letterWidth;

    pop();

    // permette di andare a capo a scrivere quando si ha raggiunto la width massima dell'immagine
    if (x + letterWidth >= width) {
      x = 0;
      y += spacing;
    }

    counter++;
    //Se il contatore ha raggiunto la lunghezza massima della stringa, resettalo a zero per rincominciare a scrivere la prima lettera della stringa
    if (counter >= inputText.length()) {
      counter = 0;
    }
  }
  //Interrompe il loop di processing, draw deve essere eseguito solametne al click del mouse
  noLoop();
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("png");
  // change render mode  
  if (key == '1') fontSizeStatic = !fontSizeStatic;
  // change color style
  if (key == '2') blackAndWhite = !blackAndWhite;
  print("fontSizeMin: " + fontSizeMin + ", fontSizeMax: " + fontSizeMax + ", fontSizeStatic: " + fontSizeStatic + ", blackAndWhite: " + blackAndWhite);
  loop();
}

void keyPressed() {
  // cambio la grandezza massima del font con la freccia su o giù
  if (keyCode == UP) fontSizeMax += 2;
  if (keyCode == DOWN) fontSizeMax -= 2;
  // cambio ls grandezza minima del font con la freccia destra e sinistra
  if (keyCode == RIGHT) fontSizeMin += 2;
  if (keyCode == LEFT) fontSizeMin -= 2;
  loop();
}
