/**
 Para cambiar el 'nivel' presione cualquier tecla
 */

Graph[] levels;
// total, current por defecto vale 0
// ver: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html
int total, current;


void setup() {
  size(600, 600);
  // numero total de niveles
  total = 5;
  levels = new Graph[total];
  for (int i = 0; i < levels.length; i++)
    levels[0] = new Graph ("puntos1.csv","conexiones1.csv"); //Crear un Graph
    levels[1] = new Graph ("puntos2.csv","conexiones2.csv");
    levels[2] = new Graph ("puntos3.csv","conexiones3.csv");  
    levels[3] = new Graph ("puntos4.csv","conexiones4.csv"); 
    levels[4] = new Graph ("puntos5.csv","conexiones5.csv");
    //levels[i]=  new Graph();
}

void draw() {
  background(25,200,25);
  levels[current].display();
  if (levels[current].fin){
    if(levels[current].gano) 
      current = current < total-1 ? current+1 : 0;
    else
      levels[current] = new Graph ("puntos"+(current+1)+".csv","conexiones"+(current+1)+".csv"); 
  }
}

void mousePressed() {
  levels[current].selectNode();
}

void keyPressed() {
  
}
