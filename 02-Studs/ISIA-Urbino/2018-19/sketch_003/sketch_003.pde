/*////////////////////////////////////////////////
ISIA Urbino
Elementi di Informatica per il Design 2018/2019
Brevi Galantino Savioli Tonelli
Sketch ispirato dalle "7 brevi lezioni di Fisica"
di Carlo Rovelli
////////////////////////////////////////////////*/

// Prima di avviare il codice, inserire il video da importare nella cartella “data” relativa al codice 
// Questo procedimento funziona solo se il video importato è in B/N 
// Dove il valore 255 indica il Bianco (255,255,255) e 0 indica il Nero (0,0,0)

// Viene analizzata la quantità di bianco presente nel frame e di conseguenza quella di nero
// Alla quale viene assegnata una frequenza che sarà riprodotta quando il frame analizzato avrà una presenza maggiore di nero o di bianco
      
import processing.video.*; // Importo la libreria video
import ddf.minim.*; // Importo la libreria Minim 
import ddf.minim.ugens.*;

Minim minim; // Dichiaro la variabile di tipo Minim 

AudioOutput out; // Questa variabile permette la connessione con l'uscita audio del computer
AudioRecorder recorder; // Questa variabile permette di registare il suono in uscita

Movie myMovie; // Dichiaro la variabile di tipo Movie 

Oscil pulseNeri; // Dichiaro l'oscillatore di impulsi per una componente di nero pari allo 0%
Oscil pulseBianchi; // Dichiaro l'oscillatore di impulsi per una componente di bianco pari al 100%

float pixels; // Dichiaro la variabile pixels di tipo float
long frameN; // Dichiaro la variabile frameN di tipo long
float frames; // Dichiaro la variabile frames di tipo float
float videoDuration; // Dichiaro la variabile videoDuration di tipo float

int rangeDeiNeri; // Dichiaro la variabile rangeDeiNeri di tipo int
int rangeDeiBianchi; // Dichiaro la variabile rangeDeiBianchi di tipo int

void setup() {
  size(1440, 810); // Dimensioni sketch che dovranno necessariamente coincidere con le dimensioni del video
  pixels = width * height; // Calcolo il numero dei pixels dello sketch
    
  minim = new Minim(this); // 
  
  // Utilizzo il metodo getLineOut dell'oggetto Minim per ottenere un AudioOutput
  out = minim.getLineOut();
  
  // Creo un AudioRecorder che registra l’uscita audio e salva il file con il nome specificato
  // Il file si troverà nella cartella principale dello sketch
  recorder = minim.createRecorder(out, "registrazione_suoni.wav");
  
  // Creo gli oscillatori di impulsi con frequenze diverse
  pulseNeri = new Oscil(random(600,800), 0f, Waves.QUARTERPULSE);
  pulseBianchi = new Oscil(random(1000,1500), 0f, Waves.QUARTERPULSE);

  // Collego l'oscillatore all'uscita audio
  pulseNeri.patch(out);
  pulseBianchi.patch(out);
 
  frameN = 0; // Azzero la variabile frameN

  myMovie = new Movie(this, "VIDEO_COMPLETO.mp4"); // Dichiaro la variabile e carico il video dalla cartella "data"
  myMovie.play();  // Riproduco il video 
  
  recorder.beginRecord();  // Registro l'audio
  
  videoDuration = myMovie.duration(); // Calcolo la durata del video
}

void draw() { 
  image(myMovie, width/2, height/2); // Stampo il fotogramma al centro dello sketch
  imageMode(CENTER);
}

// Ogni volta che un nuovo frame viene stampato è pronto per la lettura
void movieEvent(Movie frame) {
  frameN++; // Incremento la variabile frameN 
  frame.read();  // Leggo il frame stampato
  frame.loadPixels(); // Carico il frame nell'array dei pixel
  
  rangeDeiNeri = 0; // Azzero il valore del rangeDeiNeri250
  rangeDeiBianchi = 0; // Azzero il valore del rangeDeiBianchi

  // Matrice di pixel
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      int pixelColor = frame.pixels[loc];
       
      
      // Prendo in considerazione solo la componente BLU (più veloce da estrarre)
      // Presumendo che le altre due componenti (ROSSO e VERDE) abbiano lo stesso valore
      // PixelColor & 0xFF seleziona la componente BLU
      // AND (&) è più veloce della funzione blue()      
      
      // Utilizzo il ciclo if 
      // Istruzione: se la componente selezionata è uguale a 255 il frame è totalmente bianco quindi contiene una componente di nero pari allo 0%
      if((pixelColor & 0xFF) == 255){ 
        rangeDeiBianchi++; // Incremento il rangeDeiBianchi
      }
      // Istruzione: altrimenti il frame è nero 
      else 
        rangeDeiNeri++; // Incremento il rangeDeiNeri
  }
          
  float percentualeDirangeDeiNeriNelFrame; // Dichiaro la variabile percentualeDirangeDeiNeriNelFrame di tipo float
  float percentualeDiRangeDeiBianchiNelFrame; // Dichiaro la variabile percentualeDiRangeDeiBianchiNelFrame di tipo float

  print("Frame " + frameN + ' '); // Stampo nella console va variabile frameN 

  percentualeDiRangeDeiBianchiNelFrame = (rangeDeiBianchi * 100) / pixels; // Calcolo il valore di percentualeDiRangeDeiBianchiNelFrame
  percentualeDirangeDeiNeriNelFrame = (rangeDeiNeri * 100) / pixels; // Calcolo il valore di percentualeDirangeDeiNeriNelFrame
 
  pulseBianchi.setAmplitude(map(percentualeDiRangeDeiBianchiNelFrame, 0, 100, 0, 1));
  pulseNeri.setAmplitude(map(percentualeDirangeDeiNeriNelFrame, 0, 100, 0, 1));
 
  // Stampo i risulatati per ogni variabile
  print("Range Dei Bianchi => " + nf(percentualeDiRangeDeiBianchiNelFrame, 3, 3) + "%; ");
  print("Range Dei Neri => " + nf(percentualeDirangeDeiNeriNelFrame, 3, 3) + "%; ");

  println();
  
  // Quando i frames sono stati letti tutti si fermano gli oscillatori e termina il suono
  if((int)(videoDuration * myMovie.frameRate)==frameN){
    
    pulseNeri.unpatch(out);
    pulseBianchi.unpatch(out);
    
    println("Il video è teminato."); 
    recorder.endRecord(); //Fine registrazione
  }
}
}
