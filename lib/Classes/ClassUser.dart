import 'package:reciapp_database/Classes/ClassReciPunto.dart';

class User{
  final String name;
  final String email;
  List<ReciPunto> reciPuntos = [];
  User(this.name,this.email);

}


User user = User('Martin451','martinbarrientos451@gmail.com');

