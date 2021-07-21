import 'package:flutter/material.dart';

void main() {
  runApp(feedback());
}

// ignore: camel_case_types
class feedback extends StatefulWidget {
  @override
  _feedbackState createState() => _feedbackState();
}

// ignore: camel_case_types
class _feedbackState extends State<feedback> {
  var rating = 1.0;
  var total = 0.0;
  var _questionIndex = 0;
  var setColor;

  Widget resultText(total) {
    if (total >= 0 && total <= 10) {
      setColor = Colors.red;
      return Text('We are sorry for your inconvenience',
          style: TextStyle(fontSize: 20.0));
    } else if (total >= 11 && total <= 20) {
      setColor = Colors.yellow[900];
      return Text('Hope we serve you better next time',
          style: TextStyle(fontSize: 20.0));
    } else {
      setColor = Colors.green;
      return Text('We hope you come back next time',
          style: TextStyle(fontSize: 20.0));
    }
  }

  final questions = const [
    'Rate the overall app (on 1 to 5):',
    'How is the UI of the app:',
    'Rate the color scheme of the app',
    'Rate the speed of the app:',
    'Rate your quality of life:',
    'Rate the user of the app XD:',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Feedback Form',
          ),
        ),
        body: (_questionIndex < (questions.length))
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Question #${_questionIndex + 1}:',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            questions[_questionIndex],
                            style: TextStyle(fontSize: 20.0),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          Slider(
                            value: rating,
                            min: 1,
                            max: 5,
                            divisions: 4,
                            label: rating.round().toString(),
                            onChanged: (newRating) {
                              setState(() {
                                rating = newRating;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Thank you for filling it out!',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      resultText(total),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Your Score is ${total}',
                        style: TextStyle(fontSize: 20.0, color: setColor),
                      )
                    ],
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              //total += rating;
              //print(total);
              setState(() {
                if (_questionIndex < (questions.length)) {
                  total += rating;
                  print(total);
                  _questionIndex++;
                  rating = 1.0;
                } else {
                  _questionIndex = 0;
                  total = 0;
                  rating = 1.0;
                }
              });
            },
            child: (_questionIndex < (questions.length)
                ? Icon(Icons.arrow_forward)
                : Icon(Icons.arrow_back))),
      ),
    );
  }
}
