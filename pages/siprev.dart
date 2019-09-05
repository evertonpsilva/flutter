import 'package:flutter/material.dart';

class SiprevPericia extends StatefulWidget {
  @override
  _SiprevPericiaState createState() => _SiprevPericiaState();
}

class _SiprevPericiaState extends State<SiprevPericia> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF233645),
          title: Text("Gestão - SIPREV"),
          centerTitle: true,
          bottom: TabBar(
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
          ),
        ),
      ),
    );
  }
}