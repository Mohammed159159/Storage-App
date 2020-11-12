import 'package:flutter/material.dart';
import 'package:storage_app/styles/textstyles.dart';

Widget imageCard({String image, String name, int size}) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Container(
          height: 120,
            width: 160,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            )),
      ),
      SizedBox(height: 10,),
      Text(name, style: fileCaption,),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 23),
          child: Text("$size MB", style: subtitle,),
        ),
      )
    ],
  );
}
