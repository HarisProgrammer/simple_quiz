import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var txtStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  var currentQuestionNumber = 0;
  var firstNumber = 0;
  var secondNumber = 0;
  var correctAnswer = 0;
  var totalCorrectAnswer = 0;
  late Random random;
  var showResult = false;
  var numberController = TextEditingController();



  _displayResult(){
    showResult = true;
    setState(() {

    });
  }

  void _displayQuestion() {

    if(currentQuestionNumber == 10){
      _displayResult();
      return;
    }
    currentQuestionNumber++;
    firstNumber = random.nextInt(8) + 2;
    secondNumber = random.nextInt(8) + 2;
    correctAnswer = firstNumber * secondNumber;
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    random = Random();

    _displayQuestion();
  }

  void _checkAnswer(){

    var answer = numberController.text.trim();
    if(answer.isEmpty){
      Fluttertoast.showToast(
          msg: "Please Enter Some Text",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black,
          textColor: Colors.yellow,
          fontSize: 18.0
      );
      return;
    }

    int userAnswer = int.parse(answer);
    if(correctAnswer ==  userAnswer){
      totalCorrectAnswer++;
      Fluttertoast.showToast(
          msg: "Congrats Its Correct",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 18.0
      );
    }
    else{
      Fluttertoast.showToast(
          msg: "Sorry Try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 18.0
      );
    }
       numberController.clear();
      _displayQuestion();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[100],
      appBar: AppBar(
        title: Text('Multiplication Quiz'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Question No $currentQuestionNumber',
            style: txtStyle,
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$firstNumber',
                    style: txtStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'X',
                    style: txtStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$secondNumber',
                    style: txtStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '=',
                    style: txtStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 100,
                    child: Expanded(
                      child: TextField(
                        // maxLength: 3,
                        controller: numberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.yellow
            ),
              onPressed:() {
                _checkAnswer();
              },
              child: Text('Check',
              style: txtStyle,
              )
          ),
         Visibility(
           visible: showResult,
             child:Container(
               margin: EdgeInsets.only(top: 30),
               width: 300,
               height: 250,
               decoration: BoxDecoration(
                 color: Colors.red,
                 borderRadius: BorderRadius.circular(30),
               ),
               child: Padding(
                 padding: const EdgeInsets.all(26.0),
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text('Total Question: 10',style: txtStyle,),
                     ),
                     Text('Total Correct Answer:$totalCorrectAnswer',style: txtStyle,),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text('Wrong Answer: ${10-totalCorrectAnswer}',style: txtStyle,),
                     ),

                     ElevatedButton(
                       child: Text('Play Again'),
                       onPressed: (){
                       currentQuestionNumber = 0;
                       totalCorrectAnswer = 0;
                       showResult = false;
                       setState(() {

                       });
                       _displayResult();
                     },
                     ),
                   ],
                 ),
               ),
             ),
         )
        ],
      ),
    );
  }
}
