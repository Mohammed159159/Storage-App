import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:storage_app/screens/filespage.dart';
import 'package:storage_app/styles/textstyles.dart';

class Appbar extends StatelessWidget {
  int pageindex;
  String name;

  Appbar({this.pageindex, this.name});

  @override
  Widget build(BuildContext context) {
    bool home = pageindex == 0;
    bool openfolder = pageindex == 1;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: 20, top: 20, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          openfolder
              ? Padding(
            padding: EdgeInsets.only(right: width * 0.28),
                child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (_) => FilesPage()));
                        },
                      ),
                      Text(
                        name,
                        style: heading.copyWith(fontWeight: FontWeight.w300, fontSize: 17),
                      ),
                    ],
                  ),
              )
              : SizedBox.shrink(),
          InkResponse(
                  splashColor: Colors.blue,
                  radius: 23,
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SvgPicture.asset(
                      "assets/icons/search.svg",
                      height: 30,
                    ),
                  )),
          home
              ? Padding(
                  padding: EdgeInsets.only(left: width * 0.14),
                  child: InkResponse(
                      splashColor: Colors.blue,
                      radius: 23,
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/icons/tones.svg",
                        height: 30,
                      )),
                )
              : SizedBox.shrink(),
          openfolder
              ? Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: width * 0.14),
                    child: IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () => null,
                    ),
                  ),
              )
              : Padding(
                  padding: EdgeInsets.only(left: width * 0.14),
                  child: InkResponse(
                      splashColor: Colors.blue,
                      radius: 23,
                      onTap: () {},
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/guy.jpg"),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                  border: Border.all(color: Colors.white)),
                            ),
                          ),
                        ],
                      )),
                )
        ],
      ),
    );
  }
}
