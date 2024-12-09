import 'dart:io';

void main(){
  print("Enter number1:");
  int a=int.parse(stdin.readLineSync()!);
  print("Enter number2:");
  int b=int.parse(stdin.readLineSync()!);
  max_number(a, b);
}

max_number(int a,int b){
  if(a>b){
    print("$a is greater!!");
  }
  else{
    print("$b is greater!!");
  }
}