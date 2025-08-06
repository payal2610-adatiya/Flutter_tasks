import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState()
  {
    //super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Lottie.asset("assets/cafe.json"),
      ) ,
    );
  }
}
