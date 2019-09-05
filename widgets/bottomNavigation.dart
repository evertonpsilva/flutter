import 'package:flutter/material.dart';


  Widget gestaoBottomNavigation(){
    return BottomNavigationBar(
      backgroundColor: Color(0xFF233645),
      unselectedItemColor: Colors.white54,
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          title: Text('SIPREV'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          title: Text('Eventos'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check),
          title: Text('Indicador ISP', textAlign: TextAlign.center,overflow: TextOverflow.visible,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          title: Text('Prev+'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Gestor'),
        ),
      ],
      selectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      type: BottomNavigationBarType.fixed,
    );
  }
