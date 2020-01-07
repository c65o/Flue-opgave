ArrayList<Flue> flueListe = new ArrayList<Flue>();

void setup(){
  size(500,500); //det bestemer størrelsen på vinduet
}

void draw(){ //fluen laves
  for(int i=0; i<flueListe.size(); i++){
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
  }
}

void keyPressed(){ //flue dykker op et random sted i vinduet
  if (key=='e') {flueListe.add(new Flue(random(0,500),random(0,500),2));
  }
}

void mousePressed(){ //flue dukker op der hvor man trykkede med musen
  flueListe.add(new Flue(mouseX, mouseY, 1));
}

/////////////////////////////////////////////////////////
class Flue{ //hvor fluen bliver placeret hvis man trykker på en knap
  
  float positionX,positionY, size;
  float distanceFlyttet;
  float vinkel = 0; 
  
  Flue(){
    positionX  = random(0,height);
    positionY  = random(0,width);
    vinkel     = random(0,2*PI);
  }
  
  Flue(float a, float b, float c){
    positionX = a;
    positionY = b;
    vinkel    = random(0,2*PI);
    size = c;
  }
  
  void flyt(){ //rykker fluerne og bestemmer deres hastighed
    distanceFlyttet = distanceFlyttet + 0.5;
  }

  void tegnFlue(){ //flue tegnes
    pushMatrix();
      translate(positionX,positionY);
      rotate(vinkel);
      translate(distanceFlyttet,0);
        ellipse(0,0,20,8);
        scale(size);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
  } 
}
