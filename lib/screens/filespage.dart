import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:storage_app/modules/folder.dart';
import 'package:storage_app/screens/contentpage.dart';
import 'package:storage_app/screens/homepage.dart';
import 'package:storage_app/styles/textstyles.dart';
import 'package:storage_app/widgets/appbar.dart';
import 'package:storage_app/widgets/card.dart';
import 'package:storage_app/widgets/navigationBar.dart';
import 'package:storage_app/widgets/sortingrow.dart';

class FilesPage extends StatefulWidget {
  @override
  _FilesPageState createState() => _FilesPageState();
}

int cloudIndex = 0;

class _FilesPageState extends State<FilesPage> {
  void notifyme({int index}) {
    setState(() {
      currentIndex = currentIndex;
    });
  }

  void changeCloudIndex() {
    setState(() {
      cloudIndex = cloudIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    double navigationBarHeight = 75;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 24,),
            Appbar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: height * 0.1,
                    color: Color.fromRGBO(110, 150, 211, 0.05),
                    child: Row(
                      children: [
                        specialContainer(
                            0, "My Cloud", width, height, changeCloudIndex),
                        specialContainer(
                            1, "Team Cloud", width, height, changeCloudIndex)
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            sortingRow(),
            SizedBox(height: 15,),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: width - 20,
                  child: GridView.builder(
                    itemCount: folders.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                      ), itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ContentPage(name: folders[index].name)));
                      },
                      child: card(height: 100,
                          width: 100,
                          icon: folders[index].icon,
                          name: "${folders[index].name} (${folders[index].content})"
                      ),
                    );
                  }
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: NavigationBar(
          width: width,
          navigationBarHeight: navigationBarHeight,
          notifier: notifyme,
        ),
      ),
    );
  }
}

Widget specialContainer(int index, String text, double width, double height,
    Function notify) {
  return GestureDetector(
    onTap: () {
      cloudIndex = index;
      notify();
    },
    child: Container(
      decoration: BoxDecoration(
          color: cloudIndex == index
              ? Color.fromRGBO(48, 105, 193, 1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20)),
      height: height * 0.09,
      width: (width - 44) * 0.5,
      child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: cloudIndex != index ? Colors.black : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          )),
    ),
  );
}
