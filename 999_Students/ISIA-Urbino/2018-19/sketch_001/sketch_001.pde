/*////////////////////////////////////////////////
ISIA Urbino
Elementi di Informatica per il Design 2018/2019
Brevi Galantino Savioli Tonelli
Sketch ispirato dalle "7 brevi lezioni di Fisica"
di Carlo Rovelli
////////////////////////////////////////////////*/

float unit, theta; // Dichiaro le variabili unit e theta di tipo float 
int num = 30, // Dichiaro la variabile num di tipo int, quantità di cerchi
frames = 150; // Dichiaro la quantità di frame da visualizzare ad ogni secondo

void setup() {
  size(1280, 720); // Dimensione dello sketch
  unit = width/num; 
}

void draw () {
  noStroke (); // Disabilito il contorno 
  background (255,255,255); // Dichiaro il colore di sfondo
  fill (0,0,0); // Dichiaro il colore di riempimento 
  
  for (int y=0; y<=num; y++) { // Ciclo for per determinare la ripetizione nell'asse y
  for (int x=0; x<=num; x++) { // Ciclo for per determinare la ripetizione nell'asse x
  float distance = dist (width/2, height/2, x*unit, y*unit); // Calcolo la distanza tra i punti
  float offSet = map (distance, 20, sqrt (sq(width/1)+sq(height/1)), 30, TWO_PI); // Re-mappa un numero da un intervallo ad un altro 
  float sz = map (sin(theta+offSet), -1, 1, unit*.1, unit*.1); // Dichiaro il numero di intervalli
  float angle = atan2 (y*unit-height/2, x*unit-width/2); // Calcola l'angolo (in radianti) da un punto specificato all'origine
  
  pushMatrix(); // Dichiaro la matrice di trasformazione per controllare la funzione "rotate"
  translate(x*unit, y*unit); // Specifico i valori per lo spostamento degli oggetti nello sketch
  rotate (angle); // Specifico l’angolo di rotazione
  
  float px = map (sin (theta+offSet),-1,0,0,50); 
  // Dichiaro il numero di intervalli e l'angolo di movimento
  // Modificando questi parametri si può aumentare o ridurre la velocità
  
  ellipse(px, 150, sz, sz); // Disegno un cerchio
  // Maggiore è il numero nella coordinata y e più il vuoto interno del quadro sarà grande
 
  popMatrix(); // Elimino l'attuale matrice di trasformazione
}
}

theta -= TWO_PI/frames; // Calcolo il valore della variabile theta, la quale permette il movimento circolare
}
