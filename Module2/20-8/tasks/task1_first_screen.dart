import 'package:flutter/material.dart';
import 'package:tasks/task1_second_screen.dart';
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Numbers')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'First number'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Second number'),
            ),
            ElevatedButton(
              child: Text('Show Numbers Between'),
              onPressed: () {
                final num1 = int.tryParse(_num1Controller.text) ?? 0;
                final num2 = int.tryParse(_num2Controller.text) ?? 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(start: num1, end: num2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
