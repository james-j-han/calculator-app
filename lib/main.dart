import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const Display(),
    theme: ThemeData(
      useMaterial3: true,
      primaryColor: Colors.orange,
    ),
  ));
}

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Text('data'),
            Row(
              children: [
                ElevatedButton(
                  onPressed: null, child: Text('7')),
                ElevatedButton(
                  onPressed: null, child: Text('8')),
                ElevatedButton(
                  onPressed: null, child: Text('9')),
                ElevatedButton(
                  onPressed: null, child: Text('/')),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: null, child: Text('4')),
                ElevatedButton(
                  onPressed: null, child: Text('5')),
                ElevatedButton(
                  onPressed: null, child: Text('6')),
                ElevatedButton(
                  onPressed: null, child: Text('x')),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: null, child: Text('1')),
                ElevatedButton(
                  onPressed: null, child: Text('2')),
                ElevatedButton(
                  onPressed: null, child: Text('3')),
                ElevatedButton(
                  onPressed: null, child: Text('+')),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: null, child: Text('0')),
                ElevatedButton(
                  onPressed: null, child: Text('.')),
                ElevatedButton(
                  onPressed: null, child: Text('-')),
              ],
            ),
          ],
        ))
    );
  }
}