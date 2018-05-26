class Food{
  int x;
  int y;
  float calories;
  FoodType ft;
  
  Food(int h,int w){
   x=w; 
   y=h; 
   calories=random(70,100);
   int i=(int)random(10);
   if(i<2){ft=FoodType.values()[i];}else{ft=FoodType.values()[2];}
  }
  void displayFood(){
    if(ft==FoodType.GOOD){
      fill(255-(calories-70)*6,calories*2.5,0);
    }
    if(ft==FoodType.BAD){
      fill(255,0,0);
    }
    if(ft==FoodType.NONE){
      fill(255);
    }    
    rect(x*n,y*n,n,n);
  }
}