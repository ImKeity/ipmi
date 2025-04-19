PImage miImagen; // Declaración global de la variable miImagen

void setup(){
  size(1000, 400); //ancho y alto de la altura de pantalla
  miImagen = loadImage("casadepaja.png");
}

void draw(){
 background(200);
  image(miImagen , 0, 0 ,510, 400);//ancho y altura de la imagen
  line(510,87,999,59);
  line(510,182,999,174);
  line(510,220,999,210);
  noStroke();
  fill(255, 200, 150); //amarillo pastel
  quad(509, 0, 999, 0, 999,60,509, 88);
  fill(150, 150, 150, 100);//gris claro
  quad(510,88, 999, 60, 999,174,510, 182);
  fill(130, 140, 170); //azul gris
  quad(510, 180, 999, 174, 1000, 215, 510, 220);
  fill(255, 255, 255);
  quad(510,220,999,215,999,400,510,400);
  fill(100, 120, 180, 100);
  quad(760,220,920 ,350,750,495,600,345); //sombra de las pajas de casa
  fill(100, 120, 180, 100);
  quad(700,187,750,250,600,295,550,266); //sombra chiquita de las pajas de casa
  fill(82, 66, 43); //cuadrado
  rect(600, 200, 122, 40); 
  fill(160, 120, 80); //triangulo
  triangle(670, 120,735, 200, 600, 200); 
  fill(82, 66, 43);
  rect(650, 234, 200, 72);
  fill(160, 120, 80);
  triangle(650, 234, 740, 87, 852, 234);
  //buenas profesor esto lo hice con 1000x400 ojala no afecte mi nota por si era obligatorio hacerlo 800x400.
 
 

  }
