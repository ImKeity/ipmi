//Hola buenas noches profesor, soy Yanira Del Pilar Gomez Romero, no pude hacer el for anidado porque no se aplica a la forma de mi obra.
// LEGAJO : 122713/6
//VIDEO : https://youtu.be/y3wyALihKhU

PImage cuadro;
boolean verificacion_color = false;
float negro = 0;
float blanco = 255;

void setup (){ //es la pantalla que reproduce el código dentro de setup 1 vez y listo.
  size (800,400); // tamaño aplicado obligatorio para el t.p
  background(200);
  cuadro = loadImage("cuadro.png");
}

void draw(){ //es lo que ves en tiempo real del código, osea 60 fps por segundo
  dibujarRect(23, 42,42, verificacion_color);
  strokeWeight(4);
  fill(189,0,0);
  rect(568,196,55,55);
  image(cuadro,0,0,400,400); //imagen de referencia a la izquierda
  println(mouseX,mouseY);
}
//Una variable es un espacio que vos creas, para luego en un futuro ser utilizado o modificado, por ejemplo
void dibujarRect(int cuadradosdefondo, int lineavertical,int lineahorizontal, boolean verificaciondecolor) { //funcion que NO retorna un valor
  push();
  noStroke();
  int tof = 0;
  float rectx=0;
  float recty=0;
  translate(400,0);
  //PRIMER FOR
  for (int i = 2; i < cuadradosdefondo; i ++){ //ciclo for
    pushStyle();
    if (verificaciondecolor == false) { //verdadera
      if(espar(tof)) fill(blanco); else fill(negro); //Aca es la verificacion de blanco y negro
    }
      else { //else que lo pide la consigna
        if(espar(tof)) fill(negro); else fill(blanco); //if que lo pide la consigna
      }
    tof ++;
    float tam = map(i,2,cuadradosdefondo,400,50); // map hecho para la consigna
    rectx = map(i,2,cuadradosdefondo,0,170);
    recty = map(i,2,cuadradosdefondo,0,200);
    rect(rectx,recty,tam,tam);
    popStyle();
  }
  pop();
//SEGUNDO FOR
  push();
  noStroke();
  translate(570,0);
  for (int i = 1; i < lineavertical; i ++){ //ciclo for 2
    pushStyle();
    if (verificaciondecolor == false) {
      if(espar(tof)) fill(blanco); else fill(negro);
    }
      else {
        if(espar(tof)) fill(negro); else fill(blanco);
      }
    tof ++;
    float tam = map(i,1,42,50,50);//400/i; //MAP PEDIDO POR LA CONSIGNA
    rectx = map(i,1,42,0,0);
    recty = map(i,1,42,0,400);
    rect(rectx,recty,tam,tam);
    popStyle();
  }
  pop();
  //TERCER FOR
  push();
  noStroke();
  translate(400,200);
  for (int i = 1; i < lineahorizontal ; i ++){ //ciclo for 3
    pushStyle();
    if (verificaciondecolor == false) {
      if(espar(tof)) fill(negro); else fill(blanco);
    }
      else {
        if(espar(tof)) fill(blanco); else fill(negro);
      }
    tof ++;
    float tam = map(i,1,42,50,50);//400/i; //MAP PEDIDO POR LA CONSIGNA
    rectx = map(i,1,42,0,400);
    recty = map(i,1,42,0,0);
    rect(rectx,recty,tam,tam);
    popStyle();
  }
  pop();
}
boolean espar(int num) {
  if (num % 2 == 0) return true; else return false; // funcion que SÍ retorna un valor
}
void mouseClicked(){ // click event para la consigna
  if (verificacion_color == true) 
  verificacion_color = false;
  else verificacion_color = true; 
}
void keyPressed(){
  if (key == 'r'){ //función de reset de la consigna
  verificacion_color = false;
  negro = 0;
  blanco = 255;
  }
}
