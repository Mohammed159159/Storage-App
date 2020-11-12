import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StorageContainer extends StatefulWidget {
  @override
  _StorageContainerState createState() => _StorageContainerState();
}

class _StorageContainerState extends State<StorageContainer> {
  @override
  Widget build(BuildContext context) {
    double radius = 10;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: 135,
          color: Color.fromRGBO(48, 105, 193, 1),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 70, top: 25),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "10.8 GB",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 18)),
                          TextSpan(
                              text: " of 15 GB used",
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                  fontSize: 18))
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(radius),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(110, 150, 211, 1),
                          ),
                          height: 35,
                          width: width * 0.35,
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkResponse(
                              borderRadius: BorderRadius.circular(10),
                              highlightShape: BoxShape.rectangle,
                              splashColor: Colors.blue,
                              radius: 95,
                              onTap: ()
                              {},
                              child: Center(
                                child: Text("Buy Storage", style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 18)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 25,
                child: CircularStepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 68,
                  stepSize: 8,
                  selectedColor: Colors.white,
                  unselectedColor: Color.fromRGBO(110, 150, 211, 1),
                  padding: 0,
                  width: 80,
                  height: 80,
                  selectedStepSize: 8,
                  roundedCap: (_, __) => true,
                  child: Center(
                    child: Text("68%", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18))
                  )
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: ClipPath(
                  clipper: MyClip(radius),
                  child: Container(
                    height: 180,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(30),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyClip extends CustomClipper<Path> {
  double radius;
  MyClip(this.radius);
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(size.width * 0.35, size.height)
    ..lineTo(size.width - radius, size.height)
    ..quadraticBezierTo(size.width, size.height, size.width, size.height - radius)
    ..lineTo(size.width, size.height * 0.5)
    ..quadraticBezierTo(size.width * 0.2 + radius, size.height * 0.6, size.width * 0.35, size.height);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
