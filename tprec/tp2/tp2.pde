PImage slide1, slide2, slide3, slide4, slide5, slide6;
PFont fuente1, fuente2, fuente3, fuente4, fuente5, fuente6;

int slideActual = 0; 
int tiempoInicio;
int duracionSlide = 5000; 


float alpha1 = 0, alpha4 = 0, alpha5 = 0, alpha6 = 0, alpha11 = 0, alpha15 = 0, fade19 = 0; 
float posY1 = 480, posY14 = 480; 
float escala3 = 0.5, tam9 = 5, tam18 = 8; 
float rot7 = -0.7, rot13 = 0; 
float posX8 = -640, posX16 = -300; 
float waveY10 = 380, bounce17 = 0, shake12 = 0; 


boolean showStartScreen = true;
boolean showEndScreen = false;
boolean presentationActive = false;


void setup() {
  size(640, 480);
  frameRate(60);

  // Cargar imágenes
  slide1 = loadImage("gato1.png");
  slide2 = loadImage("gato2.png");
  slide3 = loadImage("gato3.png");
  slide4 = loadImage("gato4.png");
  slide5 = loadImage("gato5.png");
  slide6 = loadImage("gato6.png");

  // Cargar fuentes
  fuente1 = loadFont("Arial-Black-23.vlw");
  fuente2 = loadFont("CourierNewPS-ItalicMT-18.vlw");
  fuente3 = loadFont("Georgia-Italic-19.vlw");
  fuente4 = loadFont("Impact-24.vlw");
  fuente5 = loadFont("TimesNewRomanPSMT-22.vlw");
  fuente6 = loadFont("Verdana-Bold-20.vlw");

  tiempoInicio = millis(); //El tiempo que pasa lo guardo en esta variable para controlar el tiempo en el que cambian las imágenes
}

void draw() {
  background(0);

  if (showStartScreen) { 
    fill(255);
    textFont(fuente1);
    textAlign(CENTER, CENTER);
    textSize(36);
    text("El Gato con Botas", width / 2, height / 3 - 30);

    // Boton "Comenzar"
    float startButtonX = width / 2;
    float startButtonY = height / 2 + height / 8;
    float startButtonWidth = 200;
    float startButtonHeight = 60;

    fill(50, 150, 50);
    rectMode(CENTER);
    rect(startButtonX, startButtonY, startButtonWidth, startButtonHeight, 20);

    fill(255);
    textFont(fuente4);
    textSize(28);
    text("Comenzar", startButtonX, startButtonY);

  } else if (presentationActive) { 
    
    if (slideActual == 1) {
      image(slide1, 0, 0, 640, 480);
      textFont(fuente1);
      fill(255, alpha1);
      textAlign(CENTER, CENTER);
      text("Un molinero deja a sus hijos sus posesiones.\nAl menor.. ¡solo le toca un gato!",
           width / 2, 360, 580, 80);
      if (alpha1 < 255) alpha1 += 3;
    }
    if (slideActual == 2) {
      image(slide2, 0, 0, 640, 480);
      textFont(fuente2);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Pero este no es un gato cualquiera...\n¡tiene botas geniales y una idea astuta!",
           width / 2, posY1, 580, 80);
      if (posY1 > 350) posY1 -= 3;
    }
    if (slideActual == 3) {
      image(slide3, 0, 0, 640, 480);
      textFont(fuente3);
      pushMatrix();
      translate(320, 420);
      scale(escala3);
      fill(255);
      text("Con engaños ingeniosos,\nel gato hace pasar a su amo\npor un noble y rico marqués. ¡Qué astuto!",
           0, -40, 540, 80);
      popMatrix();
      if (escala3 < 1.2) escala3 += 0.015;
    }
    if (slideActual == 4) {
      image(slide4, 0, 0, 640, 480);
      textFont(fuente3);
      fill(255, alpha4);
      textAlign(CENTER, CENTER);
      text("El Gato con Botas se enfrenta\na un temible ogro y, con su labia, ¡lo vence!",
           posX8, 360, 580, 120);
      if (posX8 < width / 2) posX8 += 10;
      if (alpha4 < 255) alpha4 += 2;
    }
    if (slideActual == 5) {
      image(slide5, 0, 0, 640, 480);
      textFont(fuente5);
      pushMatrix();
      fill(255, alpha5);
      textAlign(CENTER, CENTER);
      translate(width / 2, 360);
      rotate(rot7);
      text("Gracias a las artimañas del gato,\nel Marqués de Carabás se casa con la princesa.",
           0, 0, 580, 80);
      popMatrix();
      if (rot7 < 0) rot7 += 0.02;
      if (alpha5 < 255) alpha5 += 2;
    }
    if (slideActual == 6) {
      image(slide6, 0, 0, 640, 480);
      textFont(fuente6);
      fill(255, alpha6);
      textAlign(CENTER, CENTER);
      float bounceOffset = sin(frameCount * 0.1) * 5;
      text("Y el Gato con Botas..\n¡se convirtió en un héroe\ny vivió feliz para siempre!",
           width / 2, 360 + bounceOffset, 580, 80);
      if (alpha6 < 255) alpha6 += 3;
    }

    if (millis() - tiempoInicio > duracionSlide) {
      if (slideActual < 6) {
        slideActual++;
        tiempoInicio = millis();
      } else {
        presentationActive = false; 
        showEndScreen = true;       
        tiempoInicio = millis();
      }
    }
  } else if (showEndScreen) { 
    fill(255);
    textFont(fuente1);
    textAlign(CENTER, CENTER);
    textSize(36);
    text("¡Fin de la Historia!", width / 2, height / 3);
    textSize(24);
    text("¿Quieres revivir la aventura?", width / 2, height / 2 - 50);

    // "Reiniciar" boton
    float restartButtonX = width / 2;
    float restartButtonY = height / 2 + height / 8;
    float restartButtonWidth = 200;
    float restartButtonHeight = 60;

    fill(200, 100, 0);
    rectMode(CENTER);
    rect(restartButtonX, restartButtonY, restartButtonWidth, restartButtonHeight, 20);

    fill(255);
    textFont(fuente4);
    textSize(28);
    text("Reiniciar", restartButtonX, restartButtonY);
  }
}

void mousePressed() {

  float buttonX = width / 2;
  float buttonY;
  float buttonWidth = 200;
  float buttonHeight = 60;

  if (showStartScreen) {
    buttonY = height / 2 + height / 8; 
    if (mouseX > buttonX - buttonWidth / 2 && mouseX < buttonX + buttonWidth / 2 &&
        mouseY > buttonY - buttonHeight / 2 && mouseY < buttonY + buttonHeight / 2) {

      showStartScreen = false;
      presentationActive = true;
      slideActual = 1;            
      tiempoInicio = millis();    

      
      alpha1 = 0;
      posY1 = 480;
      escala3 = 0.5;
      alpha4 = 0;
      alpha5 = 0;
      alpha6 = 0;
      rot7 = -0.7;
      posX8 = -640;
      
        }
  } else if (showEndScreen) { 
    buttonY = height / 2 + height / 8; 
    if (mouseX > buttonX - buttonWidth / 2 && mouseX < buttonX + buttonWidth / 2 &&
        mouseY > buttonY - buttonHeight / 2 && mouseY < buttonY + buttonHeight / 2) {

      showEndScreen = false;    
      showStartScreen = true;   
      slideActual = 0;           
    } 
  }
}
