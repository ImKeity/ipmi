// TP2 – Presentación "El Gato con Botas" qwq
// Processing – 640x480 – 6 pantallas con animación, transiciones e imágenes
PFont fuente;
int pantallaActual = 0;
int totalPantallas = 6;
int tiempoPorPantalla = 5000; // Milisegundos por pantalla
int tiempoInicioPantalla;
String[] textosPantallas = new String[6];
PImage[] imagenesPantallas = new PImage[6];
boolean mostrarBotonInicio = true;
boolean mostrarBotonReinicio = false;

// Variables para la animación de las imágenes
boolean animandoImagen = false;
int tiempoInicioAnimacionImagen;
int duracionAnimacionImagen = 750; // Duración de la animación de la imagen en ms

// Variables para la animación del texto
boolean animandoTexto = false;
int tiempoInicioAnimacionTexto;
int duracionAnimacionTexto = 1000; // Duración de la animación del texto en ms
int[] escrituraIndex = new int[6]; // Para la animación de escritura

void setup() {
  size(640, 480);
  fuente = createFont("Arial", 24);
  textFont(fuente);
  textAlign(LEFT, TOP); // Alineación por defecto para el texto
  tiempoInicioPantalla = millis();

  // 6 slides
  imagenesPantallas[0] = loadImage("gato1.png");
  imagenesPantallas[1] = loadImage("gato2.png");
  imagenesPantallas[2] = loadImage("gato3.png");
  imagenesPantallas[3] = loadImage("gato4.png");
  imagenesPantallas[4] = loadImage("gato5.png");
  imagenesPantallas[5] = loadImage("gato6.png");
// resumen del cuento
  textosPantallas[0] = "Un molinero deja a sus hijos sus posesiones.\nAl menor.. ¡solo le toca un gato!";
  textosPantallas[1] = "Pero este no es un gato cualquiera...\n¡tiene botas geniales y una idea astuta!";
  textosPantallas[2] = "Con engaños ingeniosos,\nel gato hace pasar a su amo\npor un noble y rico marqués. ¡Qué astuto!";
  textosPantallas[3] = "El Gato con Botas se enfrenta\na un temible ogro y, con su labia, ¡lo vence!";
  textosPantallas[4] = "Gracias a las artimañas del gato,\nel Marqués de Carabás se casa con la princesa.";
  textosPantallas[5] = "Y el Gato con Botas..\n¡se convirtió en un héroe\ny vivió feliz para siempre!";

  // Inicializar el índice de escritura para cada slide
  for (int i = 0; i < totalPantallas; i++) {
    escrituraIndex[i] = 0;
  }
}

void draw() {
  background(250, 245, 230);

  if (mostrarBotonInicio) {
    mostrarInicio();
  } else if (pantallaActual < totalPantallas) {
    mostrarSlide(pantallaActual);
    if (!animandoImagen && !animandoTexto && millis() - tiempoInicioPantalla > tiempoPorPantalla) {
      pantallaActual++;
      tiempoInicioPantalla = millis();
      if (pantallaActual < totalPantallas) {
        iniciarAnimaciones(pantallaActual);
      } else {
        mostrarBotonReinicio = true;
      }
    }
  } else if (mostrarBotonReinicio) {
    mostrarFinal();
  }
}

void mostrarInicio() {
  fill(80, 40, 20);
  textSize(width / 20);
  textAlign(CENTER, CENTER);
  text("¿Querés conocer la historia\ndel gato más elegante de todos?", width/2, height/2);

  fill(200, 100, 0);
  rectMode(CENTER);
  rect(width/2, height/2 + height / 8, width / 5, height / 12, 20);
  fill(255);
  textSize(width / 25);
  text("¡Empezar!", width/2, height/2 + height / 8);
  textAlign(LEFT, TOP); // Volver a la alineación para los slides
}

void iniciarAnimaciones(int indice) {
  animandoImagen = true;
  tiempoInicioAnimacionImagen = millis();
  animandoTexto = true;
  tiempoInicioAnimacionTexto = millis();
  escrituraIndex[indice] = 0; // Reiniciar el índice de escritura para el nuevo slide
}

