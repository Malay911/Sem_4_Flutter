import 'dart:io';

void main(){
  print("Enter a number:");
  int a=int.parse(stdin.readLineSync()!);
  
  int fac=1;
  for(int i=2;i<=a;i++){
    fac=fac*i;
  }
  print(fac);
}
