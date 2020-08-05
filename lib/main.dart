import 'package:flutter/material.dart';
import 'package:flutter_animation/ui/login/login_anim.dart';
import 'package:flutter_animation/ui/search/search.dart';

import 'ui/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginAnim(),
    );
  }
}
