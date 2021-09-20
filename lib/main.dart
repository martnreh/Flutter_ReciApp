import 'package:flutter/material.dart';
import 'package:reciapp_database/Classes/ClassReciPunto.dart';
import 'package:reciapp_database/Screens/AddReciPunto.dart';
import 'package:reciapp_database/Screens/HomePage.dart';
import 'package:reciapp_database/Classes/ClassUser.dart';
import 'package:reciapp_database/Widgets/GooglePlacesAutocomplete.dart';
import 'package:reciapp_database/Widgets/InfoReciPuntoMaps.dart';
import 'package:reciapp_database/Screens/IntroScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reci App',
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
      ),
      //home: HomePage(),
      //initialRoute: '/HomePage.dart',
      initialRoute: '/IntroScreen.dart',

      routes: {
        '/GoogleplacesAutomComplete.dart': (context) => GooglePlacesAutocomplete(),
        '/HomePage.dart': (context) => HomePage(),
        '/AddReciPunto.dart': (context) => AddReciPunto(),
        '/InfoReciPuntoMaps.dart': (context) => InfoReciPuntoMaps(),
        '/IntroScreen.dart': (context) => IntroScreen(),

      },
    );
  }
}



