import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reciapp_database/Classes/ClassReciPunto.dart';
import 'package:firebase_database/firebase_database.dart';

class User{
  final String name;
  final String email;
  List<ReciPunto> reciPuntos = [];
  User(this.name,this.email);

}


User user = User('Martin451','martinbarrientos451@gmail.com');


// Gets the amount of ReciPuntos the user has in the database
Future<int> getNumberPoints(User _user) async{
  var DBRef = FirebaseDatabase.instance.reference();
  int counter = 0;
  bool response = true;

  while(response == true){
    String pointnum = "Point " + (counter+1).toString();
    await DBRef.child('users/').child(_user.name).child(pointnum).once().then((DataSnapshot data){
      response = data.exists;
      if(response == true){
        counter++;
      }
    });
  }
  return counter;
}

