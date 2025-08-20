
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final int start;
  final int end;

  SecondScreen({required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    int lower = start < end ? start : end;
    int upper = start < end ? end : start;

    List<int> numbers = [];
    for (int i = lower + 1; i < upper; i++) {
      numbers.add(i);
    }

    return Scaffold(
      appBar: AppBar(title: Text('Numbers Between')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Numbers between $start and $end:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                numbers.isEmpty ? 'No numbers between' : numbers.join(', '),
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}