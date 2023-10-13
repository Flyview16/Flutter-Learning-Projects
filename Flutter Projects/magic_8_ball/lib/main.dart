import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 48, 2, 56),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(66, 35, 1, 1),
          title: Center(
            child: Text('Ask Me Anything'),
          ),
        ),
        body: Magic8Ball(),
      ),
    ),
  );
}

class Magic8Ball extends StatefulWidget {
  const Magic8Ball({super.key});

  @override
  State<Magic8Ball> createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  int orbFace = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  orbFace = Random().nextInt(5) + 1;
                });
              },
              child: Image(
                image: AssetImage('lib/images/ball$orbFace.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
