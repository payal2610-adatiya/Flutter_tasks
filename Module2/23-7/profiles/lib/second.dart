import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen  extends StatefulWidget {
  const SecondScreen ({super.key});

  @override
  State<SecondScreen > createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen > {
  int val=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Like : $val", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ElevatedButton(onPressed: ()
              {
                setState(() {
                  val++;
                });
              }, child: Text("CLICK ME ")
          )
        ],
      ),
    );
  }
}
