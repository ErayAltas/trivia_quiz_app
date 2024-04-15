// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trivia_quiz_app/models/category.dart';
import 'package:trivia_quiz_app/models/question.dart';
import 'package:trivia_quiz_app/service/api_service.dart';
import 'package:trivia_quiz_app/service/helper.dart';
import 'package:trivia_quiz_app/view/quiz/quiz_page.dart';

class QuizOptionsDialog extends StatefulWidget {
  final Category? category;
  const QuizOptionsDialog({super.key, this.category});

  @override
  QuizOptionsDialogState createState() => QuizOptionsDialogState();
}

class QuizOptionsDialogState extends State<QuizOptionsDialog> {
  int noOfQuestions = 5;
  String difficulty = "any";
  bool processing = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey.shade200,
            child: Text(
              widget.category!.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
          ),
          const SizedBox(height: 5.0),
          Text("Select Total Number of Questions", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 16.0,
              children: [
                ActionChip(
                  label: const Text("5"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: noOfQuestions == 5 ? Colors.indigo : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(5),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                ),
                ActionChip(
                  label: const Text("10"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: noOfQuestions == 10 ? Colors.indigo : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(10),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                ),
                ActionChip(
                  label: const Text("15"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: noOfQuestions == 15 ? Colors.indigo : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(15),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                ),
                ActionChip(
                  label: const Text("20"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: noOfQuestions == 20 ? Colors.indigo : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(20),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text("Select Difficulty", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 16.0,
              spacing: 16.0,
              children: [
                ActionChip(
                  label: const Text("Any"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: difficulty == "any" ? Colors.indigo : Colors.grey.shade600,
                  onPressed: () => _selectDifficulty("any"),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                ),
                ActionChip(
                  label: const Text("Easy"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: difficulty == "easy" ? Colors.indigo : Colors.grey.shade600,
                  onPressed: () => _selectDifficulty("easy"),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                ),
                ActionChip(
                  label: const Text("Medium"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: difficulty == "medium" ? Colors.indigo : Colors.grey.shade600,
                  onPressed: () => _selectDifficulty("medium"),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                ),
                ActionChip(
                  label: const Text("Hard"),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: difficulty == "hard" ? Colors.indigo : Colors.grey.shade600,
                  onPressed: () => _selectDifficulty("hard"),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          processing
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onPressed: _startQuiz,
                    child: Text(
                      "Start Quiz",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  _selectNumberOfQuestions(int i) {
    setState(() {
      noOfQuestions = i;
    });
  }

  _selectDifficulty(String s) {
    setState(() {
      difficulty = s;
    });
  }

  void _startQuiz() async {
    setState(() {
      processing = true;
    });
    try {
      List<Question> questions = await getQuestions(category: widget.category!, total: noOfQuestions, difficulty: difficulty);
      Navigator.pop(context);
      if (questions.isEmpty) {
        Helper.showToastError("There are not enough questions in the category, with the options you selected.");
        return;
      }
      Get.to(() => QuizPage(questions: questions, category: widget.category));
    } catch (e) {
      Helper.showToastError("Failed to load questions. Please check your internet connection.");
    }
    setState(() {
      processing = false;
    });
  }
}
