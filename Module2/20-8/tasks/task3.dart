import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ColorChangerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color _selectedColor = Colors.white;
  String _colorName = 'White';

  final Map<String, Color> _colors = {
    'Red': Colors.red,
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Purple': Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedColor,
      appBar: AppBar(
        title: Text('Background Color Changer'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select a color:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ..._colors.entries.map((entry) {
                return RadioListTile<String>(
                  title: Text(entry.key),
                  value: entry.key,
                  groupValue: _colorName,
                  activeColor: entry.value,
                  onChanged: (String? value) {
                    setState(() {
                      _colorName = value!;
                      _selectedColor = entry.value;
                    });
                  },
                );
              }).toList(),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}