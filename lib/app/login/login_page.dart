import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meorganizo/app/home/home_module.dart';
import 'package:meorganizo/app/login/login_bloc.dart';
import 'package:meorganizo/app/login/login_module.dart';
import 'package:meorganizo/model/Usuario.dart';
import 'package:meorganizo/shared/theme.dart';
import 'package:meorganizo/shared/util.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final loginBloc = LoginModule.to.getBloc<LoginBloc>();

  TextEditingController _emailField;
  TextEditingController _pwField;
  bool _obscurePW = true;

  @override
  void initState() {
    _emailField = TextEditingController();
    _pwField = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: ClipLogin(),
                    child: Container(
                      height: height / 2.5,
                      color: CustomTheme.primaryColor,
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: height * 0.07,
                    child: Text("Me Organizo",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: width * 0.055,
                            shadows: [
                              Shadow(blurRadius: 30, color: Colors.white),
                              Shadow(
                                  blurRadius: 15, color: CustomTheme.textColor),
                            ])),
                  ),
                  Positioned(
                    top: height * 0.035,
                    right: 0,
                    child: Image.asset(
                      "assets/img/login-topo.png",
                      width: height / 2.4,
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                    height: height / 1.7,
                    width: width,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _emailField,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "E-mail", icon: Icon(Icons.mail_outline)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextField(
                            controller: _pwField,
                            obscureText: _obscurePW,
                            decoration: InputDecoration(
                                suffix: GestureDetector(
                                  child: (_obscurePW
                                      ? Icon(FontAwesomeIcons.eyeSlash,
                                          size: 20,
                                          color: CustomTheme.secondaryColor)
                                      : Icon(FontAwesomeIcons.eye,
                                          size: 20,
                                          color: CustomTheme.secondaryColor)),
                                  onTap: () {
                                    setState(() {
                                      _obscurePW = _obscurePW ? false : true;
                                    });
                                  },
                                ),
                                hintText: "Senha",
                                icon: Icon(Icons.lock_outline)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          width: width,
                          alignment: Alignment.centerRight,
                          child: FloatingActionButton(
                            backgroundColor: CustomTheme.primaryColor,
                            onPressed: () async {
                              Usuario user = await loginBloc.efetuarLogin(
                                  _emailField.text, _pwField.text);

                              if (user == null) {
                                Util.showInSnackBar(_scaffoldKey,
                                    loginBloc.msgController.value, false);
                              } else {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (context) => HomeModule(), settings: RouteSettings(name: "/Home")
                                ));
                              }
                            },
                            child: Icon(FontAwesomeIcons.angleRight, size: 45),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: width,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            child: Text("Cadastre-se",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    decoration: TextDecoration.underline)),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child: Text("Esqueceu a senha?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    decoration: TextDecoration.underline)),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClipLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    var fistControlPoint = Offset(size.width / 15, size.height);
    var fistEndPoint = Offset(size.width / 3, size.height / 1.2);
    path.quadraticBezierTo(fistControlPoint.dx, fistControlPoint.dy,
        fistEndPoint.dx, fistEndPoint.dy);

    var twoControlPoint =
        Offset(size.width - (size.width / 3), size.height / 1.5);
    var twoEndPoint = Offset(size.width, size.height / 1.2);
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
