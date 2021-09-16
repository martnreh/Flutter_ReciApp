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
  if(_recipunto.materials.length == 1 && _recipunto.materials.contains("papel")){
    imageMarker = 'Images/MarkerCardboard.png';
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains("bateria")){
    imageMarker = 'Images/MarkerBattery.png';
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains("tela")){
    imageMarker = 'Images/MarkerFabric.png';
  }
  else if(_recipunto.materials.length == 1 && _recipunto.materials.contains("vidrio")){
    imageMarker = 'Images/MarkerGlass.png';
  }
  else if(_recipunto.materials.length >= 1 && (_recipunto.materials.contains('pl1') || _recipunto.materials.contains('pl2') || _recipunto.materials.contains('pl3') || _recipunto.materials.contains('pl4') || _recipunto.materials.contains('pl5')|| _recipunto.materials.contains('pl6') || _recipunto.materials.contains('pl7') )){
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







