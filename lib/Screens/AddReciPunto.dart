import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:reciapp_database/Classes/ClassReciPunto.dart';
import 'package:reciapp_database/Classes/ClassUser.dart';
import 'package:reciapp_database/Screens/HomePage.dart';
import 'package:reciapp_database/Models/FirebaseDataBase.dart';
import 'package:reciapp_database/Widgets/GooglePlacesAutocomplete.dart';



class AddReciPunto extends StatefulWidget {
  @override
  _AddReciPuntoState createState() => _AddReciPuntoState();
}

class _AddReciPuntoState extends State<AddReciPunto> {

  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = false;
  bool _hasBeenPressed3 = false;
  bool _hasBeenPressed4 = false;
  bool _hasBeenPressed5 = false;
  bool _hasBeenPressed6 = false;
  bool _hasBeenPressed7 = false;
  bool _hasBeenPressedCartonPapel = false;
  bool _hasBeenPressedBaterias = false;
  bool _hasBeenPressedMetales = false;
  bool _hasBeenPressedTelas = false;
  bool _hasBeenPressedVidrio = false;
  bool _isCheckedLunesViernes = false;
  bool _isCheckedSabado = false;
  bool _isCheckedDomingo = false;

  String name = '';
  String address = '';
  List<String> materials = [];
  String phone = '';
  String contact = '';
  List<String> calendar = [];
  List<String> hours = [];



