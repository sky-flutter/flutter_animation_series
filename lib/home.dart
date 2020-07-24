import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return listItem(index);
          },
          itemCount: 20,
        ),
      ),
    );
  }

  Widget listItem(int index) {
    return ListTile(
      title: Text("Index $index",style: TextStyle(color: Colors.white),),
    );
  }
}
