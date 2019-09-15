import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();



  PageController _mainPageController = PageController(
    initialPage: 0,
    viewportFraction: 1
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Miss ",style: TextStyle(fontWeight: FontWeight.w600),),
            Text("Formiga",style: TextStyle(fontWeight: FontWeight.w600),),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.white,
        color: Colors.red[400],
        index: 0,
        height: 50.0,
        onTap: (index) {
          _mainPageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
        },
        items: <Widget>[
          Icon(Icons.home, size: 30,color: Colors.white,),
          Icon(Icons.search, size: 30,color: Colors.white,),
          Icon(Icons.list, size: 30,color: Colors.white,),
          Icon(Icons.shopping_basket, size: 30,color: Colors.white,),
          Icon(Icons.person_pin, size: 30,color: Colors.white,),
        ],
      ),
      
      body: PageView(
        controller: _mainPageController,
        children: <Widget>[
          Home(),
          Container(child: Text("Pagina 2"),),
          Container(child: Text("Pagina 3"),),
          Container(child: Text("Pagina 4"),),
          Container(child: Text("Pagina 5"),),
        ],
      ),
    );
  }
}
