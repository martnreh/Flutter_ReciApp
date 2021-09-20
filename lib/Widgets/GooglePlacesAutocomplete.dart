import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:reciapp_database/Models/Credentials.dart';




class GooglePlacesAutocomplete extends StatefulWidget {
  @override
  _GooglePlacesAutocompleteState createState() => _GooglePlacesAutocompleteState();
}

class _GooglePlacesAutocompleteState extends State<GooglePlacesAutocomplete>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
         children: [
           Padding(
             padding: EdgeInsets.only(top: 50),
             child: TextField(
               decoration: InputDecoration(hintText: 'ej. Av. Cristóbal Colón 3128, Acero, Monterrey, N.L.',
                   labelText: 'Dirección',
                   labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                   fillColor: Colors.green[100],
                   filled: true
               ),
               onChanged: (String str){
                 setState(() {
                    //address = str;
                 });
               },
             ),
           ),
         ],
      )
    );
  }
}

