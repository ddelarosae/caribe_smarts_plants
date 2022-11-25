import 'package:flutter/material.dart';
import 'package:flutter_app_listviewer/pages/sensors.dart';
import 'package:flutter_app_listviewer/pages/about.dart';
import 'package:flutter_app_listviewer/pages/lplants.dart';

class Home extends StatefulWidget{
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Sensors(),
    IndexPlants(),
    About(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caribe Smart Plants'),
        backgroundColor: Color(0xFF2E8B57),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        fixedColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.addchart),
            label: 'Sensores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_rounded),
            label: 'Plantas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'About',
          ),
        ],
      ),
    );
  }
  void onTabTapped( int index){
    setState(() {
      _currentIndex = index;
    });
  }
}