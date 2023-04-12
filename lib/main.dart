import 'package:exam_address_book/contactview.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

        "/" : (context) => ContactView(),


      }
    ),
  );
}