/**
 Clase base del nodo.
 
 La clase es abstracta en tanto el nodo no tiene forma.
 La forma de un nodo se implementa en sus las clases derivadas.
 */

abstract class Node {
  // 1. Attributes
  public int indice;
  PVector position;
  float size;
  Boolean selected = false;
  ArrayList<Line> lineas = new ArrayList<Line>();
  ArrayList<Node> nodosHabilitados = new ArrayList<Node>();

  // 2. Constructors
  // 2.1. Default
  Node() {
    setPosition(random(50, width-50), random(50, height-50));
    setSize(random(20, 50));
  }

  // 2.2. Other
  Node(PVector p, float s, int indice) {
    this.indice = indice;
    setPosition(p);
    setSize(s);
  }

  // 3. Methods
  
  boolean esConectado (Node n){
    return nodosHabilitados.contains(n);
  }
  
  Line buscarLinea (Node a, Node b) {
    Line l;
    for(int i=0;i<lineas.size();i++) {
      l = lineas.get(i);
      if (l.esLinea(a,b)) 
        return l;        
    }
    return null;
  }

  // 3.1. Abstract

  abstract void display();

  abstract boolean pick(int x, int y);

  // 3.2. Setters
  void setPosition(PVector pos) {
    position = pos;
  } 
  
  // method overloading
  void setPosition(float x, float y) {
    // call original version on the correct type
    setPosition(new PVector(x, y));
  }
  void setSize(float s) {
    size = s;
  }  
  public String toString() { 
      return "<"+indice+">";
  }   


  // 3.3. Getters
  PVector position() {
    return position;
  }
  float size() {
    return size;
  }
}
