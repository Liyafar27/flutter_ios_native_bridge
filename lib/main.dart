// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('IOS Native Bridge')),
        body: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const platform = MethodChannel('com.example/native');
  int counter = 0;
  String fileContent = '';

  Future<void> _callNative() async {
    setState(() {
      counter++;
    });

    try {
      final String result = await platform.invokeMethod('writeHello', {'n': counter});
      setState(() {
        fileContent = result;
      });
    } on PlatformException catch (e) {
      setState(() {
        fileContent = "Error: ${e.message}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _callNative,
            child: const Text('Tap'),
          ),
          const SizedBox(height: 20),
          Text(fileContent),
        ],
      ),
    );
  }
}