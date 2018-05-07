/**
 Nodo de forma circular.
 */

class Circle extends Node {
  @Override
  void display() {
    pushStyle();
    strokeWeight(10);
    if (this.selected) {
      stroke(0, 25, 25);
      fill(0, 21, 22);   
    }
    else
    {
      stroke(0, 0, 255);
      fill(0, 255, 0);         
    }    
    ellipse(position.x, position.y, size, size);
    popStyle();
  }

  @Override
  boolean pick(int x, int y) {
    return sqrt(sq(x-position().x) + sq(y-position().y)) <= size()/2;
  }
  public Circle(PVector p, Float s, int i){
  super(p,s,i);
}
public Circle(){
  super();
}
}
