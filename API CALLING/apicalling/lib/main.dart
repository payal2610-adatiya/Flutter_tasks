import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';


void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getdata() async
  {
    var url=Uri.parse("https://simplifiedcoding.net/demos/marvel/");
    var res= await http.get(url);
    return jsonDecode(res.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Calling Example "),),
      body: FutureBuilder(future: getdata(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasError)
          {
            print("Network not found");
          }
        if(snapshot.hasData)
          {
            return MyModel(list:snapshot.data);
          }
        return Center(child: CircularProgressIndicator());
        },),
    );
  }
}
