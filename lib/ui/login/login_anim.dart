import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginAnim extends StatefulWidget {
  @override
  _LoginAnimState createState() => _LoginAnimState();
}

class _LoginAnimState extends State<LoginAnim> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;

  AnimationController loginController;
  Animation<Offset> loginAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    loginController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    animation = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
        .animate(
        CurvedAnimation(parent: controller, curve: Curves.linearToEaseOut));
    loginAnimation =
        Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(
            CurvedAnimation(
                parent: loginController, curve: Curves.linearToEaseOut));
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Stack(
          children: <Widget>[loginSignupOption(), loginView()],
        ),
      ),
    );
  }

  loginView() {
    return SlideTransition(
      position: loginAnimation,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Wrap(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Shopping",
                      style: textStyle,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          loginController.reverse();
                          loginController.addListener(() {
                            if (loginController.status ==
                                AnimationStatus.dismissed) {
                              controller.forward();
                            }
                          });
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Welcome Back",
                        style: textStyle,
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Text(
                      "Email Address",
                      style: textStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child:
                      textField(textInputType: TextInputType.emailAddress)),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Text(
                      "Password",
                      style: textStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: textField(isObscureText: true)),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Forgot Password?",
                        style: textStyle,
                      ),
                      SizedBox(
                        width: 16,
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("Login"),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  textField({isObscureText: false, textInputType: TextInputType.text}) {
    return TextField(
      keyboardType: textInputType,
      obscureText: isObscureText,
      decoration: InputDecoration(
          border: textFieldBorder, focusedBorder: textFieldBorder),
    );
  }

  final textFieldBorder =
  UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));
  final textStyle = TextStyle(color: Colors.white);

  loginSignupOption() {
    return SlideTransition(
        position: animation,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 240,
            decoration: const BoxDecoration(
                color: Colors.purple,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "All About You.",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Luxury. Class. Style",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: RaisedButton(
                    onPressed: () {
                      controller.reverse();
                      controller.addListener(() {
                        if (controller.status == AnimationStatus.dismissed) {
                          loginController.forward();
                        }
                      });
                    },
                    child: Text("Login"),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.black,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
