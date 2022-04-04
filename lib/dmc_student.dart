import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var firstInputController = TextEditingController();
  var secondInputController = TextEditingController();
  var thirdInputController = TextEditingController();
  String obtainedMarks = '';
  String percentage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Result'),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 290,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.2),
                ),
                child: Center(child: Text(
                    'Detailed Marks Certificate',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
            child: TextField(
              controller: firstInputController,
              keyboardType: TextInputType.number,
              maxLength:3,
              decoration: InputDecoration(
                hintText: 'Enter Eng Marks',
                labelText: 'English',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.5)
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
            child: TextField(
              controller: secondInputController,
              keyboardType: TextInputType.number,
              maxLength:3,
              decoration: InputDecoration(
                  hintText: 'Enter Maths Marks',
                  labelText: 'Maths',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.5)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
            child: TextField(
              controller: thirdInputController,
              keyboardType: TextInputType.number,
              maxLength:3,
              decoration: InputDecoration(
                  hintText: 'Enter Urdu Marks',
                  labelText: 'Urdu',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.5)
                  ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed:(){
                      firstInputController.clear();
                      secondInputController.clear();
                      thirdInputController.clear();
                    },
                    child: Text('Reset'),
                  ),
                ),
                SizedBox(
                  width:30,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){

                      var eng = firstInputController.text;
                      var maths = secondInputController.text;
                      var urdu = thirdInputController.text;

                      int engMarks = int.parse(eng);
                      int mathsMarks = int.parse(maths);
                      int urduMarks = int.parse(urdu);
                      var sum = engMarks + mathsMarks + urduMarks;
                      obtainedMarks = sum.toString();

                      var per = sum / 400 * 100;
                      percentage = per.toString();
                      setState(() {

                      });
                    },
                    child: Text('Percentage'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Text('Obtained marks is: $obtainedMarks'),
          Text('percentage is : $percentage'),
        ],
      ),
    );
  }
}



//for pixx

// class FlightAssetImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     AssetImage assetimage = AssetImage('images/pic.jpg');
//     Image image = Image(
//       image: assetimage,
//       width: 360,
//       height:200,
//       fit: BoxFit.fill,
//       alignment: Alignment.topLeft,
//     );
//     return Container(child: image);
//   }
// }
