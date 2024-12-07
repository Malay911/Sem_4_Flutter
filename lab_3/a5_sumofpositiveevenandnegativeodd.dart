import 'dart:io';

void main(){
  stdout.write("Would you like to start calculation(y/n) : ");
  String input = stdin.readLineSync()!;
  print(" ");
  int result = 0;
  if(input == 'y'){
    bool flag = true;
    while(flag) {
      stdout.write("Enter a number ");
      int num = int.parse(stdin.readLineSync()!);

      if(num > 0 && num % 2 == 0){
        result += num;
      }
      if(num < 0 && num % 2 == 1){
        result += num;
      }
      if(num == 0){
        flag = false;
      }
    }
    stdout.write("value is $result");
  }
  if(input == 'n'){
    stdout.write("ok bye");
  }
}
