
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:reciapp_database/Classes/ClassReciPunto.dart';
import 'package:reciapp_database/Classes/ClassUser.dart';


void writeData(ReciPunto _punto) async{
  var DBRef = FirebaseDatabase.instance.reference();
  int _numberOfPoints = await getNumberPoints(user) + 1;
  String pointnum = "Point " + _numberOfPoints.toString();
  DBRef.child('users/').child(user.name).child(pointnum).set( _punto.changetoJson());
}





void readDataUsers() async {
  var DBRef = FirebaseDatabase.instance.reference();
  int _numberOfPoints = await getNumberPoints(user);
  for(int i = 1; i <= _numberOfPoints; i++){
    String pointnum = "Point " + i.toString();
    var response =  await DBRef.child('users/').child(user.name).child(pointnum).once().then((DataSnapshot data){

      var _materials = List<String>.from(data.value['materials']); //transform from List<Object> to List<String>
      var _calendar = List<String>.from(data.value['calendar']); //transform from List<Object> to List<String>

      //Add all ReciPuntos to the user list reciPuntos
      user.reciPuntos.add(
          ReciPunto(data.value['name'], data.value['address'],
              data.value['latitude'], data.value['longitude'],
              _materials, data.value['phone'],
              data.value['contact'], _calendar));
    });
  }
}