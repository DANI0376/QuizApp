// import 'dart:convert';

// ignore: depend_on_referenced_packages

import 'package:http/http.dart' as http;
// import 'package:quizapp/modal.dart';

import 'model.dart';

Future<List<Question>> fetchQuestion() async {
  final response = await http
      .get(Uri.parse('https://637dbfffcfdbfd9a639bba1e.mockapi.io/sample'));
  print(response.statusCode);
  if (response.statusCode == 200) {
    return questionFromJson(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}
