import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> login({
  String? email,
  String? password,
}) async {
  int? statusCode;
  String? responseBody;
  try {
    http.Response response = await http.post(
        Uri.parse(
            'https://thawing-reef-30756.herokuapp.com/api/student_info/login.php'),
        body: jsonEncode({'email': email, 'password': password}));

    statusCode = response.statusCode;
    responseBody = response.body.toString();
  } catch (e) {
    print(e.toString());
  }

  return [statusCode, responseBody];
}
