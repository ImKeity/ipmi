PImage refImg;
int numLineas = 10;
float factorRandom = 0; // Este factor influirá en la intensidad del pulso
boolean animacionActiva = false; // Nueva variable para controlar la animación

void setup() {
  size(800, 400);
  refImg = loadImage("cuadro.png"); // Asegúrate de tener "cuadro.png" en la misma carpeta del sketch
  refImg.resize(400, 400);
  noFill();
  rectMode(CENTER);
}

void draw() {
  background(255);

  // Mostrar la imagen de referencia a la izquierda
  image(refImg, 0, 0);

  // Dibujar patrón en la derecha
  pushMatrix();
  translate(600, 200); // centro del lado derecho

  // --- Lógica de la animación de Zoom Pulsante ---
  float escalaPulso = 1.0; // Escala por defecto (sin zoom)

  if (animacionActiva) {
    // Si la animación está activa, calculamos la escala pulsante
    float pulso = sin(frameCount * 0.05); // Velocidad del pulso
    escalaPulso = map(pulso, -1, 1, 0.9 + (factorRandom * 0.01), 1.1 + (factorRandom * 0.05));
  }
  // Si animacionActiva es false, escalaPulso se mantiene en 1.0 (sin efecto)

  scale(escalaPulso); // Aplica la escala calculada (pulsante o 1.0)

  for (int i = numLineas; i > 0; i--) {
    float tam = getTamanio(i);
    dibujarCuadro(tam, i);
  }
  popMatrix();
}

// Función que retorna un valor
float getTamanio(int nivel) {
  return map(nivel, 1, numLineas, 50, 400);
}

// Función que no retorna valor
void dibujarCuadro(float tam, int nivel) {
  stroke(0);
  strokeWeight(11);
  if (nivel % 17 == 0) {
    strokeWeight(1);
  }
  rect(0, 0, tam, tam);
}

// --- Interacciones de usuario ---

// Tecla para reiniciar
void keyPressed() {
  if (key == 'r') {
    numLineas = 10;
    factorRandom = 0;
    animacionActiva = false; // Desactiva la animación al reiniciar
  }
}

// Mouse para cambiar efecto
void mousePressed() {
  if (mouseX > 400) { // Solo si clicás en el lado derecho
    numLineas = int(random(5, 20));
    factorRandom = random(0.0, 3.0); // La intensidad del pulso
    animacionActiva = true; // Activa la animación al hacer clic en el lado derecho
  }
}
