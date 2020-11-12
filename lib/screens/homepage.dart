import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storage_app/modules/categories.dart';
import 'package:storage_app/styles/textstyles.dart';
import 'package:storage_app/widgets/appbar.dart';
import 'package:storage_app/widgets/card.dart';
import 'package:storage_app/widgets/navigationBar.dart';
import 'package:storage_app/widgets/recentfiles.dart';
import 'package:storage_app/widgets/storagecontainer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

int currentIndex = 0;

class _HomeState extends State<Home> {
  void notifyme() {
    setState(() {
      currentIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    double navigationBarHeight = 75;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: height - navigationBarHeight,
            width: width,
            child: ListView(
              children: [
                Appbar(
                  pageindex: 0,
                ),
                StorageContainer(),
                Padding(
                  padding: EdgeInsets.only(left: 22, top: 20, bottom: 20),
                  child: Text(
                    "Recent Files",
                    style: heading,
                  ),
                ),
                Container(
                  height: height * 0.25,
                  width: width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(left: 22),
                            child: recentFiles(index, width, height));
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22, top: 20, bottom: 20),
                  child: Text(
                    "Categories",
                    style: heading,
                  ),
                ),
                Container(
                  height: height * 0.25,
                  width: width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 22, bottom: 20),
                          child: card(
                              width: width,
                              height: height,
                              name: categories[index].name,
                              icon: categories[index].icon,
                            subtitle: Text("${categories[index].fileCount.toString()} Files", style: subtitle,)
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          NavigationBar(
            width: width,
            notifier: notifyme,
            navigationBarHeight: navigationBarHeight,
          )
        ],
      ),
    );
  }
}
