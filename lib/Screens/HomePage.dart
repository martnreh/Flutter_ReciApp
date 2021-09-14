import 'package:flutter/material.dart';
//import 'package:flutter_reci_app_final/Widgets/GoogleMaps.dart';
import 'package:reciapp_database/Widgets/LateralMenu.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: LateralMenu(),
        //appBar: AppBar(title:Text('hola'),),
        body: Stack(
          children: [
            //GoogleMaps(), //Call GoogleMaps Widget
            Positioned( top:85, left: 0,right: 0,
                child: Container(
                  padding: EdgeInsets.all(28),
                  margin: EdgeInsets.only(top: 1,bottom: 1,left: 20,right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2),blurRadius: 10, offset: Offset.zero),
                    ],
                  ),
                )
            ),
            Positioned(
              top: 88, left: 28, right: 28,
              child: Container(
                child: Row(
                  children: [
                    Container(
                      width: 40,height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pinimg.com/280x280_RS/d0/c6/f0/d0c6f0d862e86e3c923c5e2089e3d8de.jpg',
                          ),
                        ),
                        border: Border.all(color: Colors.teal,width: 1),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center ,
                        children: [
                          Text('Martin Barrientos',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightGreen ),),
                          Text('Av. Eugenio Garza Sada 2501 Sur' ,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black26 ),),
                        ],
                      ),
                    ),
                    Image(image: AssetImage('Images/greenmarker.png'),height: 50,width: 50,),
                  ],
                ),
              ),
            ),
            Padding( padding:EdgeInsets.only(top:35,left:0,right:210) ,
              child: Column(
                children: [
                  Center(
                    child:Text('Reci',style: TextStyle(fontWeight: FontWeight.w800,color: Colors.lightGreen,fontSize: 35)),
                  ),
                ],
              ),
            ),
            Padding(padding:EdgeInsets.only(top:35,left:0) ,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ],
        )
    );
  }
}
