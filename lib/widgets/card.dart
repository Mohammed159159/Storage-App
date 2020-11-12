import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:storage_app/styles/textstyles.dart';

Widget card({double width, double height, String icon, String name, Widget subtitle})
{
  return Container(
    height: 50,
    width: width * 0.35,
    decoration: BoxDecoration(
      color: Color.fromRGBO(110, 150, 211, 0.05),
      borderRadius: BorderRadius.circular(30)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: SvgPicture.asset(icon,
          height: 50,
            width: 50,
            color: Color(0xFF495EC9),
          ),
        ),
        SizedBox(height: 10,),
        Text(name, style: fileCaption,),
        SizedBox(height: 7,),
        subtitle == null? SizedBox.shrink() : subtitle
      ],
    ),
  );
}