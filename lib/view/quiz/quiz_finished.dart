import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trivia_quiz_app/models/question.dart';
import 'package:trivia_quiz_app/view/quiz/check_answers.dart';

class QuizFinishedPage extends StatefulWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  const QuizFinishedPage({super.key, required this.questions, required this.answers});

  @override
  QuizFinishedPageState createState() => QuizFinishedPageState();
}

class QuizFinishedPageState extends State<QuizFinishedPage> {
  int? correctAnswers;
  int correct = 0;

  final TextStyle titleStyle = const TextStyle(color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500);
  final TextStyle trailingStyle = TextStyle(color: Get.theme.primaryColor, fontSize: 20.0, fontWeight: FontWeight.bold);
  @override
  void initState() {
    super.initState();
    widget.answers.forEach((index, value) {
      if (widget.questions[index].correctAnswer == value) correct++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text("Total Questions", style: titleStyle),
                trailing: Text("${widget.questions.length}", style: trailingStyle),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text("Score", style: titleStyle),
                trailing: Text("${correct / widget.questions.length * 100}%", style: trailingStyle),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text("Correct Answers", style: titleStyle),
                trailing: Text("$correct/${widget.questions.length}", style: trailingStyle),
              ),
            ),
            const SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text("Incorrect Answers", style: titleStyle),
                trailing: Text("${widget.questions.length - correct}/${widget.questions.length}", style: trailingStyle),
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    minimumSize: const Size.fromHeight(45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: const Text("Go Home", style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size.fromHeight(45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: const Text("Check Answers", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CheckAnswersPage(
                          questions: widget.questions,
                          answers: widget.answers,
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
