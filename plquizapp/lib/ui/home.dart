import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plquizapp/model/questions.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name(
        "Chelsea former player, Micheal Essien was born in Ghana in 1982",
        true),
    Question.name(
        "Mohammed Salah scored 34 league goals in his first season at Liverpool",
        false),
    Question.name(
        "Ilkay Gundogan was Pep Guardiola's first signing as boss of Manchester City",
        true),
    Question.name(
        "Alan Shearer has the most hat-tricks in Premier League history",
        false),
    Question.name(
        "Didier Drogba scored 4 league goals in his last season at Chelsea",
        true),
    Question.name("Arsenal won the 2001/2002 Premier League campaign", true),
    Question.name(
        "Jordan Henderson started off his professional career at Sunderland",
        true),
    Question.name(
        "Sadio Mane wore the jersey number (19) in his first season at Liverpool",
        true),
    Question.name(
        "Gareth Barry has the most Premier League appearances ", true),
    Question.name(
        "Ryan Giggs has the record for most Premier League assists ", true),
    Question.name(
        "The transfer fee of Son Heung-min from Leverkusen to Spurs was 22 million pounds.",
        true),
    Question.name(
        "Alex Ferguson won the Manager of the Year in 2000/2001 Premier League campaign",
        false),
    Question.name(
        "Manchester United reached the 1,000 goals milestone when Cristiano Ronaldo scored in a 4-1 loss to Middlesbrough in the 2005-06 season",
        true),
    Question.name(
        "The first ever live Premier League match was played at City Ground, Nottingham's Forest home ground",
        true),
    Question.name(
        "Jermaine Defoe holds the record for the fastest Premier League goal",
        false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How well do you know the PL?"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent.shade400,
      ),
      backgroundColor: Colors.greenAccent.shade400,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/PL-Logo.png",
                  width: 250,
                  height: 190,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.5),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                      child: Text(
                    questionBank[_currentQuestionIndex].questionText,
                    style: TextStyle(fontSize: 16.9, color: Colors.white),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _previousQuestion(),
                    color: Colors.purple.shade700,
                    child:
                        Text("PREVIOUS", style: TextStyle(color: Colors.white)),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.purple.shade700,
                    child: Text("TRUE", style: TextStyle(color: Colors.white)),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.purple.shade700,
                    child: Text("FALSE", style: TextStyle(color: Colors.white)),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.purple.shade700,
                    child: Text("NEXT", style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackBar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct!"));
      Scaffold.of(context).showSnackBar(snackBar);
      // correct answer
      debugPrint("Correct!");
      _updateQuestion();
    } else {
      _updateQuestion();
      debugPrint("Wrong!");
      final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 500),
          content: Text("Wrong!"));
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}
