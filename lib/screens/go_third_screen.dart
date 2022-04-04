import 'package:flutter/material.dart';

class GoThirdScreen extends StatefulWidget {
  final String incomingValue;

  const GoThirdScreen({Key? key, required this.incomingValue}) : super(key: key);

  @override
  _GoThirdScreenState createState() => _GoThirdScreenState();
}

class _GoThirdScreenState extends State<GoThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body:Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.incomingValue,
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
