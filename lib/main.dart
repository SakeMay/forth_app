import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //create an empty lis
  List<Icon> scoreKeeper = [];
  List questions = [
    ['แดง+น้ำเงิน = ม่วง', true],
    ['3 + 4 = 5', false],
    ['1 + 1 = 2', true],
    ['คาร์บอนเป็นธาตุอโลหะ', true],
    ['6/2(1+2) = 1', false],
  ];

  int questionNumber = 0, score = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: SizedBox(),
        ),
        Expanded(
          flex: 5,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Center(
              child: Text(
                'Question: $questionNumber/${questions.length}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: SizedBox(),
        ),
        Expanded(
          flex: 20,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Center(
              child: Text(
                '$score',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 90.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: SizedBox(),
        ),
        Expanded(
          flex: 15,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Center(
                child: Text(
                  questionNumber != questions.length
                      ? questions[questionNumber][0]
                      : score >= (0.6 * (questions.length)).ceil()
                          ? 'Great Job!'
                          : 'Better Luck Next Time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: SizedBox(),
        ),
        Expanded(
          flex: 15,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                if (questionNumber < questions.length) {
                  bool correctAnswer = questions[questionNumber][1];
                  questionNumber++;
                  if (correctAnswer == true) {
                    score++;
                    setState(() {
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    });
                  } else {
                    setState(() {
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    });
                  }
                }
              },
            ),
          ),
        ),
        Expanded(
          flex: 15,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              // color: Colors.red,
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (questionNumber < questions.length) {
                  bool correctAnswer = questions[questionNumber][1];
                  questionNumber++;
                  if (correctAnswer == false) {
                    score++;
                    setState(() {
                      scoreKeeper.add(Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    });
                  } else {
                    setState(() {
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    });
                  }
                }
              },
            ),
          ),
        ),
        //แสดงผล icon สำหรับ scoreKeeper
        Expanded(
          flex: 8,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 50,
                child: Row(children: scoreKeeper),
              ),
              Expanded(
                flex: 50,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Text(
                      'Retry',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        questionNumber = 0;
                        score = 0;
                        scoreKeeper = [];
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(),
        )
      ],
    );
  }
}
