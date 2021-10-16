import 'package:dars40/screens/botton_nav_bar.dart';
import 'package:dars40/screens/second_page.dart';
import 'package:dars40/screens/third_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
       home: const WeartherBottomNavigatorBarPage(),
      
      // home: ThirdPage(),
    );
  }
}

