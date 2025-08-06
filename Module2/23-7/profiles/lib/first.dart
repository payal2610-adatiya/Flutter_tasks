import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/me.jpg"),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ADATIYA PAYAL ",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
              Text('Flutter Developer', style: TextStyle(color: Colors.grey)),
            ],
          )
        ],
      ),

    );
  }
}
