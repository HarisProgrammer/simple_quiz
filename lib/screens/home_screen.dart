import 'package:flutter/material.dart';
import 'package:king_project/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body:Column(
        children: [
          Container(
            width:double.infinity,
            height: 500,
            child: Image.asset('images/quiz2.png',
              alignment: Alignment.topLeft,
            ),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return QuizScreen();
              }));
            },
            child:Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Lets Start Quiz',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
