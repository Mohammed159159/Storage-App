import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:storage_app/modules/icons.dart';
import 'package:storage_app/screens/filespage.dart';
import 'package:storage_app/screens/homepage.dart';

class NavigationBar extends StatelessWidget {
  final Function notifier;
  final double navigationBarHeight, width;

  NavigationBar({this.notifier, this.width, this.navigationBarHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: navigationBarHeight,
      width: width,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           navBarElement(0, notifier, context),
            navBarElement(1, notifier, context),
            navBarElement(2, notifier, context),
            navBarElement(3, notifier, context),

          ],
        ),
      ),
    );
  }
}

Widget navBarElement(int index, Function notifier, BuildContext context)
{
  return GestureDetector(
    onTap: () {
      currentIndex = index;
      notifier();
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => index == 0 ? Home(): FilesPage()));
      },
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            myicons[index].myIcon,
            height: myicons[index].iconIndex == currentIndex ? 30 : 25,
            width: myicons[index].iconIndex == currentIndex ? 30 : 25,
            color: myicons[index].iconIndex == currentIndex
                ? Color(0xFF3048C1)
                : Colors.grey[300],
          ),
          myicons[index].iconIndex == currentIndex ? Padding(
            padding: EdgeInsets.only(top: 7.0),
            child: Text(myicons[index].name,),
          ): SizedBox.shrink(),
          SizedBox(width: 50,)
        ],
      ),
    ),
  );
}