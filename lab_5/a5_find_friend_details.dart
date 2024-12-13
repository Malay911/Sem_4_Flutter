import 'dart:io';

void main(){

  List<Map<String,dynamic>> frienddetail = [

    {

      'Name' : 'abc',
      'Mobile' : 123456789,
      'Email' : 'abc@gmail.com'

    },
    {

      'Name' : 'xyz',
      'Mobile' : 1234567890,
      'Email' : 'xyz@gmail.com'

    }

  ];

  stdout.write("Enter name to find data : ");
  String name = stdin.readLineSync()!;

  for(int i = 0;i<frienddetail.length;i++){
    if(frienddetail[i]['Name'] == name){
      stdout.write("${frienddetail[i]}");
      break;
    }
  }
}