import 'dart:io';

void main(){
  print("Enter a number:");
  int a=int.parse(stdin.readLineSync()!);
  int flag=0;
  if(a==0 || a==1){
    flag=1;
  }
  for(int i=2;i<a/2;i++){
    if(a%i==0){
      flag++;
      break;
    }
  }
  if(flag==0){
    print("Number is prime!!");
  }
  else{
    print("Number is not prime!!");
  }
}