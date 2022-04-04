import 'package:flutter/material.dart';
import 'package:king_project/screens/go_second_screen.dart';
import 'package:king_project/screens/go_third_screen.dart';
class GoHomeScreen extends StatefulWidget {
  const GoHomeScreen({Key? key}) : super(key: key);

  @override
  _GoHomeScreenState createState() => _GoHomeScreenState();
}

class _GoHomeScreenState extends State<GoHomeScreen> {
  var numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go to Other Screens'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.blue[100],
            child: Column(
              children:[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: numberController,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Name',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    keyboardType: TextInputType.name,
                    maxLength: 10,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Colors.black,
                    onPrimary: Colors.yellow,
                  ),
                    onPressed: (){
                    var name = numberController.text;

                    Navigator.of(context).push(MaterialPageRoute(builder: (context){

                      return GoSecondScreen(incomingValue: name,);

                    }));
                    },
                    child: Text('Second Screen'),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Colors.black,
                    onPrimary: Colors.yellow,
                  ),
                  onPressed: (){
                    var name = numberController.text;

                    Navigator.of(context).push(MaterialPageRoute(builder: (context){

                      return GoThirdScreen(incomingValue: name,);

                    }));
                  },
                  child: Text('Third Screen'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
