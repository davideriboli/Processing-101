/*////////////////////////////////////////////////
ISIA Urbino
Elementi di Informatica per il Design 2018/2019
Brevi Galantino Savioli Tonelli
Sketch ispirato dalle "7 brevi lezioni di Fisica"
di Carlo Rovelli
////////////////////////////////////////////////*/

int num = 50; // Il numero delle palle
int edge = 100; // La scala del campo di simulazione (1>100)

ArrayList ballCollection; // Dichiaro un'ArrayList per memorizzare i pallini

boolean save = false; // Dichiaro la variabile di tipo booleana per i valori vero/falso

void setup() {
  size(1100, 700); // Dimensione sketch
  ballCollection = new ArrayList(); // Inizializzo l'ArrayList per memorizzare i pallini
  initialize(); // Inizializza gli oggetti nello sketch
}

void draw() {
  background(255, 255, 255); // Cancella tutto utilizzando il bianco

  for (int i=0; i<ballCollection.size(); i++) { // Per ogni pallino nell' ArrayList
    ArrayList ball = (ArrayList) ballCollection.get(i); // Ne preleva uno
    
    display(ball); // E lo disegna sullo schermo
    move(ball); // Lo muove
    lineBetween(ball); // E traccia le linee
  }
}

// La funzione si attiva ogni volta che il pulsante del mouse viene rilasciato
void mouseReleased() { 
  initialize(); // Crea una nuova simulazione reinizializzando tutti gli oggetti
}

void initialize() {
  ballCollection.clear(); // Svuota l'ArrayList che contiene i pallini

  for (int i=0; i<num; i++) { // Ciclo for per la quantità di pallini
// https://processing.org/reference/PVector.html
// PVector è una classe per descrivere un vettore bidimensionale o tridimensionale, in particolare un vettore geometrico. 
// PVector è usato per descrivere una posizione, una velocità o un'accelerazione.
// Creo un nuovo vettore con le coordinate della pallina, comprese fra la scala e la dimensione del bordo meno la scala
    PVector org = new PVector(random(edge, width-edge), random(edge, height-edge));  
    Float radius = random(10, 10); // Il raggio di movimento della pallina (casuale tra valori 0 e 10), in movimento circolare
    PVector loc = new PVector(org.x+radius, org.y); // Nuovo vettore con lo scostamento della pallina, rispetto al centro, del raggio

    Float offset = random(TWO_PI); // Valore random (tra 0 e TWO_PI) relativo al movimento circolare 

    Integer dir = 1; // Relativo al senso di rotazione
    if (random (1)>.5) dir =-1;

    Float theta = 0.0; // Relativa alla velocità del moto

    ArrayList ball = new ArrayList(); // ArrayList per definire la singola pallina
    // Salva gli oggetti che definiscono la pallina nell'ArrayList
  ball.add(org);
    ball.add(loc); 
    ball.add(radius); 
    ball.add(dir);   
    ball.add(offset);
    ball.add(theta);
    
    ballCollection.add(ball);  // Salva l’ArrayList della pallina nell’ArrayList che contiene tutte le palline
  }
}

// Recupera gli oggetti salvati nella pallina
void move(ArrayList ball) {
  PVector org = (PVector) ball.get(0);
  PVector loc = (PVector) ball.get(1);
  Float radius = (Float) ball.get(2);
  Integer dir = (Integer) ball.get(3); 
  Float offset = (Float) ball.get(4);
  Float theta = (Float) ball.get(5);

  // Calcola lo step per il movimento circolare 
  loc.x = org.x + sin(theta+offset)*radius;
  loc.y = org.y + cos(theta+offset)*radius; 
  theta += (0.05/3*dir); 
  
  ball.add(5,theta); // Salva la variabile theta nell’ArrayList della pallina    
}

void lineBetween(ArrayList ball) { 
  int dist = 50; // Distanza massima oltre la quale non tracciare la riga
  
  for (int i=0; i<ballCollection.size(); i++) { // Confronta la pallina con tutte le altre
    ArrayList other = (ArrayList) ballCollection.get(i); // Recupera la pallina da confrontare con l'attuale

    PVector loc = (PVector) ball.get(1);    // Recupera la posizione della pallina attuale
    PVector loc2 = (PVector) other.get(1);  // Recupera la posizione della pallina da confrontare

    float distance = loc.dist(loc2); // Calcola la distanza fra le due palline
    
    if (distance >0 && distance < dist) { // Se la distanza è più grande di 0 e più piccola di dist
      stroke (0, 0, 0);
      line (loc.x, loc.y, loc2.x, loc2.y); // Allora traccia la linea
    }
  }
}

void display(ArrayList ball) {
  PVector loc = (PVector) ball.get(1); // Recupera la posizione della pallina

  noStroke();
  for (int i=0; i<5; i++) {
    fill(0, 0, 0);
    ellipse (loc.x, loc.y, 7, 7); // Disegna la palla di dimensioni 7
  }
}
