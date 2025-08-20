import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _operation = 'Addition';

  void _calculate() {
    final num1 = double.tryParse(_num1Controller.text) ?? 0;
    final num2 = double.tryParse(_num2Controller.text) ?? 0;
    double result;

    switch (_operation) {
      case 'Addition':
        result = num1 + num2;
        break;
      case 'Subtraction':
        result = num1 - num2;
        break;
      case 'Multiplication':
        result = num1 * num2;
        break;
      case 'Division':
        result =  num1 / num2;
        break;
      default:
        result = 0;
    }


    Fluttertoast.showToast(msg: "Your Result is:", toastLength: Toast.LENGTH_LONG);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter first number'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter second number'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Radio<String>(
                  value: 'Addition',
                  groupValue: _operation,
                  onChanged: (value) {
                    setState(() {
                      _operation = value!;
                    });
                  },
                ),
                Text('Addition'),
                Radio<String>(
                  value: 'Subtraction',
                  groupValue: _operation,
                  onChanged: (value) {
                    setState(() {
                      _operation = value!;
                    });
                  },
                ),
                Text('Subtraction'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Radio<String>(
                  value: 'Multiplication',
                  groupValue: _operation,
                  onChanged: (value) {
                    setState(() {
                      _operation = value!;
                    });
                  },
                ),
                Text('Multiplication'),
                Radio<String>(
                  value: 'Division',
                  groupValue: _operation,
                  onChanged: (value) {
                    setState(() {
                      _operation = value!;
                    });
                  },
                ),
                Text('Division'),
              ],
            ),
            ElevatedButton(
              child: Text('Calculate'),
              onPressed: _calculate,
            ),
          ],
        ),
      ),
    );
  }
}