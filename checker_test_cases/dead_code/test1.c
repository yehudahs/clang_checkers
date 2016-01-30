int foo(int a, int b){
  return a/b;
}

int bar(){
  int a = 0, b;
  if(a)
    b = 4;
  else
    b=foo(1,1);
  return b;
}