import 'dart:io';

void main(){
  print("Enter subject1 marks:");
  double a=double.parse(stdin.readLineSync()!);
  print("Enter subject2 marks:");
  double b=double.parse(stdin.readLineSync()!);
  print("Enter subject3 marks:");
  double c=double.parse(stdin.readLineSync()!);
  print("Enter subject4 marks:");
  double d=double.parse(stdin.readLineSync()!);
  print("Enter subject5 marks:");
  double e=double.parse(stdin.readLineSync()!);
  double result=(a+b+c+d+e)/5;
  print(result);

  if(result<35){
    print("Class:Fail");
  }
  else if(result>=35 && result<45){
    print("Class:Pass");
  }
  else if(result>=45 && result<60){
    print("Class:Second");
  }
  else if(result>=60 && result<70){
    print("Class:First");
  }
  else{
    print("Class:Distinction");
  }
}