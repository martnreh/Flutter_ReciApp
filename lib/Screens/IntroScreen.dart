import 'package:flutter/material.dart';
import 'package:reciapp_database/Widgets/SlideDots.dart';
import 'package:reciapp_database/Widgets/SlideItems.dart';
import 'package:reciapp_database/Models/SlideList.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  _onPageChanged(int index){
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: _onPageChanged,
                      controller: _pageController,
                      itemCount: slideList.length,
                      itemBuilder: (context,currentPage) =>SlideItem(currentPage,slideListIntro),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 35),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for(int i =0; i<slideList.length;i++)
                          if(i==currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      'Comienza a Reciclar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/HomePage.dart');
                    },
                    padding: const EdgeInsets.all(15),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    color: Colors.lightGreen,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Ya tienes una cuenta?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: (){},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}
