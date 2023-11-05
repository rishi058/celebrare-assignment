import 'package:flutter/material.dart';

Widget originalBox() {
  return Container(
    margin: const EdgeInsets.all(3),
    width: 55,
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 1),
    ),
    child: const Center(child: Text('Original')),
  );
}

Widget shapeBox(String asset) {
  return Container(
    margin: const EdgeInsets.all(3),
    width: 55,
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 1),
    ),
    child: Image(image: AssetImage(asset),),
  );
}
