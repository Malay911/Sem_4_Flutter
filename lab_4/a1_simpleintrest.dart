import 'dart:io';

void main(){
  print("Enter principal amount:");
  double p=double.parse(stdin.readLineSync()!);
  print("Enter rate:");
  double r=double.parse(stdin.readLineSync()!);
  print("Enter time:");
  double t=double.parse(stdin.readLineSync()!);
  double a= simpleinterest(p, r, t);
  print(a);
}

double simpleinterest(double p,double r,double t){
  return (p*r*t)/100;
}