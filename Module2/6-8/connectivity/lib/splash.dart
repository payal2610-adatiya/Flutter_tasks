import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'login.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result)
    {

      if (result.contains(ConnectivityResult.mobile))
      {
        Timer(Duration(seconds: 3), () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()
        )));
      }

      else if (result.contains(ConnectivityResult.wifi))
      {
        Timer(Duration(seconds: 3), () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()
        )));
      }

      else if (result.contains(ConnectivityResult.none))
      {
        _showNoConnectionDialog();
      }
    });

  }



  void _showNoConnectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(children: [Icon(Icons.error_rounded),Text("No Internet"),]),
          content: Text("Please check your internet connection and try again."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/cafe.json"),
      ),
    );
  }
}