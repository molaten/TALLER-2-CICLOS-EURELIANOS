/**
 Implementacion basica de la clase linea: dibuja, pero
 el estilo no es personalizable.
 
 Implemente la personalizacion del estilo en una de dos
 formas (la que mas le suene):
 1. Mediante atributos adicionales para el estilo (como
 color, tipo de linea, etc); o,
 2. Mediante herencia (como se hace con la clase Node).
 */

 abstract class Line {
  // 1. Attributes
  Node origin, end;
  Boolean selected = false;
  color trazo;

  // 2. Constructors
  // 2.1. Default
  Line(Node node1, Node node2) {
    origin = node1;
    end = node2;
  }

  // 3. Methods

  abstract void display();

  public String toString() { 
      return "["+origin+"-"+end+"]";
  }   
  
  public boolean esLinea (Node a, Node b)
  {
    if ( (origin==a && end==b) || (origin==b && end==a) )
      return true;
    else
      return false;
  }

  // 3.3. Getters
  Node origin() {
    return origin;
  }

  Node end() {
    return end;
  }
}
