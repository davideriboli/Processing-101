// Processing - Le basi

//Il doppio slash commenta una singola riga

/*
Questo invece è il modo
per commentare più righe
*/

/*
//La console
println("Ciao, rape!");

//Le dimensioni della finestra di output
size(600, 200);

// E se facessimo un paio di errori?
// Sizo(600,200);

//Un aiuto all'antialiasing
//e l'idea di istruzioni "vuote"
smooth();

//Il colore di sfondo
background(255, 0, 0);

//Cerchi ed ellissi
ellipse(300, 100, 100, 100);
*/

////////// ////////// //////////

/*
//Le prossime tre righe le conosciamo già
size(600, 200);
smooth();
background(#666666);

//Colore e "peso" della "matita" che useremo
stroke(#607F9C);
strokeWeight(20);

//Punti e sistema di coordinate
point(100, 100);
point(150, 100);
point(200, 100);
point(250, 100);
point(300, 100);
point(350, 100);
point(400, 100);
point(450, 100);
point(500, 100);
*/

////////// ////////// //////////

/*
//Con le prime cinque righe ci siamo già conosciuti
size(600, 200);
smooth();
background(#9F9694);
stroke(#E2E1DC);
strokeWeight(2);

//Disegnare linee
line(100, 50, 500, 50);
line(100, 150, 500, 150);

//Cambiamo matita
stroke(#791F33);
strokeWeight(8);

//Altre linee
line(100, 50, 100, 150);
line(100, 50, 200, 150);
line(100, 50, 300, 150);
line(100, 50, 400, 150);

line(200, 50, 500, 150);
line(300, 50, 500, 150);
line(400, 50, 500, 150);
line(500, 50, 500, 150);
*/

////////// ////////// //////////

/*
size(600, 200);
smooth();
background(#678C8B);

//Niente contorno
noStroke();

//Colore di riempimento e uso delle references
fill(#8FA89B, 200);

//Cerchi e colori
ellipse(100, 100, 150, 100);

fill(#A2BAB0, 200);
ellipse(200, 100, 150, 100);

fill(#D0EDDE, 200);
ellipse(300, 100, 150, 100);

fill(#8FA89B, 200);
ellipse(400, 100, 150, 100);

//Trovate da soli cosa significa "ellipseMode"
//e ricordate che Processing è "case sensitive"
ellipseMode(CORNER);

fill(#B3B597);
ellipse(500, 100, 150, 150);
*/

////////// ////////// //////////

/*
size(600, 200);
smooth();
strokeWeight(5);

// Un arco (x, y, larghezza, altezza, start, stop)
arc(100, 100, 75, 75, 0, PI*0.5);

//Trovate da soli il significato di tutte le
//altre istruzioni che non conoscete
noFill();
arc(233, 100, 75, 75, 0, PI);

fill(0, 191, 255);
noStroke();
arc(367, 100, 75, 75, 0, radians(270));

stroke(0);
arc(500, 100, 75, 75, 0, TWO_PI);
*/

////////// ////////// //////////

/*
size(600, 200);
smooth();
background(#302F2F);
strokeWeight(5);

triangle(150, 50, 200, 150, 100, 150);

noStroke();
fill(#74AD92);
triangle(250, 50, 300, 150, 350, 50);

stroke(#F07F47);
noFill();
triangle(450, 50, 500, 150, 400, 150);
*/

////////// ////////// //////////

/*
size(600, 200);
smooth();
background(#FFFFCD);
strokeWeight(5);

rectMode(CORNER);
rect(60, 60, 80, 80);

rectMode(CENTER);
noStroke();
fill(#CC5C54);
rect(300, 100, 80, 80);

rectMode(CORNERS);
stroke(#F69162);
noFill();
rect(460, 60, 540, 140);
*/

////////// ////////// //////////

/*
size(600, 200);
smooth();
background(#0C2550);
strokeWeight(5);

quad(150, 50, 200, 100, 150, 150, 100, 100);

noStroke();
fill(#A3D0C1);
quad(300, 50, 350, 100, 300, 150, 250, 100);

stroke(#FDF6DD);
noFill();
quad(450, 50, 500, 100, 450, 150, 400, 100);
*/

////////// ////////// //////////

/*
size(600, 200);
smooth();
background(#D9C6B0);
strokeWeight(5);

stroke(#314650);
beginShape();
vertex(200, 150);
vertex(150, 125);
vertex(150, 75);
vertex(200, 50);
vertex(250, 75);
vertex(250, 125);
endShape(CLOSE);

stroke(#45718c);
beginShape();
vertex(400, 150);
vertex(350, 125);
vertex(350, 75);
vertex(400, 50);
vertex(450, 75);
vertex(450, 125);
endShape(CLOSE);
*/

