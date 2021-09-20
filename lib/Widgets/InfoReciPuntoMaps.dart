import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reciapp_database/Widgets/GoogleMaps.dart';
import 'package:reciapp_database/Classes/ClassReciPunto.dart';
import 'package:reciapp_database/Classes/ClassUser.dart';




class InfoReciPuntoMaps extends StatefulWidget {
  @override
  _InfoReciPuntoMapsState createState() => _InfoReciPuntoMapsState();


}

class _InfoReciPuntoMapsState extends State<InfoReciPuntoMaps> {

  @override
  Widget build(BuildContext context) {
    //Provide screen height and width
    Size sizeScreen = MediaQuery.of(context).size;
    //Assign color depending of point
    Color _backgroundColor = assignColorPunto(SELECTEDRECIPUNTO);

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(backgroundColor: _backgroundColor,elevation: 0,iconTheme: IconThemeData(color: Colors.white),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: sizeScreen.height * 1.30,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Center(child: Text(SELECTEDRECIPUNTO.name,style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 25))),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            PrepareImagebuilder(context,sizeScreen),//Custom functions to load images async with loading
                          ],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: sizeScreen.height * 0.35),
                    height: sizeScreen.height*2,
                    width: sizeScreen.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text('Materiales:', textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black,fontSize: 25)),
                        SizedBox(height: 20,),
                        //Function down the code the load list of Chip Widgets inside a stack
                        getChipsMaterials(SELECTEDRECIPUNTO.materials),
                        Divider(thickness: 1, color: Colors.lightGreen,),

                        SizedBox(height: 15,),
                        Text('Horario:', textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black,fontSize: 25)),
                        SizedBox(height: 15,),
                        Center(child: Column(
                            children: [
                            for(int i = 0; i <= SELECTEDRECIPUNTO.calendar.length-1;i++) Text(SELECTEDRECIPUNTO.calendar[i],style: TextStyle(color: Colors.black,fontSize: 15))
                        ],
                        )),
                        SizedBox(height: 15,),
                        Divider(thickness: 1, color: Colors.lightGreen,),


                        SizedBox(height: 15,),
                        Text('Dirección:', textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black,fontSize: 25)),
                        SizedBox(height: 15,),
                        Center(child: Text(SELECTEDRECIPUNTO.address,style: TextStyle(color: Colors.black,fontSize: 15))),
                        SizedBox(height: 15,),
                        Divider(thickness: 1, color: Colors.lightGreen,),

                        SizedBox(height: 15,),
                        Text('Usuario:', textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black,fontSize: 25)),
                        SizedBox(height: 15,),
                        Center(child: Text(user.name,style: TextStyle(color: Colors.black,fontSize: 15))),
                        SizedBox(height: 15,),
                        Divider(thickness: 1, color: Colors.lightGreen,),

                        SizedBox(height: 15,),
                        Text('Teléfono:', textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black,fontSize: 25)),
                        SizedBox(height: 15,),
                        Center(child: Text(SELECTEDRECIPUNTO.phone,style: TextStyle(color: Colors.black,fontSize: 15))),
                        SizedBox(height: 15,),
                        Divider(thickness: 1, color: Colors.lightGreen,),

                        SizedBox(height: 15,),
                        Text('Contacto:', textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black,fontSize: 25)),
                        SizedBox(height: 15,),
                        Center(child: Text(SELECTEDRECIPUNTO.contact,style: TextStyle(color: Colors.black,fontSize: 15))),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


// Function that creates al Chip wigets with the list of materials
Widget getChipsMaterials(List<String> materials) {
  List<Widget> list = new List<Widget>();
  for(var i = 0; i < materials.length; i++){
    list.add(new Chip(
      label: Text(SELECTEDRECIPUNTO.materials[i]),
      backgroundColor: assignColorChip(SELECTEDRECIPUNTO.materials[i]),
    ));
  }
  return new Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      verticalDirection: VerticalDirection.down,
      runSpacing: 0,
      spacing: 10.0,
      children: list);
}



//Add loading before displaying image
Future<String> PrepareImage() async{
  String ImagePath = await assignImage(SELECTEDRECIPUNTO);
  return ImagePath;
}
Widget PrepareImagebuilder(BuildContext context , Size _screensize) {
  return FutureBuilder<String>(
    future: PrepareImage(),
    builder: (context, AsyncSnapshot<String> snapshot) {
      if(snapshot.hasData){
        return Expanded(child: Image.asset(snapshot.data,height: _screensize.height*0.3 ,));
      }
      else{
        return CircularProgressIndicator();
      }
    },
  );
}






Color assignColorChip(String material) {
  Color color;
  if (material == 'Cartón/Papel') {
    color = Colors.brown[500];
  }
  else if (material == 'Baterías') {
    color = Colors.grey;
  }
  else if (material == 'Ropa y Telas') {
    color = Colors.deepOrangeAccent;
  }
  else if (material == 'Vidrio') {
    color = Colors.blueAccent;
  }
  else if (material == 'Plástico') {
    color = Colors.blueAccent;
  }

  else {
    color = Colors.lightGreen;
  }
  return color;
}
