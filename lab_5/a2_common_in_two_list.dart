import 'dart:collection';
import 'dart:io';

void main(){
  // List<int> nums1 = [1,2,3];
  // List<int> nums2 = [2,3,8];
  List<int> n1 =[];
  List<int> n2 =[];
  for(int i=0;i<3;i++){
    print("Enter value at $i position: ");
    int nums1 = int.parse(stdin.readLineSync()!);
    n1.add(nums1);
  }
  for(int i=0;i<3;i++){
    print("Enter value at $i position: ");
    int nums2 = int.parse(stdin.readLineSync()!);
    n2.add(nums2);
  }
  
  List<int> common = [];

  for(int i = 0;i<n1.length;i++){
    for(int j = 0;j<n2.length;j++){
      if(n1[i] == n2[j]){
        common.add(n1[i]);
      }
    }
  }

  HashSet<int> number = HashSet();

  for(int j in common){
    number.add(j);
  }
  print(number);
}
