import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:storage_app/modules/image.dart';
import 'package:storage_app/styles/textstyles.dart';
Widget recentFiles(int index, double width, double height)
{
  return ClipRRect(
    child: Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: width * 0.65,
              height: height * 0.65,
              child: Image.asset(myimages[index].image,
                fit: BoxFit.cover,
              ),
            ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2,),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: SvgPicture.asset("assets/icons/images.svg",
                      height: 17,
                      color: Color(0xFF495EC9),
                    ),
                  ),
                  SizedBox(width: 3,),
                  Text(myimages[index].name, style: imageCaption,),
                ],
              ),
              Text("Added yesterday ${index + 10}am", style: imageCaption.copyWith(fontWeight: FontWeight.w300, fontSize: 12),),
            ],
          ),
        )
      ],
    ),
  );
}