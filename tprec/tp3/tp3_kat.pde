//Hola buenas noches profesor, soy Yanira Del Pilar Gomez Romero, no pude hacer el for anidado porque no se aplica a la forma de mi obra.
// LEGAJO : 122713/6
//VIDEO : https://youtu.be/y3wyALihKhU

PImage cuadro;
boolean verificacion_color = false;
float negro = 0;
float blanco = 255;

void setup (){
  size (800,400); // tamaño aplicado obligatorio para el t.p
  background(200);
  cuadro = loadImage("cuadro.png");
}

void draw(){
  dibujarRect();
  strokeWeight(4);
  fill(189,0,0);
  rect(568,196,55,55);
  image(cuadro,0,0,400,400); //imagen de referencia a la izquierda
  println(mouseX,mouseY);
}
 
