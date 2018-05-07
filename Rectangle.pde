/**
 Nodo de forma rectangular.
 */

class Rectangle extends Node {
  @Override
  void display() {
    pushStyle();
    rectMode(CENTER);
    strokeWeight(10);
    if (this.selected) {
      stroke(0, 21, 21);
      fill(0, 21, 22);         
    }
    else
    {
      stroke(0, 0, 255);
      fill(255, 255, 0);
    }
    rect(position.x, position.y, size, size);
    popStyle();
  }

  @Override
  boolean pick(int x, int y) {
    return abs(x-position().x) <= size()/2 && abs(y-position().y) <= size()/2;
  }
  
  public Rectangle(PVector p,float s, int i){
    super(p,s,i);
  }

  public Rectangle(){
    super();  
  }
}
