int n=10;
int i=0;
int myWidth=800;
int mutationRate=2;
Population p;
Food [][]field;
void setup(){
  size(1200,800);
  field=new Food [height/n][myWidth/n];
  for(int h=0;h<height/n;h++){
    for(int w=0;w<myWidth/n;w++){
      field[h][w]=new Food(h,w);
    }
  }
  p=new Population(100);
  //frameRate(30);
}

void draw(){
  stroke(200);
  for(int h=0;h<height/n;h++){
    for(int w=0;w<myWidth/n;w++){
      field[h][w].displayFood();
    }
  }
  p.live();
  i++;
  if(i%4==0){
    int h=(int)random(height/n);
    int w=(int)random(myWidth/n);
    field[h][w]=new Food(h,w);
  }
}
