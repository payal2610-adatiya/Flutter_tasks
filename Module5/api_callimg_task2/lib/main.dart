import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List> getdata() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var res = await http.get(

      url,
      headers: {
        'User-Agent': 'FlutterApp/1.0',
        'Accept': 'application/json',
      },
    );

    if (res.statusCode == 200) {
      List jsonResponse = jsonDecode(res.body);
      return jsonResponse;
    } else {
      throw Exception('Error: ${res.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users List")),
      body: FutureBuilder<List>(
        future: getdata(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Network not found"));
          }
          if (snapshot.hasData) {
            return MyModel(list: snapshot.data!);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
