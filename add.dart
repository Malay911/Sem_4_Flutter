import 'dart:io';
void main(){
  print("enter number1:");
  int a=int.parse(stdin.readLineSync()!);
  print("enter number2:");
  int b=int.parse(stdin.readLineSync()!);
  print(a+b);
}