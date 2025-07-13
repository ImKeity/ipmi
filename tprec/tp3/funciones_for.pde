void dibujarRect() { //funcion que NO retorna un valor
//PRIMER FOR
  push();
  noStroke();
  int tof = 0;
  float rectx=0;
  float recty=0;
  translate(400,0);
  for (int i = 2; i < 23; i ++){ //ciclo for
    pushStyle();
    if (verificacion_color == false) {
      if(espar(tof)) fill(blanco); else fill(negro); //Aca es la verificacion de blanco y negro
    }
      else { //else que lo pide la consigna
        if(espar(tof)) fill(negro); else fill(blanco); //if que lo pide la consigna
      }
    tof ++;
    float tam = map(i,2,23,400,50); // map hecho para la consigna
    rectx = map(i,2,23,0,170);
    recty = map(i,2,23,0,200);
    rect(rectx,recty,tam,tam);
    popStyle();
  }
  pop();
//SEGUNDO FOR
  push();
  noStroke();
  translate(520,0);
  for (int i = 1; i < 42; i ++){ //ciclo for 2
    pushStyle();
    if (verificacion_color == false) {
      if(espar(tof)) fill(blanco); else fill(negro);
    }
      else {
        if(espar(tof)) fill(negro); else fill(blanco);
      }
    tof ++;
    float tam = map(i,1,42,50,50);//400/i; //MAP PEDIDO POR LA CONSIGNA
    rectx = map(i,1,42,50,50);
    recty = map(i,1,42,0,400);
    rect(rectx,recty,tam,tam);
    popStyle();
  }
  pop();
  //TERCER FOR
  push();
  noStroke();
  translate(400,200);
  for (int i = 1; i < 42; i ++){ //ciclo for 3
    pushStyle();
    if (verificacion_color == false) {
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
