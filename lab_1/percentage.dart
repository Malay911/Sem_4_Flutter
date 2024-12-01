import 'dart:io';

// void main() {
//   print("enter marks of subject1:");
//   double f1 = double.parse(stdin.readLineSync()!);
//   print("enter marks of subject2:");
//   double f2 = double.parse(stdin.readLineSync()!);
//   print("enter marks of subject3:");
//   double f3 = double.parse(stdin.readLineSync()!);
//   print("enter marks of subject4:");
//   double f4 = double.parse(stdin.readLineSync()!);
//   print("enter marks of subject5:");
//   double f5 = double.parse(stdin.readLineSync()!);
//   double result=((f1+f2+f3+f4+f5)/500)*100;
//   print(result);
// }

void main(){
  print("Enter number of subject:");
  double a = double.parse(stdin.readLineSync()!);
  double sum=0;
  for(int i=0;i<a;i++){
    print("enter marks of subject ${i+1}:");
    double b = double.parse(stdin.readLineSync()!);
    sum +=b;
  }
  double result=(sum/a);
  print(result);
}