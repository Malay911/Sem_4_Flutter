import 'dart:io';

void main() {
  print("Enter a number:");
  int number=int.parse(stdin.readLineSync()!);
  int reversed = 0;
  while (number != 0) {
    int lastDigit = number % 10;
    reversed = reversed * 10 + lastDigit;
    number ~/= 10;
  }

  print('The reversed number is: $reversed');
}