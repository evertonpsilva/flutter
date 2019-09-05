import 'package:flutter/material.dart';

Widget TabsMenuSiprev(){
  return TabBar(
      indicatorColor: Colors.white,
      isScrollable: true,
      tabs: <Widget>[
        Tab(text: "Perícia Médica",),
        Tab(text: "Processo",),
        Tab(text: "Guias",),
        Tab(text: "Segurados",),
        Tab(text: "Efetivos",),
        Tab(text: "Aposentados",),
        Tab(text: "Pensionistas",),
        Tab(text: "SISOBI",),
      ],
    );
}