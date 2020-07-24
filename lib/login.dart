import 'package:flutter/material.dart';
import 'package:flutter_animation/home.dart';
import 'package:flutter_animation/route/reveal_route.dart';
import 'package:positioned_tap_detector/positioned_tap_detector.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isButtonClicked = false;
  bool isTextVisible = true;
  bool isProgressVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: isButtonClicked ? 60 : MediaQuery.of(context).size.width,
              height: isButtonClicked ? 60 : 50,
              child: PositionedTapDetector(
                onTap: (position) {
                  if (isButtonClicked) {
                    isButtonClicked = false;
                    isProgressVisible = false;
                    setState(() {});
                    Future.delayed(Duration(milliseconds: 300), () {
                      isTextVisible = true;
                      setState(() {});
                    });
                  } else {
                    isTextVisible = false;
                    isButtonClicked = true;
                    setState(() {});
                    Future.delayed(Duration(milliseconds: 400), () {
                      isProgressVisible = true;
                      setState(() {});
                    });

                    Future.delayed(Duration(milliseconds: 2000), () {
                      Navigator.push(context, RevealRoute(page: Home(), maxRadius: 1000,centerOffset: position.global));
                    });
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: isButtonClicked ? 0 : 16,
                      right: isButtonClicked ? 0 : 16),
                  padding:
                      EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.circular(isButtonClicked ? 80 : 24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Visibility(
                        child: Text("Login"),
                        visible: isTextVisible,
                      ),
                      Visibility(
                        visible: isProgressVisible,
                        child: Container(
                          width: 24,
                          height: 24,
                          child: Theme(
                            data: ThemeData(accentColor: Colors.white),
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
