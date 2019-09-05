import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import './widgets/bottomMenu.dart';
import './widgets/horizontalList.dart';
import './widgets/previsaoAposentadoria.dart';
import './services/getApiData.dart';

import './pages/siprev.dart';
import './pages/home.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Main()
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  
  ApiData apiData = new ApiData();
  HorizontalListScroll listScroll = new HorizontalListScroll();

  int _currentIndex = 0;
  final List<Widget> _children = [
    SiprevPericia(),
    Main(),
  ];


  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return _children[index];
    }));
  }
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF233645),
        title: Text("Gestão - Home"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 155,
                child: FutureBuilder(
                  future: apiData.getApiData(),
                  builder:(context, snapshot){
                    switch(snapshot.connectionState){
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 5.0,
                          ),
                        );
                      default:
                        if (snapshot.hasError) return Container();
                        else return listScroll.horizontalListScroll(context, snapshot);
                    }
                  }
                )
              ),
              GraficoPrevisaoAposentadoria(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF233645),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        type: BottomNavigationBarType.fixed,  
        currentIndex: _currentIndex,
        onTap: onTabTapped,        
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: new Text('SIPREV')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: new Text('EVENTOS')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            title: new Text('INDICADOR ISP', overflow: TextOverflow.fade,textAlign: TextAlign.center,style: TextStyle(fontSize: 11.0),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: new Text('PREV +')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            title: new Text('GESTOR')
          ),
        ],
      ),
    );
  }
}
