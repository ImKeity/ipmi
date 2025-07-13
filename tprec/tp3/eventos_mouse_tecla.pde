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
