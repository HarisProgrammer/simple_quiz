import 'package:flutter/material.dart';

class GoSecondScreen extends StatelessWidget {

  final String incomingValue;
  const GoSecondScreen({Key? key,required this.incomingValue,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(incomingValue,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
          )
          ),
        ],
      ),
    );
  }
}