void mostrarSlide(int s) {
  imageMode(CENTER);
  float anchoImagen = width;
  float altoImagen = height;
  float alphaImagen = 255;
  float offsetXImagen = 0;
  float scaleImagen = 1;

  // Calcular la escala para que la imagen cubra toda la pantalla manteniendo su proporción
  float relacionImagen = (float)imagenesPantallas[s].width / imagenesPantallas[s].height;
  float relacionPantalla = (float)width / height;

  if (relacionImagen > relacionPantalla) {
    // La imagen es más ancha que la pantalla
    scaleImagen = (float)height / imagenesPantallas[s].height;
    anchoImagen = imagenesPantallas[s].width * scaleImagen;
  } else {
    // La imagen es más alta que la pantalla o tiene la misma proporción
    scaleImagen = (float)width / imagenesPantallas[s].width;
    altoImagen = imagenesPantallas[s].height * scaleImagen;
  }

  // Animación de la imagen
  if (animandoImagen) {
    float tiempoTranscurrido = millis() - tiempoInicioAnimacionImagen;
    if (tiempoTranscurrido < duracionAnimacionImagen) {
      switch (s) { // se utiliza para ejecutar diferentes bloques de código dependiendo del valor de una expresión
        case 0: // Desvanecimiento
          alphaImagen = map(tiempoTranscurrido, 0, duracionAnimacionImagen, 0, 255);
          break;
        case 1: // Deslizamiento desde la izquierda
          offsetXImagen = map(tiempoTranscurrido, 0, duracionAnimacionImagen, -width, 0);
          break;
        case 2: // Escala desde abajo
          float scale = map(tiempoTranscurrido, 0, duracionAnimacionImagen, 0.5, 1);
          scaleImagen *= scale;
          anchoImagen = imagenesPantallas[s].width * scaleImagen;
          altoImagen = imagenesPantallas[s].height * scaleImagen;
          break;
        case 3: // Sin animación especial
          break;
        case 4: // Desvanecimiento
          alphaImagen = map(tiempoTranscurrido, 0, duracionAnimacionImagen, 0, 255);
          break;
        case 5: // Deslizamiento desde la derecha
          offsetXImagen = map(tiempoTranscurrido, 0, duracionAnimacionImagen, width, 0);
          break;
      }
    } else {
      animandoImagen = false;
    }
  }

  tint(255, alphaImagen);
  image(imagenesPantallas[s], width/2 + offsetXImagen, height/2, anchoImagen, altoImagen);
  noTint();

  textSize(width / 22);
  fill(255); // Texto blanco
  textAlign(LEFT, TOP);
  String texto = textosPantallas[s];
  float offsetYTexto = 0;
  float offsetXTexto = 0;
  float scaleYTexto = 1;
  float rotationTexto = 0;

  // Animación del texto
  if (animandoTexto) {
    float tiempoTranscurridoTexto = millis() - tiempoInicioAnimacionTexto;
    if (tiempoTranscurridoTexto < duracionAnimacionTexto) {
      switch (s) {
        case 0: // Desvanecimiento desde abajo
          float alphaTexto = map(tiempoTranscurridoTexto, 0, duracionAnimacionTexto, 0, 255);
          offsetYTexto = map(tiempoTranscurridoTexto, 0, duracionAnimacionTexto, height / 4, 0);
          fill(255, alphaTexto);
          break;
        case 1: // Deslizamiento desde la izquierda
          offsetXTexto = map(tiempoTranscurridoTexto, 0, duracionAnimacionTexto, -width / 4, 0);
          break;
        case 2: // Escalado desde cero
          float scaleTexto = map(tiempoTranscurridoTexto, 0, duracionAnimacionTexto, 0, 1);
          pushMatrix();
          translate(0, 0); // La esquina superior izquierda es el origen
          scale(scaleTexto, scaleTexto);
          text(texto, 0, 0);
          popMatrix();
          return; // Salir para dibujar el texto con la transformación
        case 3: // Escritura progresiva con ligero rebote vertical
          int longitudTexto = texto.length();
          escrituraIndex[s] = int(map(tiempoTranscurridoTexto, 0, duracionAnimacionTexto, 0, longitudTexto + 1));
          escrituraIndex[s] = constrain(escrituraIndex[s], 0, longitudTexto);
          texto = texto.substring(0, escrituraIndex[s]);
          offsetYTexto = sin(millis() * 0.1) * 5; // Pequeño rebote sinusoidal
          break;
        case 4: // Desvanecimiento con desplazamiento horizontal
          float alphaTexto4 = map(tiempoTranscurridoTexto, 0, duracionAnimacionTexto, 0, 255);
          offsetXTexto = map(tiempoTranscurridoTexto, 0, duracionAnimacionTexto, -width / 8, 0);
          fill(255, alphaTexto4);
          break;
        case 5: // Deslizamiento vertical desde arriba
          offsetYTexto = map(tiempoTranscurridoTexto, 0, duracionAnimacionTexto, -height / 4, 0);
          break;
      }
    } else {
      animandoTexto = false;
    }
  }

  text(texto, 0 + offsetXTexto, 0 + offsetYTexto);
}

void mostrarFinal() {
  fill(20);
  textSize(width / 20);
  textAlign(CENTER, CENTER);
  text("¿Querés volver a vivir\nesta historia con botas?", width/2, height/2 - height / 10); //inicio

  float anchoBoton = width / 4;
  float altoBoton = height / 15;
  float yBoton = height / 2 + height / 8;

  fill(180, 60, 30);
  rectMode(CENTER);
  rect(width/2, yBoton, anchoBoton, altoBoton, 20); // Boton de reinicio
  fill(255);
  textSize(width / 25);
  text("Reiniciar :D", width/2, yBoton);
  textAlign(LEFT, TOP); // Volver a la alineación por defecto
}

void mousePressed() {
  if (mostrarBotonInicio) {
    textAlign(CENTER, CENTER); // Para la detección del clic en el botón
    if (dist(mouseX, mouseY, width/2, height/2 + height / 8) < width / 10) {
      mostrarBotonInicio = false;
      tiempoInicioPantalla = millis();
      pantallaActual = 0;
      mostrarBotonReinicio = false;
      iniciarAnimaciones(pantallaActual);
    }
    textAlign(LEFT, TOP); // Volver a la alineación por defecto
  } else if (mostrarBotonReinicio) {
    float anchoBoton = width / 4;
    float altoBoton = height / 15;
    float yBoton = height / 2 + height / 8;
    if (mouseX > width/2 - anchoBoton/2 && mouseX < width/2 + anchoBoton/2 &&
        mouseY > yBoton - altoBoton/2 && mouseY < yBoton + altoBoton/2) {
      pantallaActual = 0;
      mostrarBotonReinicio = false;
      mostrarBotonInicio = false;
      tiempoInicioPantalla = millis();
      iniciarAnimaciones(pantallaActual);
    }
  }
}
