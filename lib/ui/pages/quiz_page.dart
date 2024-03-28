// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:trivia_quiz_app/models/category.dart';
import 'package:trivia_quiz_app/models/question.dart';
import 'package:trivia_quiz_app/ui/pages/quiz_finished.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  final Category? category;

  const QuizPage({super.key, required this.questions, this.category});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  final TextStyle _questionStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.incorrectAnswers!;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text(widget.category!.name),
          elevation: 0,
        ),
        body: Stack(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Text("${_currentIndex + 1}"),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          HtmlUnescape().convert(widget.questions[_currentIndex].question!),
                          softWrap: true,
                          style: MediaQuery.of(context).size.width > 800 ? _questionStyle.copyWith(fontSize: 30.0) : _questionStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...options.map((option) => RadioListTile(
                              title: Text(
                                HtmlUnescape().convert("$option"),
                                style: MediaQuery.of(context).size.width > 800 ? const TextStyle(fontSize: 30.0) : null,
                              ),
                              groupValue: _answers[_currentIndex],
                              value: option,
                              onChanged: (dynamic value) {
                                setState(() {
                                  _answers[_currentIndex] = option;
                                });
                              },
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size.fromHeight(45),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onPressed: _nextSubmit,
                        child: Text(
                          _currentIndex == (widget.questions.length - 1) ? "Submit" : "Next",
                          style: Theme.of(context).textTheme.button?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => QuizFinishedPage(questions: widget.questions, answers: _answers)));
    }
  }

  Future<bool> _onWillPop() async {
    final resp = await showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: const Text("Are you sure you want to quit the quiz? All your progress will be lost."),
            title: const Text("Warning!"),
            actions: [
              TextButton(
                child: const Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              TextButton(
                child: const Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
    return resp ?? false;
  }
}
