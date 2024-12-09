import 'dart:io';

void main(){
  print("Enter a number:");
  int n=int.parse(stdin.readLineSync()!);
  fibonacci(n);
}

fibonacci(int n) {
  if (n < 1) {
    print("Invalid number!");
  }
  int prev1 = 1;
  int prev2 = 0;
  if(n>=1){
    print("$prev2");
  }
  if(n>=2){
    print("$prev1");
  }
  for (int i = 3; i <= n; i++) {
    int curr = prev1 + prev2;
    prev2 = prev1;
    prev1 = curr;
    print("$curr");
  }
}