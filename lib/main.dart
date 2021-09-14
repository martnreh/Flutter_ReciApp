import 'package:flutter/material.dart';
import 'package:reciapp_database/Classes/ClassReciPunto.dart';
import 'package:reciapp_database/Screens/AddReciPunto.dart';
import 'package:reciapp_database/Screens/HomePage.dart';
import 'package:reciapp_database/Classes/ClassUser.dart';

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
      initialRoute: '/HomePage.dart',
      routes: {
        '/HomePage.dart': (context) => HomePage(),
        '/AddReciPunto.dart': (context) => AddReciPunto(),
        //'/IntroScreen.dart': (context) => IntroScreen(),

      },
    );
  }
}



