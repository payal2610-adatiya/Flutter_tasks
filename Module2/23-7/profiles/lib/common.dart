import 'package:flutter/material.dart';
import 'first.dart';
import 'fourth.dart';
import 'second.dart';
import 'third.dart';

class CommonScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Profile"),),
      body: Column
        (
        children:
        [
          FirstScreen(),
          SizedBox(height: 15,),
          SecondScreen(),
          SizedBox(height: 15,),
          ThirdScreen(),
          SizedBox(height: 15,),
          FourthScreen()


        ],
      ),
    );
  }
}