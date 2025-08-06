import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FirstScreen(),debugShowCheckedModeBanner: false,));
}
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to my application"),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          children: [
            Text("data1",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text("data2",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text("data3",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text("data4",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text("data5",style:TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Image.asset("assets/a.jpg",width: 150,height: 200,)
          ],
        ),
      ),
    );
  }
}