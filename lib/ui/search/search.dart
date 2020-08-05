import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isSearchClicked = false;
  Size size;
  final scKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scKey,
      body: Container(
        child: searchView(),
      ),
    );
  }

  border() {
    return UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));
  }

  searchView() {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: () {
          if (!isSearchClicked) {
            isSearchClicked = true;
            setState(() {});
          }
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeIn,
            width: isSearchClicked ? size.width : 48,
            height: isSearchClicked ? size.height : 48,
            margin: EdgeInsets.all(isSearchClicked ? 0 : 16),
            child: Stack(
              children: <Widget>[
                AnimatedOpacity(
                    opacity: isSearchClicked ? 1 : 0,
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 8, top: 24),
                      child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (isSearchClicked) {
                              isSearchClicked = false;
                              setState(() {});
                            }
                          }),
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      AnimatedOpacity(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        duration: Duration(
                            milliseconds: !isSearchClicked ? 800 : 100),
                        opacity: !isSearchClicked ? 1 : 0,
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 800),
                        opacity: isSearchClicked ? 1 : 0,
                        child: Container(
                          margin: EdgeInsets.only(left: 24, right: 24),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Search",
                                alignLabelWithHint: true,
                                enabledBorder: border(),
                                border: border(),
                                focusedBorder: border(),
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isSearchClicked ? 0 : 100),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x33000000),
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      spreadRadius: -3),
                  BoxShadow(
                      color: const Color(0x1f000000),
                      offset: Offset(3, 3),
                      blurRadius: 14,
                      spreadRadius: 2),
                  BoxShadow(
                      color: const Color(0x24000000),
                      offset: Offset(8, 8),
                      blurRadius: 10,
                      spreadRadius: 1)
                ],
                color: Colors.red)),
      ),
    );
  }
}
