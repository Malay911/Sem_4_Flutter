import 'dart:io';
void main(){
  // String message = 'Malay';
  print("Enter your name:");
  String message=stdin.readLineSync()!;
  print("Your name is:$message");
}
