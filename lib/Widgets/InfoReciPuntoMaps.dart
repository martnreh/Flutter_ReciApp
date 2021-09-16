import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';





class InfoReciPuntoMaps extends StatefulWidget {
  @override
  _InfoReciPuntoMapsState createState() => _InfoReciPuntoMapsState();
}

class _InfoReciPuntoMapsState extends State<InfoReciPuntoMaps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned( left: 0,right: 0, bottom: 20,
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      ClipRect(
                        child: Image.asset('Images/bateria.png',width: 60,height: 60,fit: BoxFit.cover,),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),


      ),
    );
  }
}
