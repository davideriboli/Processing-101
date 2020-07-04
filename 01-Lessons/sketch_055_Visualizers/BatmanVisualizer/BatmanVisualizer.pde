/*
Le righe da 7 a 12 inizializzano le funzioni della libreria Minim che è la più usata per l'audio
in Processing. La libreria deve essere installata dal menu "Sketch", voce "Import library"
e poi cercando "Minim". L'installazione deve essere fatta solo una volta.
*/

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Le due righe inizializzano l'entrata microfonica grazie a Minim
Minim mySound;
AudioInput in;

//Le due righe che seguono creano un "oggetto tipografico".
PFont f;

void setup(){
//Le due righe che seguono determinano quanto è grande la finestra e di che colore è lo sfondo  
    size(800,600);
    background(255);
    
 //Le due righe che seguono creano un "oggetto suomo" con ciò che entra nel microfono    
        mySound = new Minim(this);
    in = mySound.getLineIn(); 
    
/*
Qui invece si decidono le qualità dell'oggetto "tipografico".
Si può indicare qualsiasi nome di font presente in sistema
*/
   f = createFont("Arial",48);
    textFont(f);
    textAlign(CENTER,CENTER);
  }
  
/*
Questo è il cilindro dove abita il coniglio di prestigio
Prima si crea una variabile numerica col valore del volume in ingresso
poi si decidono colori o scala di grigi e grado di trasparenza
poi si lega la posizione del testo alle coordinate del mouse
poi si scrive il testo
e infine si dice al testo che il valore della sua dimensione è quello della variabile di volume
*/
void draw(){
  float soundSize= in.mix.level()*2000;
  fill(random(0,255),50);
  text("Batman",mouseX,mouseY);
  textSize(soundSize);
  }

/*
Questa roba infine serve a salvare una jpg
ogni volta che si preme "S"
*/ 
  void keyPressed(){
    if (key=='s') {
    saveFrame("salvataggio-###.jpg");
    }
  }
