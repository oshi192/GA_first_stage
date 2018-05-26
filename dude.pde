class Dude{
  int x;
  int y;
  int years;
  int direction;
  int speed;
  int health;
  int mass;
  int genesRotate []=new int[1];
  int genesScan []=new int [3];
  int genesLook []=new int [3];
  Dude(){
   years=0;
   x=(int)random(myWidth/n); 
   y=(int)random(height/n); 
   direction=(int)random(8)+1;
   speed=1;
   health=500;  
   genesRotate[0]=(int)random(2);
   for(int i=0;i<genesScan.length;i++){
     genesScan[i]=(int)random(2);
   }
   for(int i=0;i<genesLook.length;i++){
     genesLook[i]=(int)random(2);
   }
  }
  
  void display(){
    if(health>0){
      fill(200,0,255);
    }else{
      fill(100,75,155);
    }
    rect(x*n,y*n,n,n); 
    textSize(n/2);
    fill(255);
    text(health,x*n,y*n+n);
    stroke(0);
    line(x*n+n/2,y*n+n/2,calcNewX()*n+n/2,calcNewY()*n+n/2);
  }
  
  void live(Food [][]field){
    if(health>0){
//--------Rotation-----------------------------------------------------------
    rotateDude();
//--------Scan-----------------------------------------------------------
    if(field[y][x].ft==FoodType.NONE){
     if(genesScan[0]==0)rotateDude();
    }
    if(field[y][x].ft==FoodType.GOOD){
     if(genesScan[0]==0)rotateDude();
     else {
       health+=field[y][x].calories;
       field[y][x].ft=FoodType.NONE;
     }
    }
    if(field[y][x].ft==FoodType.GOOD){
     if(genesScan[0]==0)rotateDude();
     else {
       health-=field[y][x].calories;
       field[y][x].ft=FoodType.NONE;
     }
    }
//--------Look-----------------------------------------------------------
    if(calcNewX()>=0 & calcNewX()<myWidth/n & calcNewY()>=0 & calcNewY()<height/n){
      Food f=field[calcNewY()][calcNewX()];
      switch (f.ft){
        case NONE: if(genesLook[0]==0)rotateDude(); else changeLocation();break;
        case GOOD: if(genesLook[1]==0)rotateDude(); else changeLocation();break;
        case BAD: if(genesLook[2]==0)rotateDude(); else changeLocation();break;
      }
    }else rotateDude();
    health-=5;
    years++;
 //-----------------------else stuff-------------------------------------------------------   
    }
  }
  
  private void changeLocation(){
    x=calcNewX();
    y=calcNewY();
  }
  private int calcNewX(){
    if(direction>2 & direction <6){
      return x+1;
    }  
    if(direction==1 | direction ==8 |direction ==7){
      return x-1;
    }
      return x;
  }
  private int calcNewY(){
    if(direction>0 & direction <4){
      return y-1;
    }  
    if(direction>3 & direction <8){
      return y+1;
    }
      return y;
  }
  
  
  private void rotateDude(){
    direction+=genesRotate[0];
    if(direction<=0){direction=8-direction;}else{if(direction>=9)direction=direction%8;}
  }
  
  
  public Dude copyDude(){
    Dude d=new Dude();
    d.genesRotate=genesRotate.clone();
    d.genesScan=genesScan.clone();
    d.genesLook=genesLook.clone();
    return d;
  }
  
  void mutate(){
    for(int i=0;i<genesRotate.length;i++){
      if(random(100)<mutationRate){
        genesRotate[i]=(int)random(2);
      }
    }
    for(int i=0;i<genesScan.length;i++){
      if(random(100)<mutationRate){
        genesScan[i]=(int)random(2);
      }
    }
    for(int i=0;i<genesLook.length;i++){
      if(random(100)<mutationRate){
        genesLook[i]=(int)random(2);
      }
    }
  }
}
