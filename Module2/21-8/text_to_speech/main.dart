import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TEXT TO SPEECH ',
      home: TexttoSpeechEx(),
    );
  }
  
}

class TexttoSpeechEx extends StatefulWidget {
  const TexttoSpeechEx({super.key});

  @override
  State<TexttoSpeechEx> createState() => _TexttoSpeechExState();
}

class _TexttoSpeechExState extends State<TexttoSpeechEx> {
  final FlutterTts tts = FlutterTts();
  final TextEditingController textController = TextEditingController();
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    tts.setCompletionHandler(() {
      setState(() => isSpeaking = false);
    });
  }

  @override
  void dispose() {
    tts.stop();
    textController.dispose();
    super.dispose();
  }

  Future<void> speak() async {
    if (textController.text.isEmpty) return;

    setState(() => isSpeaking = true);
    await tts.speak(textController.text);
  }

  Future<void> stop() async {
    await tts.stop();
    setState(() => isSpeaking = false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text-to-Speech"),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: textController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text to speak ',
                hintText: 'Type something',

              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: isSpeaking ? stop : speak,
                child: Text(isSpeaking ? 'Stop' : 'Speak'),)

          ],
        ),

      ),

    );

  }
}
