
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';
import 'dart:io';
import 'dart:async';

class GraficoPrevisaoAposentadoria extends StatefulWidget {
  @override
  _GraficoPrevisaoAposentadoriaState createState() => _GraficoPrevisaoAposentadoriaState();
}
class PrevisaoAposentadoria{
  final String mes;
  final int quantidade;
  final Color cor;

  PrevisaoAposentadoria(this.mes, this.quantidade, this.cor);
}
class _GraficoPrevisaoAposentadoriaState extends State<GraficoPrevisaoAposentadoria> {
  static var previsao1Semestre = [
    new PrevisaoAposentadoria('JAN', 4, Color(0xFF6d2f29)),
    new PrevisaoAposentadoria('FEV', 6, Color(0xFF6d2f29)),
    new PrevisaoAposentadoria('MAR', 6, Color(0xFF6d2f29)),
    new PrevisaoAposentadoria('ABR', 5, Color(0xFF6d2f29)),
    new PrevisaoAposentadoria('MAI', 7, Color(0xFF6d2f29)),
    new PrevisaoAposentadoria('JUN', 5, Color(0xFF6d2f29)),
  ];

  static var previsao2Semestre = [
    new PrevisaoAposentadoria('JUL', 5, Color(0xFF6d2f29)),
    new PrevisaoAposentadoria('AGO', 4, Color(0xFF6d2f29)),
    new PrevisaoAposentadoria('SET', 2, Color(0xFF6d2f29)),
    new PrevisaoAposentadoria('OUT', 3, Color(0xFF6d2f29)),
    new PrevisaoAposentadoria('NOV', 3, Color(0xFF6d2f29)),
    new PrevisaoAposentadoria('DEZ', 1, Color(0xFF6d2f29)),
  ];

  var previsaoAposentadoria = previsao1Semestre;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    previsaoAposentadoria = previsao1Semestre;
  }

  

  @override
  Widget build(BuildContext context) {
    var series = [
      new charts.Series(
        domainFn: (PrevisaoAposentadoria clickData, _) => clickData.mes,
        measureFn: (PrevisaoAposentadoria clickData, _) => clickData.quantidade,
        colorFn: (PrevisaoAposentadoria clickData, _) => charts.Color.fromHex(code: "#97bbcd"),
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
        height: 280.0,
        child: chart,
      ),
    );
    return Column(
      children: <Widget>[
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
                color: Color(0xFF97bbcd),
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    previsaoAposentadoria = previsao2Semestre;
                  });  
                },
                child: Text("2º Semestre",style: TextStyle(color: Colors.white),),
                color: Color(0xFF97bbcd),
              )
            ],
          ),
        ),
        chartWidget,
      ],
    );
  }
}