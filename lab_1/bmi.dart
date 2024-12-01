import 'dart:io';

void main(){
  print("enter weight in pounds:");
  double a=double.parse(stdin.readLineSync()!);
  double kg=a*0.45359237;
  print("enter height in inches:");
  double b=double.parse(stdin.readLineSync()!);
  double f=b*0.0254;
  double bmi=kg/(f*f);
  print("BMI:${bmi}");
}