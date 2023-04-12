import 'package:exam_address_book/contactview.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routes: {

        "/" : (context) => ContactView(),


      }
    ),
  );
}