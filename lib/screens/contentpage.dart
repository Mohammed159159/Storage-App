import 'package:flutter/material.dart';
import 'package:storage_app/modules/image.dart';
import 'package:storage_app/screens/ImagePage.dart';
import 'package:storage_app/screens/homepage.dart';
import 'package:storage_app/widgets/appbar.dart';
import 'package:storage_app/widgets/imagecard.dart';
import 'package:storage_app/widgets/navigationBar.dart';
import 'package:storage_app/widgets/sortingrow.dart';

class ContentPage extends StatefulWidget {
  final String name;

  ContentPage({this.name});

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  void notifyme() {
    setState(() {
      currentIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    double navigationBarHeight = 75;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: NavigationBar(
            navigationBarHeight: navigationBarHeight,
            notifier: notifyme,
            width: width,),
          body: Column(
            children: [
              SizedBox(height: 24,),
              Appbar(name: widget.name, pageindex: 1,),
              SizedBox(height: 24,),
              sortingRow(),
              SizedBox(height: 15,),
              Expanded(
                child: Container(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10
                      ),
                      itemCount: myimages.length,
                      itemBuilder: (context, index) {
                        MyImage myimage = myimages[index];
                        return Hero(
                          tag: "${myimage.name}",
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ImagePage(image: myimage,))),
                            child: imageCard(image: myimage.image,
                                name: myimage.name,
                                size: myimage.size.toInt()),
                          ),
                        );
                      }
                ),
                ),
              )
            ],
          )),
    );
  }
}
