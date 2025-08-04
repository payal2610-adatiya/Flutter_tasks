import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const BackButton1());
}

class BackButton1 extends StatelessWidget {
  const BackButton1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (_lastPressedAt == null || now.difference(_lastPressedAt!) > Duration(seconds: 2)) {
          _lastPressedAt = now;
          _showExitDialog();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Double Tap to Exit")),
        body: const Center(
          child: Text("Double tap to exit"),
        ),
      ),
    );
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are you sure you want to exit?"),
        content: const Text("If you want to exit directly press double tap"),
        actions: [
          TextButton(
            onPressed: () {
              exit(0);
            },
            child: const Text("OK"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("CANCEL"),
          ),
        ],
      ),
    );
  }
