import 'package:flutter/material.dart';
import 'package:reciapp_database/Models/SlideList.dart';





final slideList = slideListIntro;


class SlideItem extends StatelessWidget {
  final int index;
  final slideList;

  SlideItem(this.index,this.slideList);

  @override
  Widget build(BuildContext context) {
    debugPrint('Slide Index= ' + index.toString());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
              //fit: BoxFit.cover
            ),
          ),
        ),
        SizedBox(height: 20,),
        Text(slideList[index].title,
          style: TextStyle(fontSize: 25, color: Colors.lightGreen),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10,),
        Text(slideList[index].description,
          style: TextStyle(fontSize: 15, color: Colors.black),
          textAlign:  TextAlign.center,
        ),
      ],
    );
  }
}
