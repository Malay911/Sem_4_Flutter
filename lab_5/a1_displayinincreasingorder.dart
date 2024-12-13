import 'dart:io';

void main(){
  List<int> list=[];

  for(int i=0;i<5;i++){
    print("Enter value at $i position: ");
    int n = int.parse(stdin.readLineSync()!);
    list.add(n);
  }
  print("Before sorting: $list");
  list.sort();
  print("After sorting: $list");
}