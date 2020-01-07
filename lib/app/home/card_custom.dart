import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CardCustom extends StatelessWidget {
  final String titulo;
  final Function funcaoAdd;
  final Widget child;

  const CardCustom(this.titulo, this.funcaoAdd, {this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    Text(this.titulo,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    GestureDetector(
                        child: ClipOval(
                          child: Container(
                            color: CustomTheme.primaryColor,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.add,
                                  size: 17, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: this.funcaoAdd)
                  ],
                ),
              ),
              (this.child != null ? this.child : Container())
            ],
          ),
        ),
      ),
    );
  }
}
