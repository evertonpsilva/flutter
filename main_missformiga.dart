import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  GlobalKey scrollKey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: scrollKey,
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    color: Colors.red[400],
                   ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: PageView(
                    controller: PageController(viewportFraction: 0.9,initialPage: 1),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: NetworkImage("https://sweetjane.elated-themes.com/wp-content/uploads/2018/11/h1-banner-img-1.jpg"),fit: BoxFit.cover)
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                            ),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 35,
                            child: Text("Cupkakes",textAlign: TextAlign.center,style: TextStyle(color: Colors.red[400], fontSize: 19,fontWeight: FontWeight.w400),),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: NetworkImage("https://img.elo7.com.br/product/zoom/E13D10/trufa-de-chocolate-festa.jpg"),fit: BoxFit.cover)
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                            ),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 35,
                            child: Text("Trufas",textAlign: TextAlign.center,style: TextStyle(color: Colors.red[400], fontSize: 19,fontWeight: FontWeight.w400),),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: NetworkImage("https://www.seriouseats.com/2018/03/20180413-brownie-mix-vicky-wasik-20-1500x1125.jpg"),fit: BoxFit.cover)
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                            ),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 35,
                            child: Text("Brownies",textAlign: TextAlign.center,style: TextStyle(color: Colors.red[400], fontSize: 19,fontWeight: FontWeight.w400),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
