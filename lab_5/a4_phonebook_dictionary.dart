import 'dart:io';

void main(){

  List<Map<String,dynamic>> phonebook = [

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

  print(phonebook);
  // stdout.write("Enter name to find data : ");
  // String name = stdin.readLineSync()!;
  //
  // for(int i = 0;i<phonebook.length;i++){
  //
  //   if(phonebook[i]['Name'] == name){
  //
  //     stdout.write("${phonebook[i]}");
  //     break;
  //
  //   }
  //
  // }
}