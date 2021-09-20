import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ReciPunto {
  String name;
  String address;
  double latitude;
  double longitude;
  List<String> materials;
  String phone;
  String contact;
  List<String> calendar;

  ReciPunto(this.name, this.address, this.latitude, this.longitude,
      this.materials, this.phone, this.contact, this.calendar);

  Map<String, dynamic> changetoJson(){
    return {
      'name': this.name,
      'address': this.address,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'materials': this.materials,
      'phone': this.phone,
      'contact': this.contact,
      'calendar': this.calendar,
    };
  }
}


String assignImageMarker(ReciPunto _recipunto){
  String imageMarker;
  if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Cartón/Papel')){
    imageMarker = 'Images/MarkerCardboard.png';
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Baterías')){
    imageMarker = 'Images/MarkerBattery.png';
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Ropa y Telas')){
    imageMarker = 'Images/MarkerFabric.png';
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Vidrio')){
    imageMarker = 'Images/MarkerGlass.png';
  }
  else if(_recipunto.materials.length >= 1 && ((_recipunto.materials.contains('Plástico 1') || _recipunto.materials.contains('Plástico 2') || _recipunto.materials.contains('Plástico 3') || _recipunto.materials.contains('Plástico 4') || _recipunto.materials.contains('Plástico 5')|| _recipunto.materials.contains('Plástico 6') || _recipunto.materials.contains('Plástico 7') ))){
    imageMarker = 'Images/MarkerPlastic.png';
  }
  else if(_recipunto.materials.length >= 4) {
    imageMarker = 'Images/MarkerAll.png';
  }

  else{
    imageMarker = 'Images/MarkerAll.png';
  }

  return imageMarker;

}

Color assignColorPunto(ReciPunto _recipunto){
  Color color;
  if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Cartón/Papel')){
    color = Colors.brown[500];
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Baterías')){
    color = Colors.grey;
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Ropa y Telas')){
    color = Colors.deepOrangeAccent;
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Vidrio')){
    color = Colors.blueAccent;
  }
  else if(_recipunto.materials.length >= 1 && ((_recipunto.materials.contains('Plástico 1') || _recipunto.materials.contains('Plástico 2') || _recipunto.materials.contains('Plástico 3') || _recipunto.materials.contains('Plástico 4') || _recipunto.materials.contains('Plástico 5')|| _recipunto.materials.contains('Plástico 6') || _recipunto.materials.contains('Plástico 7') ))){
    color = Colors.black45;
  }
  else if(_recipunto.materials.length >= 4) {
    color = Colors.black45;
  }

  else{
    color = Colors.black45;
  }

  return color;

}



String assignImage(ReciPunto _recipunto) {
  String imageMarker;
  if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Cartón/Papel')){
    imageMarker = 'Images/OrigMarkerCardboard.png';
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Baterías')){
    imageMarker = 'Images/OrigMarkerBattery.png';
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Ropa y Telas')){
    imageMarker = 'Images/OrigMarkerFabric.png';
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains('Vidrio')){
    imageMarker = 'Images/OrigMarkerGlass.png';
  }
  else if(_recipunto.materials.length >= 1 && (_recipunto.materials.contains('Plástico 1') || _recipunto.materials.contains('Plástico 2') || _recipunto.materials.contains('Plástico 3') || _recipunto.materials.contains('Plástico 4') || _recipunto.materials.contains('Plástico 5')|| _recipunto.materials.contains('Plástico 6') || _recipunto.materials.contains('Plástico 7') )){
    imageMarker = 'Images/OrigMarkerPlastic.png';
  }
  else if (_recipunto.materials.length >= 4) {
    imageMarker = 'Images/OrigMarkerAll.png';
  }

  else {
    imageMarker = 'Images/OrigMarkerAll.png';
  }

  return imageMarker;
}




