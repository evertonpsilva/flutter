import 'package:apenastestes/horizontalList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import './bottomMenu.dart';
import './horizontalList.dart';

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

class PrevisaoAposentadoria{
  final String mes;
  final int quantidade;
  final Color cor;

  PrevisaoAposentadoria(this.mes, this.quantidade, this.cor);
}

class _HomeState extends State<Home> {

  HorizontalListScroll listScroll = new HorizontalListScroll();

  //Pega dados da API para mostrar no PageView

  Future<Map> _getHeaderData() async{
    // set up POST request arguments
    String url = 'http://api.prevmais.3itconsultoria.com.br/usuario/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"usuario":{"username":"apresentacao","password":"12345678"}}';
    // make POST request
    http.Response response = await http.post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body

    var finalHeaders = {
      "uid":response.headers["uid"],
      "client":response.headers["client"],
      "access-token":response.headers["access-token"],
    };

   //print(finalHeaders);

    return finalHeaders;
  }

  //vsvxS7tfjsjHxwVe_cQIFg

  //N3haauwD4fyJ_2DigKk_sg

  Future<Map<String, dynamic>> _getApiData() async{
    final headerData = await _getHeaderData();

    const baseUrl = "http://api.prevmais.3itconsultoria.com.br/";

    var apiUrl = "http://api.prevmais.3itconsultoria.com.br//dashservidores/listarDadosQtdServidores/";

    //print(headerData);
    
    Map<String, String> headers = {"uid": headerData["uid"], "client":headerData["client"],"access-token":headerData["access-token"]};

    //print(headers);

    http.Response response = await http.get(apiUrl, headers: headers);

    var teste = response.body;

    //print(response.statusCode);
    var finalResponse = {
      "Efetivos":json.decode(response.body)[0],
      "Aposentados":json.decode(response.body)[1],
      "Pensionistas":json.decode(response.body)[2],
    };

    return finalResponse;

  }

  //Valores para serem mostrados nos graficos

  static var previsao1Semestre = [
    new PrevisaoAposentadoria('JAN', 12, Colors.blue),
    new PrevisaoAposentadoria('FEV', 42, Colors.blue),
    new PrevisaoAposentadoria('MAR', 98, Colors.blue),
    new PrevisaoAposentadoria('ABR', 58, Colors.blue),
    new PrevisaoAposentadoria('MAI', 34, Colors.blue),
    new PrevisaoAposentadoria('JUN', 29, Colors.blue),
  ];

  static var previsao2Semestre = [
    new PrevisaoAposentadoria('JUL', 21, Colors.blue),
    new PrevisaoAposentadoria('AGO', 24, Colors.blue),
    new PrevisaoAposentadoria('SET', 89, Colors.blue),
    new PrevisaoAposentadoria('OUT', 85, Colors.blue),
    new PrevisaoAposentadoria('NOV', 43, Colors.blue),
    new PrevisaoAposentadoria('DEZ', 92, Colors.blue),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    previsaoAposentadoria = previsao1Semestre;
  }
    var previsaoAposentadoria = previsao1Semestre;

  @override
  Widget build(BuildContext context) {

    var series = [
      new charts.Series(
        domainFn: (PrevisaoAposentadoria clickData, _) => clickData.mes,
        measureFn: (PrevisaoAposentadoria clickData, _) => clickData.quantidade,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        id: 'Clicks',
        data: previsaoAposentadoria,
        labelAccessorFn: (PrevisaoAposentadoria row, _) => '${row.quantidade}',
      ),
    ];

    var chart = new charts.BarChart(
      series,
      animate: true,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
    );

    var chartWidget = new Padding(
      padding: new EdgeInsets.only(left: 25.0),
    
      child: new SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 250.0,
        child: chart,
      ),
    );
      
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
                    future: _getApiData(),
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
                Container(
                  padding: EdgeInsets.only(left: 25.0, right: 15.0),
                  margin: EdgeInsets.only(top:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: (){
                          setState(() {
                            previsaoAposentadoria = previsao1Semestre;
                          });
                        },
                        child: Text("1º Semestre",style: TextStyle(color: Colors.white),),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: (){
                          setState(() {
                            previsaoAposentadoria = previsao2Semestre;
                          });
                        },
                        child: Text("2º Semestre",style: TextStyle(color: Colors.white),),
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
                chartWidget,
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomMenu(),
    );
  }
}
