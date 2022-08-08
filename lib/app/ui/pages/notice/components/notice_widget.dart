
import 'package:flutter/material.dart';


//button
Widget buildCallContainer(String title){
  return Container(
    width: 40.0,
    height: 40.0,
    decoration: BoxDecoration(
      color: Colors.lightGreen,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Center(child: Text('$title')),
  );
}