import 'package:flutter/material.dart';
import 'package:meorganizo/app/home/card_custom.dart';
import 'package:meorganizo/app/tab/floating.dart';

import '../../shared/theme.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          Padding(
              padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
              child: GestureDetector(
                child: ClipOval(
                  child: Image.network(
                    'https://avatars2.githubusercontent.com/u/8852312?s=400&v=4',
                    fit: BoxFit.fill,
                  ),
                ),
                onTap: () {},
              ))
        ],
        elevation: 0,
      ),
      floatingActionButton: CustomFloatingAdd(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: CustomTheme.primaryColor,
            height: height * 0.13,
            width: width,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Container(
                  width: width * 0.10,
                  child: Text(
                    "R\$",
                    style: TextStyle(color: Colors.white24),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.70,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "13,47",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("saldo geral",
                          style: TextStyle(color: Colors.white70))
                    ],
                  ),
                ),
                Container(
                  width: width * 0.10,
                  child: IconButton(
                    icon: Icon(Icons.remove_red_eye, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          CardCustom(
              "Contas",
              () {},
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 2,
                separatorBuilder: (context, index) {
                  return SizedBox(
                      height: 1.5, child: Container(color: Colors.grey[300]));
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Teste"),
                  );
                },
              ))
        ],
      ),
    );
  }
}
