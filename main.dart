import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import './bottomMenu.dart';
import './horizontalList.dart';
import './previsaoAposentadoria.dart';
import './services/getApiData.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HorizontalListScroll listScroll = new HorizontalListScroll();
  ApiData apiData = new ApiData();


  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF233645),
          title: Text("Gestão - 3IT"),
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
        bottomNavigationBar: BottomMenu(),
    );
  }
}
