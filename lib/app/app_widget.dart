import 'package:flutter/material.dart';
import 'package:meorganizo/app/login/login/login_module.dart';
import 'package:meorganizo/shared/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Me Organizo',
      theme: ThemeData(
        primaryColor: CustomTheme.primaryColor,
        fontFamily: "Lato"
      ),
      home: LoginModule(),
    );
  }
}
  