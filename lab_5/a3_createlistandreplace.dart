import 'dart:io';

void main(){
  List<String> place=["Delhi","Mumbai","Banglore","Hyderabad","Ahmedabad"];
  for(int i=0;i<place.length;i++){
    if(place[i]=="Ahmedabad"){
      place.remove("Ahmedabad");
      place.add("Surat");
    }
  }
  print(place);
}