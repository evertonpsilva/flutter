import 'package:flutter/material.dart';
import '../pages/siprev.dart';

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _currentIndex = 0;
  final List<Widget> _pagina = [
    SiprevPericia(),
  ];


  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}