PImage img;

void setup() {
  size(800, 400);
  img = loadImage("cuadro.png"); // 
  rectMode(CENTER);
  imageMode(CORNER);
  noFill();
}

void draw() {
  background(255);

  // Imagen original a la izquierda
  image(img, 0, 0, 400, 400);

  // Lado derecho: patrón óptico estático
  pushMatrix();
  translate(600, 200);  // centro del lado derecho
  draw (11, 18);  // pasos, tamaño de paso
  popMatrix();
}

// Dibuja el patrón cuadrado alineado sin animación
void draw (int steps, int spacing) {
  strokeWeight(11);

  for (int i = 1; i <= steps; i++) {
    int offset = spacing * i;

    // Alternar color de línea
    if (i % 1 == 0) {
      stroke(0);
    } else {
      stroke(255);
    }

    // Cuadrado concéntrico


     // Dibujar líneas horizontales (superior e inferior)
    line(-offset, -offset, offset, -offset);
    line(-offset, offset, offset, offset);

    // Dibujar líneas verticales (izquierda y derecha)
   line(-offset, -offset, -offset,offset);
    line(offset, -offset, offset, offset);

  }

 
  fill(250);
  noStroke();
  rect(0, 0, spacing * 2, spacing * 2); // 40x40 si spacing = 20
}
