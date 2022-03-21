import 'package:fashion/screens/bottomnavbar/profile/order.dart';
import 'package:fashion/screens/bottomnavbar/sign.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sign(),
      routes: {
        'order' : (context) => Order(), 
      },
    );
  }
}