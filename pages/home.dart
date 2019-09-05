import 'package:flutter/material.dart';
import '../widgets/horizontalList.dart';
import '../widgets/previsaoAposentadoria.dart';
import '../services/getApiData.dart';

import '../pages/siprev.dart';

class Home extends StatelessWidget {

  ApiData apiData = new ApiData();
  HorizontalListScroll listScroll = new HorizontalListScroll();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}