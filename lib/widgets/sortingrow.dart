import 'package:flutter/material.dart';
import 'package:storage_app/styles/textstyles.dart';

Widget sortingRow(){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 22),
    child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Date Modified",
                  style: heading.copyWith(fontWeight: FontWeight
                      .w300),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_downward,
                ),
              ],
            ),
            Icon(
              Icons.apps,
              color: Color.fromRGBO(48, 105, 193, 1),
            )
          ],
        )),
  );
}