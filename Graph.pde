/**
 Un grafo esta compuesto de un conjunto de nodos
 y un conjunto de lineas.
 */

class Graph {
  // 1. Attributes
  Node[] nodes;
  Line[] lines;
  Table tablaPunto;
  Table tablaConexiones;
  int numNodos;
  Node nodoActivo;
  int movimientos;
  boolean fin=false;
  boolean gano=false;


  // 2. Constructors
  // 2.1. Default in this case dummy constructor
  Graph() {

    nodes = new Node[int(random(5, 15))];
    for (int i = 0; i < nodes.length; i++)
      nodes[i] = i<5 ? new Circle() : new Rectangle();
      
    // conecta todos los nodos en bucle
    lines = new Line[nodes.length];
    for (int i = 0; i < lines.length; i++)
      if (i < lines.length-1)
        lines[i] = i< 5 ?new Line_normal(nodes[i], nodes[i+1]):new Linea_diferente(nodes[i], nodes[i+1]);
      else
        lines[i] = new Line_normal(nodes[i], nodes[0]);
  }

  // 2.2. Main constructor
  // file es un archico csv ubicado en la carpeta
  // data del sketch. Implemente este constructor
  // empleando Table (https://processing.org/reference/Table.html)
  Graph(String file, String file2) {

    tablaPunto = loadTable(file);
    numNodos = tablaPunto.getRowCount();
    nodes=new Node[numNodos-1];    
    for (int l=0; l< numNodos-1; l++) {
      float posx = tablaPunto.getFloat(l+1, 0);
      float posy = tablaPunto.getFloat(l+1, 1);
      PVector position = new PVector(posx,posy);
      Node nodo;
      if (l<3)
        nodo = new Circle(position, (float)30,l);
      else 
        nodo = new Rectangle(position,(float)30,l);        
      nodes[l]= nodo;
      
    }
    
    tablaConexiones= loadTable(file2);
    //lines = new Line[nodes.length];
    int c=0;
    for (int i=0; i<tablaConexiones.getRowCount(); i++) {  
      for (int j=0; j<tablaConexiones.getRowCount(); j++) {
        float a= tablaConexiones.getFloat(i, j);
        if (a==1) {
          c++;
        }
      }
    }

    lines = new Line[c];
    int x=0;
    int y=0;
    int p=-1;
    for(int i=0;i<tablaConexiones.getRowCount();i++)
    {
      for(int j=0;j< tablaConexiones.getRowCount();j++)
      {
        if(tablaConexiones.getFloat(i, j)==1)
        {
          x=i;
          y=j;
          p++;
          
          Line linea;
          if (i< 2)
            linea = new Line_normal(nodes[x], nodes[y]);
          else
            linea = new Linea_diferente(nodes[x], nodes[y]);
          
          nodes[i].nodosHabilitados.add(nodes[j]);
          nodes[j].nodosHabilitados.add(nodes[i]);
          
          nodes[i].lineas.add(linea);          
          nodes[j].lineas.add(linea);
          
          lines[p] = linea;
        }
      }
    }
  }
  

  
  void selectNode() {
    boolean esConectado = false;
    movimientos = 0;
    for (int i=0; i<numNodos-1; i++){
      boolean nodoSeleccionado = nodes[i].pick(mouseX,mouseY);
      if (nodoSeleccionado) {
        Line linea;
        Node nodoSelected;
        Node nodoAnterior = nodoActivo;
        nodoActivo = nodes[i];        
        if (nodoAnterior == null){ 
          nodoActivo.selected = true;
          return;
        }
        else
        esConectado = nodoAnterior.esConectado(nodoActivo);
        
                            
     
        if (esConectado) { //Hubo conexión
          nodoAnterior.selected = false;
          nodoActivo.selected = true;
          
          //Bsucar linea
          linea = nodoActivo.buscarLinea(nodoActivo,nodoAnterior);
          //print("Linea: ", linea);
          linea.selected = true;
          
          // Sacar de los nodos habilitados
          nodoActivo.nodosHabilitados.remove(nodoAnterior);
          nodoAnterior.nodosHabilitados.remove(nodoActivo);
          
        } else { //No hubo conexi{on 
          nodoActivo = nodoAnterior;
        }
        
        print("\n, Nodo activo actual: ", nodoActivo, ". Nodo activo anterior: ", nodoAnterior,". Es conectado:",esConectado,"\n");            
        print("Nodos habilitqdos de nodo actual:");
        printArray(nodoActivo.nodosHabilitados);
        if (nodoActivo.nodosHabilitados.size()==0) {
          print("\n FIN! \n");
          fin = true;
        }
      }
      movimientos += nodes[i].nodosHabilitados.size();
    }
    

    if (movimientos<=1)
      gano = true;    
    print("movimientos: ",movimientos,". gano=",gano,"\n");      
  }
  
    
  void display() {
    //print(x,y,"\n"); //Mpuse
    pushStyle();
    strokeWeight(10);
    stroke(11, 255, 0);
    for (int i = 0; i < nodes.length; i++)
      nodes[i].display();
    for (int i = 0; i < lines.length; i++)
      lines[i].display();
    popStyle();
  }
}
