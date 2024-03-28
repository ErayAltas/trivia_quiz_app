import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trivia_quiz_app/models/category.dart';
import 'package:trivia_quiz_app/models/question.dart';

const String baseUrl = "https://opentdb.com/api.php";

Future<List<Question>> getQuestions({required Category category, required int total, required String difficulty}) async {
  String url = "$baseUrl?amount=$total&category=${category.id}";
  if (difficulty != "any") {
    url = "$url&difficulty=$difficulty";
  }
  http.Response res = await http.get(Uri.parse(url));
  List<Map<String, dynamic>> questions = List<Map<String, dynamic>>.from(json.decode(res.body)["results"]);
  return Question.fromData(questions);
}
