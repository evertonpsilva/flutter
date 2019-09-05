import 'package:flutter/material.dart';

class HorizontalListScroll{
 
  Widget horizontalListScroll(BuildContext context, AsyncSnapshot snapshot) {
    print(snapshot.data);
    double total = 0;var quantidade;
    return Container(
      child: PageView.builder(
        controller: PageController(
          initialPage: 0,
          viewportFraction: 0.85
        ),
        itemCount: 3,
        itemBuilder: (context, index){

          var margin;
          var categoria;
          var categoriaTipo;

          double porcentagem;

          if(index == 0){
            margin = EdgeInsets.only(right:7.5);
            categoria = "Efetivos";
            categoriaTipo = "Em exercício";
          }else if(index==1){
            margin = EdgeInsets.only(left:7.5, right: 7.5);
            categoria = "Aposentados";
            categoriaTipo = "Inativo";
          }else if(index==2){
            margin = EdgeInsets.only(left: 7.5, right: 0);
            categoria = "Pensionistas";
            categoriaTipo = "Inativo";
          }
          quantidade = double.parse(snapshot.data[categoria]["quantidade"]);
          total = double.parse(snapshot.data["Efetivos"]["quantidade"]) + double.parse(snapshot.data["Aposentados"]["quantidade"]) + double.parse(snapshot.data["Pensionistas"]["quantidade"]);
          porcentagem = (quantidade * 100.0) / total;
          String porcentagemFinal = porcentagem.toStringAsFixed(2);

          print(quantidade);
          return Container(
            margin: margin,
            height: 100,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 3.0, color: index == 0 ? Color.fromRGBO(26,179,148,1) : Colors.blueAccent),
              ),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom:10),
                  padding: EdgeInsets.only(bottom:10),
                  decoration: BoxDecoration(border: Border(bottom:BorderSide(color: Colors.grey[400]))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(categoria,style: TextStyle(color: Colors.grey[800],fontSize: 18,fontWeight: FontWeight.w600)),
                      Container(
                        decoration: BoxDecoration (color: index == 0 ? Color.fromRGBO(26,179,148,1) : Colors.blueAccent,borderRadius: BorderRadius.circular(3.0)),
                        padding: EdgeInsets.all(5),
                        child: Text(categoriaTipo,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),textAlign: TextAlign.right)
                      ) 
                    ], 
                  ),
                ),
                Column( 
                  children: [
                    Padding(padding:EdgeInsets.only(bottom: 5),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(child: Text(snapshot.data[categoria]["quantidade"],style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30))),
                        ],
                      ),
                    ),
                    Container(child: 
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text("Vínculos ${categoria}",style: TextStyle(fontWeight: FontWeight.w600)),
                          Text("${porcentagemFinal}",style: TextStyle(fontWeight: FontWeight.w600, color: index == 0 ? Color.fromRGBO(26,179,148,1) : Colors.blueAccent))
                        ],
                      ),
                    ),
                  ]
                )
              ],
              
            ),
          );
        },
      )
    );
  }
}