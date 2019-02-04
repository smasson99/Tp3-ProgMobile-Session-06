import 'package:flutter/material.dart';
import 'package:tp3/app/learn.dart';
import 'package:tp3/util/strings.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home>{
  int _selectedIndex = 0;
  final _widgetOptions = [
    Learn(),
    Text('IndexedStack 1:Entrainement'),
  ];
  @override
  Widget build(BuildContext context) {
    var strings = Strings.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(strings.title),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.book), title:  Text(strings.learn)),
          BottomNavigationBarItem(icon: Icon(Icons.create), title:  Text(strings.train)),
        ],
          currentIndex: _selectedIndex,
          onTap:  _onItemTapped,
        ),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex= index;
    });
  }
}

