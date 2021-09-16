import 'dart:ui';
import 'package:reciapp_database/Widgets/InfoReciPuntoMaps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:async/async.dart';
import 'package:reciapp_database/Classes/ClassReciPunto.dart';
import 'package:reciapp_database/Models/FirebaseDataBase.dart';
import 'package:reciapp_database/Models/GoogleMapsStyle.dart';
import 'package:reciapp_database/Classes/ClassUser.dart';


const LatLng SOURCE_LOCATION = LatLng(42.7477863,-71.1699932);
const LatLng DEST_LOCATION = LatLng(42.744421,-71.1698939);
const double CAMERA_ZOOM = 12;
const double CAMERA_TILT = 50;
const double CAMERA_BEARING = 30;


class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();

}

class _GoogleMapsState extends State<GoogleMaps> {
  Set<Marker> _markers = {};
  List<BitmapDescriptor> mapMarker  = [];


  void _onMapCreated(GoogleMapController controller) async{
    controller.setMapStyle(CustomMapStyle.mapStyle);
    await readDataUsers(); //
    print('datos leidos!!!!!!!!!!!!!');
    print('length user.recipuntos = ' + user.reciPuntos.length.toString());
    String imageReference;
    for(int i = 0; i <= (user.reciPuntos.length-1);i++){
      imageReference= await assignImageMarker(user.reciPuntos[i]);
      mapMarker.add(await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, imageReference));
    }

    setState((){
      for(int i = 0; i <= (user.reciPuntos.length-1);i++){
        print('tamaño de mapMarker[] ' + mapMarker.length.toString());
        _markers.add(
          Marker(
            markerId: MarkerId('Point ' + i.toString()),
            position: LatLng(user.reciPuntos[i].latitude, user.reciPuntos[i].longitude),
            icon: mapMarker[i],
            infoWindow: InfoWindow(
              title: user.reciPuntos[i].name,
              snippet: user.reciPuntos[i].address,
              onTap:(){
                build(BuildContext context){
                  InfoReciPuntoMaps();
                }
              }
            ),
          ),
        );
      }
      /*_markers.add(
          Marker(
            markerId: MarkerId('Point ' + 7.toString()),
            position: LatLng(25.70700265435069, -100.35254787464646),
            icon: mapMarker,
            infoWindow: InfoWindow(
                title: 'prueba',
                snippet: 'mitras algo',
                onTap:(){
                  build(BuildContext context){
                    InfoReciPuntoMaps();
                  }
                }
            ),
          ),
      );*/
    });

    print('tamaño markers');
    print(_markers.length);
}

  CameraPosition initialCameraPosition = CameraPosition(
    zoom: CAMERA_ZOOM,
    tilt: CAMERA_TILT,
    bearing: CAMERA_BEARING,
    target: LatLng(25.713247332926002, -100.348127595312),
  );



  @override
  Widget build(BuildContext context) {
    print('google maps llamado');
    return GoogleMap(
      compassEnabled: true,
      tiltGesturesEnabled: true,
      myLocationEnabled: true, //pone punto azul en ubicación actual
      markers: _markers,
      onMapCreated: _onMapCreated,
      myLocationButtonEnabled: true,
      initialCameraPosition: initialCameraPosition,
    );
  }
}





