import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../home/home_module.dart';

class TabPage extends StatefulWidget {
  final String title;
  const TabPage({Key key, this.title = "Tab"}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _cIndex = 0;

  var body = [HomeModule(), Container(), Container(), Container()];
  var colorActive = CustomTheme.primaryColor;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _cIndex,
          type: BottomNavigationBarType.shifting,
          fixedColor: CustomTheme.primaryColor,
          unselectedItemColor: Colors.grey[400],
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: new Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.swap_horiz), title: new Text('Lançamentos')),
            BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq), title: new Text('Relatórios')),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_outlined), title: new Text('Metas'))
          ],
          onTap: (index) {
            _incrementTab(index);
          },
        ),
        body: body[_cIndex]);
  }
}
