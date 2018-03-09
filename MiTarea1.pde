
// a partir de un código base desarrollé el juego POLUX LA PERRA. 
// Polux es una beagle. 
//El juego consiste en que Polux (el cursor) 
//ladra hasta encerrar las obejas (las bolas) 
//en el establo (el cuadrado)



// En este Link está el código original sobre el que basé mi ejercicio: https://github.com/ivanmoreno01/Processing
//

// estas son las obejas:
Pelota miPelota1;
Pelota miPelota2;
Pelota miPelota3;
Pelota miPelota4;
Pelota miPelota5;
Pelota miPelota6;
Pelota sinPelota; // esta y la siguiente pelota ayudan a que se muevan las pelotas con el cursor
Pelota movediza;

int borde; //variable para mover las bolas

void setup() { 
  size (1920, 1080);
  miPelota1= new Pelota(width/4, height/2);
  miPelota2= new Pelota(width*3/4, height/2);
miPelota3= new Pelota(width*2/4, height/2);
miPelota4= new Pelota(width*1/4, height/2);
miPelota5= new Pelota(width*1.5/4, height/2);
miPelota6= new Pelota(width/5, height/5);


}

void draw() {
  background(200,noise(220,225),noise(220,225));
  rect(0,0,200,200); //este cuadrado es a donde Polux debe llevar a las obejas.
  miPelota1.move();
  miPelota2.move();
 miPelota3.move();
 miPelota4.move();
  miPelota5.move();
  miPelota6.move();
  miPelota1.display();
  miPelota2.display();
  miPelota3.display();
miPelota4.display();
miPelota5.display();
miPelota6.display();

// con estas órdenes, la perra polux empuja las obejas al cuadrado.

borde=10;
movediza= new Pelota(width=(mouseX+35), height=(mouseY+35));
sinPelota = new Pelota(width/2, height/2);
if (mousePressed && (mouseButton == LEFT) && (sinPelota==movediza)){
   miPelota1=sinPelota; 
   miPelota2=sinPelota; 
   miPelota3=sinPelota; 
   miPelota4=sinPelota; 
   miPelota5=sinPelota; 
   miPelota6=sinPelota; 

   }
}  

class Pelota {
  // DATOS
  float xpos;  // posicion x de la pelota
  float ypos;  // posicion y de la pelotq
  color c;
  float vx;  // velocidad x pelota
  float vy;  // velocidad y pelota
  float diameter;
  float r;
  float g;
  float b;

 // CONSTRUCTOR
  Pelota(float xposTemp, float yposTemp) {
    c= color(random(0,255), 220, 200);
    xpos=xposTemp;
    ypos=yposTemp;
    vx=random(-5, 5);
    vy=random(-5, 5); 
    diameter= 35;
    r=random(0, 255);
    g=random(0, 255);
    b=random(0, 255);
  }
   // FUNCIONES
  void display() {
    noFill();
    stroke(r, g, b);
    strokeWeight(borde);
    ellipse(xpos, ypos, diameter, diameter);
  }
  void move() {
    xpos=xpos+vx;
    ypos=ypos+vy;
   
    if ((xpos>width-diameter/2)||(xpos-diameter/2<0)) {
      vx=-vx;
    }  
    if ((ypos>height-diameter/2)||(ypos-diameter/2<0)) {
      vy=-vy;
    }  
    if ((xpos<190-diameter/2) && (ypos<190-diameter/2)) { // esto hará que las bolas/obejas se queden encerradas en el cuadrado una vez ingresen
      vx=0;
      vy=0;
    
   
    }
  }
}