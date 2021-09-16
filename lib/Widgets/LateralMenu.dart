import 'package:flutter/material.dart';
import 'package:reciapp_database/Screens/AddReciPunto.dart';
import 'package:reciapp_database/Classes/ClassUser.dart';

class LateralMenu extends StatefulWidget {
  @override
  _LateralMenuState createState() => _LateralMenuState();
}

class _LateralMenuState extends State<LateralMenu> {
  @override
  Widget build(BuildContext context) {
    Color customColor = Colors.lightGreen[700];
    return Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: customColor,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 200,
                      margin: EdgeInsets.only(top:10,bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: new AssetImage('Images/ImageUserMartin.png'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.teal,width: 5),
                      ),
                    ),
                    Text(user.name, style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 22)),
                    Container(
                      margin: EdgeInsets.only(top:5),
                    ),
                    Text(user.email, style: TextStyle(fontWeight: FontWeight.w800,color: Colors.black45,fontSize: 14)),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile',style: TextStyle(fontSize: 18),),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',style: TextStyle(fontSize: 18),),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.arrow_back_rounded),
              title: Text('Logout',style: TextStyle(fontSize: 18),),
              onTap: (){
                Navigator.of(context).pop();

                if (ModalRoute.of(context).settings.name == '/HomePage.dart'){
                  Navigator.of(context).pop();
                }
                Navigator.of(context).pushNamed('/IntroScreen.dart');


              },
            ),
            SizedBox(
              height: 160,
            ),
            ElevatedButton( style: ElevatedButton.styleFrom(shadowColor: Colors.white24,primary: Colors.lightGreen),
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/AddReciPunto.dart');
              },
              child:Text('Crear un ReciPunto',style:TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 20)),
            ),
          ],
        )
    );
  }
}
