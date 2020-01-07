import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomFloatingAdd extends StatelessWidget {
  const CustomFloatingAdd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
          onPressed: () {},
          elevation: 5,
          child: Icon(Icons.add, size: 35),
          backgroundColor: CustomTheme.primaryColor),
    );
  }
}
