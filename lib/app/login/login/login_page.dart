import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: ClipLogin(),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.8,
              color: Colors.green[800],
            ),
          ),
          Positioned(
            left: 15,
            top: MediaQuery.of(context).size.height / 2.8,
            child: Text("Me Organizo",
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
          Positioned(
            top: 25,
            right: 0,
            child: Image.asset(
              "assets/img/login-topo.png",
              width: MediaQuery.of(context).size.width / 1.3,
            ),
          )
        ],
      ),
    );
  }
}

class ClipLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    var fistControlPoint = Offset(size.width / 10, size.height);
    var fistEndPoint = Offset(size.width / 4, size.height / 1.2);
    path.quadraticBezierTo(fistControlPoint.dx, fistControlPoint.dy,
        fistEndPoint.dx, fistEndPoint.dy);

    var twoControlPoint =
        Offset(size.width - (size.width / 2.5), size.height / 2);
    var twoEndPoint = Offset(size.width, size.height / 1.5);
    path.quadraticBezierTo(
        twoControlPoint.dx, twoControlPoint.dy, twoEndPoint.dx, twoEndPoint.dy);

    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
