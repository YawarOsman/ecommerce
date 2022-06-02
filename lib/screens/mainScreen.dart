import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    double sWidth = mediaQueryData.size.width;
    double sHeight = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            width: sWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 38,
                  padding: EdgeInsets.only(left: 8),
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(children: [
                    Container(
                      width: kIsWeb ? mediaQueryData.size.width / 3 : 270,
                      height: 47,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.only(left: 10),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        cursorColor: Colors.white,
                      ),
                    ),
                    Container(
                      width: 43,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        height: 47,
                        color: Colors.amber.shade600,
                        onPressed: () {},
                        child: Icon(Icons.search),
                        padding: EdgeInsets.only(right: 0),
                      ),
                    )
                  ]),
                ),
                Visibility(
                  visible: sWidth <= 450 ? false : true,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'MyWebsite',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
        children: [],
      )),
    );
  }
}
