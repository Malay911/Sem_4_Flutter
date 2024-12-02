import 'dart:io';

void main(){
  print("Enter a number1:");
  int a=int.parse(stdin.readLineSync()!);
  print("Enter a number2:");
  int b=int.parse(stdin.readLineSync()!);
  print("Enter a number3:");
  int c=int.parse(stdin.readLineSync()!);
  int big=(a>b && a>c ? a:b > c ? b:c);
  print("\nThe biggest number is:${big}");
}