////////// ////////// //////////

/*
size(600, 200);
smooth();
background(#C3CCC8);
strokeWeight(5);

stroke(#442412);
curve(100, 300, 100, 100, 200, 100, 200, 300);

noFill();
stroke(#B9961C);
curveTightness(3);
curve(250, 300, 250, 100, 350, 100, 350, 300);

stroke(#475D1C);
curveTightness(-3);
curve(400, 300, 400, 100, 500, 100, 500, 300);
*/

////////// ////////// //////////

/*
size(600, 200);
smooth();
noFill();

// Curva nera
stroke(0);
strokeWeight(3);
curveTightness(0);
beginShape();
curveVertex(100, 100);
curveVertex(100, 100);
curveVertex(150, 150);
curveVertex(250,  50);
curveVertex(300,  10);
curveVertex(400, 190);
curveVertex(500, 100);
curveVertex(500, 100);
endShape();

// Curva grigia
stroke(100);
strokeWeight(3);
curveTightness(-3);
beginShape();
curveVertex(100, 100);
curveVertex(100, 100);
curveVertex(150, 150);
curveVertex(250,  50);
curveVertex(300,  10);
curveVertex(400, 190);
curveVertex(500, 100);
curveVertex(500, 100);
endShape();

// Curva bianca
stroke(255);
strokeWeight(3);
curveTightness(+4);
beginShape();
curveVertex(100, 100);
curveVertex(100, 100);
curveVertex(150, 150);
curveVertex(250,  50);
curveVertex(300,  10);
curveVertex(400, 190);
curveVertex(500, 100);
curveVertex(500, 100);
endShape();

// Punti rossi
strokeWeight(8);
stroke(200, 0, 0);
point(100, 100);
point(150, 150);
point(250,  50);
point(300,  10);
point(400, 190);
point(500, 100);
*/

////////// ////////// //////////

/*
size(600, 200);
smooth();
background(#9F9694);
noFill();

// Punti di controllo della prima curva
stroke(#F1E6D4);
strokeWeight(2);
line(100, 50, 250, 50);
line(100, 150, 250, 150);

// Prima curva
stroke(#791F33);
strokeWeight(3);
bezier(100, 50, 250, 50, 100, 150, 250, 150);

// Punti di controllo della seconda curva
stroke(#F1E6D4);
strokeWeight(2);
line(350, 75, 500, 25);
line(350, 125, 500, 175);

// Seconda curva
stroke(#BA3D49);
strokeWeight(3);
bezier(350, 75, 500, 25, 500, 175, 350, 125);
*/

////////// ////////// //////////

/*
ESERCITAZIONE 01
Ora che conoscete tutte le basi del disegno
provate a realizzare un vostro primo sketch
figurativo. Tipo Totoro : )
*/

/*
size(480, 640);

// Le prossime due righe sono un po' complicate
// da capire, specie in rapporto a tutto il resto
// dello sketch. Cercate comunque di comprenderle
// da soli facendo riferimento alle references.

translate(0.50*width, 0.25*height);
scale(width);

//Tutto il resto è molto semplice.
  background(90, 85, 80);

  noStroke();

  fill(240);
  ellipse(-0.30, 0.0, 0.2, 0.2);
  ellipse( 0.30, 0.0, 0.2, 0.2);

  fill(30);
  ellipse(-0.25, 0.0, 0.1, 0.1);
  ellipse( 0.25, 0.0, 0.1, 0.1);

  ellipse(0.0, 0.05, 0.1, 0.02);
  ellipse(0.0, 0.06, 0.03, 0.02);

  fill(230, 210, 170);
  ellipse(0.0, 1.0, 1.5, 1.5);

  fill(90, 85, 80);
  ellipse( 0.0, 0.45, 0.2, 0.2);
  fill(230, 210, 170);
  ellipse( 0.0, 0.48, 0.3, 0.2);

  fill(90, 85, 80);
  ellipse(-0.2, 0.55, 0.2, 0.2);
  ellipse( 0.2, 0.55, 0.2, 0.2);
  fill(230, 210, 170);
  ellipse(-0.2, 0.58, 0.3, 0.2);
  ellipse( 0.2, 0.58, 0.3, 0.2);

  // Totoro è stato realizzato partendo
  // da un codice di Daniele Olmisani
  */
