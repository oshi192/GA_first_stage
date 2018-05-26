class Population{
  Dude[] dudes;
  
  Population(int popSize){
    dudes =new Dude[popSize];
    for(int i=0;i<dudes.length;i++){
      dudes[i]=new Dude();
    }
  }
  void live(){
    if(isAlive()){
      displayDudes();
    }else{
      sortDudes();
      topView();//сортування
      selection();//створення нової популяції
      println("created new population!!! ");
    }
  }
  private void sortDudes(){
    println("start sorting");
    for(int j=0;j<dudes.length;j++){
     for(int i=0;i<dudes.length-1-j;i++){
       if(dudes[i].years<dudes[i+1].years){
         Dude tmp=dudes[i];
         dudes[i]=dudes[i+1];
         dudes[i+1]=tmp;         
       }
     }
    }
    println("end sorting");
  }
  
  private void selection(){
    println("start selection");
    Dude []newDudes=new Dude[dudes.length];
    for(int i=0;i<newDudes.length;i++){
      newDudes[i]=dudes[(int)random(dudes.length/10)].copyDude();
      newDudes[i].mutate();
    }
    dudes=newDudes;
    println("end selection");
  }
  
  public void displayDudes(){
    for(Dude d:dudes){
      d.live(field);
      d.display();
    }
  }
  
  private boolean isAlive(){
    for(Dude d:dudes){
      if(d.health>0)return true;
    }
    return false;
  }
  
  void topView(){
    fill(200);
    rect(myWidth,0,width-myWidth,height);
    textSize(n);
    fill(0);
    for(int i=0;i<dudes.length;i++){
      int x=myWidth+10+n*5*(int)((i*(n+2)+1)/height);
      println(x);
      int y=(i*(n+2)+1)%height+n;
      text(i+")\t"+dudes[i].years,x,y);
    }
  }
}
