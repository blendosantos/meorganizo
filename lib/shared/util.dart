import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/material.dart';

class Util {
  static generateMD5(String value) {
    var content = new Utf8Encoder().convert(value);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  static void showInSnackBar(
      GlobalKey<ScaffoldState> _scaffoldKey, String value, bool type) {
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 16.0),
      ),
      backgroundColor: (type ? Colors.green[900] : Colors.red[900]),
      duration: Duration(seconds: 5),
    ));
  }
}
