import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HeroesApp(),
  ));
}

class HeroesApp extends StatefulWidget {
  const HeroesApp({super.key});

  @override
  State<HeroesApp> createState() => _HeroesAppState();
}

class _HeroesAppState extends State<HeroesApp> {

  Future<List<dynamic>> getHeroes() async {
    var url = Uri.parse("https://www.simplifiedcoding.net/demos/view-flipper/heroes.php");
    var res = await http.get(url);
    var body = jsonDecode(res.body);
    return body['heroes'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Heroes API Example")),
      body: FutureBuilder(
        future: getHeroes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Network Error!"));
          }
          if (snapshot.hasData) {
            return HeroModel(list: snapshot.data);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