  @override
  Widget build(BuildContext context) {
    print(materials);
    print(hours);
    print(calendar);


    return Scaffold(
      appBar: AppBar(
        title: Text('¡Comparte tu ReciPunto!',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top:20),
          child: Column(
            children: <Widget>[

              /////////////////////////
              TextField(
                decoration: InputDecoration(hintText: 'ej. Centro de Reciclaje los Hermanos Ramirez',
                  labelText: 'Nombre del ReciPunto',
                  labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                  fillColor: Colors.green[100],
                  filled: true,
                ),
                onChanged: (String str){
                  setState(() {
                    name = str;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              //////////////////////////
              //GooglePlacesAutocomplete(),
              TextField(
                decoration: InputDecoration(hintText: 'ej. Av. Cristóbal Colón 3128, Acero, Monterrey, N.L.',
                    labelText: 'Dirección',
                    labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                    fillColor: Colors.green[100],
                    filled: true
                ),
                onChanged: (String str){
                  setState(() {
                    address = str;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              /////////////////////////////
              Text('Tipos de plásticos',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.teal),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,bottom: 10),
                child: Text('Busca los símbolos en los envases para reconocer su tipo de plástico como este:',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.grey),
                ),
              ),
              Image(image: AssetImage('Images/pl1symbol.png'),height:60,width:60,),
              SizedBox(
                height: 20,
              ),

              Text('Materiales que recibe',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.teal),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,bottom: 0),
                child: Text('Selecciona los materiales que recibe el lugar:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              SingleChildScrollView(

                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressedCartonPapel ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressedCartonPapel = !_hasBeenPressedCartonPapel;
                            if(_hasBeenPressedCartonPapel== true){
                              materials.add('Cartón/Papel');
                            }
                            else{
                              materials.remove('Cartón/Papel');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/cartonpapel.png'),height: 150,width: 150,),
                            Text('Cartón/Papel',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressedBaterias ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressedBaterias = !_hasBeenPressedBaterias;
                            if(_hasBeenPressedBaterias== true){
                              materials.add('Baterías');
                            }
                            else{
                              materials.remove('Baterías');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/bateria.png'),height: 150,width: 150,),
                            Text('Baterías',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressedVidrio ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressedVidrio = !_hasBeenPressedVidrio;
                            if(_hasBeenPressedVidrio== true){
                              materials.add('Vidrio');
                            }
                            else{
                              materials.remove('Vidrio');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/vidrio.png'),height: 150,width: 150,),
                            Text('Vidrio',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressedTelas ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressedTelas = !_hasBeenPressedTelas;
                            if(_hasBeenPressedTelas== true){
                              materials.add('Ropa y Telas');
                            }
                            else{
                              materials.remove('Ropa y Telas');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/tela.jpg'),height: 150,width: 150,),
                            Text('Ropa y Telas',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressed1 ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressed1 = !_hasBeenPressed1;
                            if(_hasBeenPressed1== true){
                              materials.add('Plástico 1');
                            }
                            else{
                              materials.remove('Plástico 1');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/plastico1.jpg'),height: 150,width: 150,),
                            Text('Plástico 1',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal)),
                            Text('PET',style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.grey))

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressed2 ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressed2 = !_hasBeenPressed2;
                            if(_hasBeenPressed2== true){
                              materials.add('Plástico 2');
                            }
                            else{
                              materials.remove('Plástico 2');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/plastico2.png'),height: 150,width: 150,),
                            Text('Plástico 2',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal)),
                            Text('PEAD',style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.grey))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressed3 ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressed3 = !_hasBeenPressed3;
                            if(_hasBeenPressed3== true){
                              materials.add('Plástico 3');
                            }
                            else{
                              materials.remove('Plástico 3');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/pvc.png'),height: 150,width: 150,),
                            Text('Plástico 3',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal)),
                            Text('PVC',style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.grey))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressed4 ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressed4 = !_hasBeenPressed4;
                            if(_hasBeenPressed4== true){
                              materials.add('Plástico 4');
                            }
                            else{
                              materials.remove('Plástico 4');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/plastico4.png'),height: 150,width: 150,),
                            Text('Plástico 4',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal)),
                            Text('PEBD',style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.grey))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressed5 ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressed5 = !_hasBeenPressed5;
                            if(_hasBeenPressed5== true){
                              materials.add('Plástico 5');
                            }
                            else{
                              materials.remove('Plástico 5');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/plastico5.png'),height: 150,width: 150,),
                            Text('Plástico 5',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal)),
                            Text('PP',style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.grey))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressed6 ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressed6 = !_hasBeenPressed6;
                            if(_hasBeenPressed6== true){
                              materials.add('Plástico 6');
                            }
                            else{
                              materials.remove('Plástico 6');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/plastico6.jpg'),height: 150,width: 150,),
                            Text('Plástico 6',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal)),
                            Text('PS',style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.grey))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _hasBeenPressed7 ? Colors.greenAccent : Colors.grey[300],// background
                          onPrimary: Colors.green, // foreground
                        ),
                        onPressed: (){
                          setState(() {
                            _hasBeenPressed7 = !_hasBeenPressed7;
                            if(_hasBeenPressed7== true){
                              materials.add('Plástico 7');
                            }
                            else{
                              materials.remove('Plástico 7');
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Image(image: AssetImage('Images/plastico7.jpg'),height: 150,width: 150,),
                            Text('Plástico 7',style: TextStyle(fontSize: 19,fontWeight: FontWeight.normal,color: Colors.teal)),
                            Text('Otros',style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.grey))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(
                height: 20,
              ),
              //////////////////////////////
              Text('Opcionales',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
              SizedBox(
                height: 20,
              ),
              //////////////////////////////
              Text('Horario',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.teal),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.lightGreen)),
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('Lunes a Viernes'),
                      activeColor: Colors.lightGreen,
                      checkColor: Colors.yellow,
                      selected: _isCheckedLunesViernes,
                      value: _isCheckedLunesViernes,
                      onChanged: (bool value) {
                        setState(() {
                          _isCheckedLunesViernes = value;
                          if(_isCheckedLunesViernes== true){
                            calendar.add('Lunes a Viernes');
                          }
                          else{
                            calendar.remove('Lunes a Viernes');
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Sábado'),
                      activeColor: Colors.lightGreen,
                      checkColor: Colors.yellow,
                      selected: _isCheckedSabado,
                      value: _isCheckedSabado,
                      onChanged: (bool value) {
                        setState(() {
                          _isCheckedSabado = value;
                          if(_isCheckedSabado== true){
                            calendar.add('Sábado');
                          }
                          else{
                            calendar.remove('Sábado');
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Domingo'),
                      activeColor: Colors.lightGreen,
                      checkColor: Colors.yellow,
                      selected: _isCheckedDomingo,
                      value: _isCheckedDomingo,
                      onChanged: (bool value) {
                        setState(() {
                          _isCheckedDomingo = value;
                          if(_isCheckedDomingo== true){
                            calendar.add('Domingo');
                          }
                          else{
                            calendar.remove('Domingo');
                          }
                        });
                      },
                    ),
                  ],
                ),
                foregroundDecoration: BoxDecoration(border: Border.all(color: Colors.lightGreen)),
              ),
              SizedBox(height: 20,),

              TextField(
                decoration: InputDecoration(hintText: 'ej. +52 8121687361',
                    labelText: 'Teléfono de Contacto',
                    labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),
                    fillColor: Colors.green[100],
                    filled: true
                ),
                onChanged: (String str){
                  setState(() {
                    phone = str;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              //////////////////////////////
              TextField(
                toolbarOptions: ToolbarOptions(copy:true ,paste: true),
                decoration: InputDecoration(hintText: 'ej. Facebook: Reciclaje Monterrey',
                    labelText: 'Sitio Web, Facebook o Correo electrónico',
                    labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.teal),
                    fillColor: Colors.green[100],
                    filled: true,
                ),
                onChanged: (String str){
                  setState(() {
                    contact = str;
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              ////////////////////////////////////
              Text('Toma o Agrega una foto del lugar',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.teal),),

              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {

                  if(materials.length == 0 || name == ''){
                    print('Te faltan datos crack');
                  }
                  else{

                    //Cambiar  para incluir latitud y longitud
                    final ReciPunto punto = ReciPunto(name,address,25.66872225181611, -100.30330295083957,materials,phone,contact,calendar);
                    user.reciPuntos.add(punto);
                    writeData(punto);//Upload ReciPunto to Firebase


                    Navigator.pop(context);
                    //Navigator.of(context).pushNamed('/InfoReciPuntoMaps.dart');
                    Navigator.pushReplacementNamed(context,'/HomePage.dart'); //checar cual es mejor
                    print('Finalizar');
                  }
                },
                child:  Text("Finalizar",style: TextStyle(fontSize: 20 ,color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




/*void deleteData(){
  DBRef.child("1").remove();
}*/
















