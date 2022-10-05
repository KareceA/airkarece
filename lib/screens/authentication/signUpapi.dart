import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> signUp({
  String? firstName,
  String? lastName,
  String? email,
  String? password,
}) async {
  int? statusCode;
  String? responseBody;
  try {
    http.Response response = await http.post(
        Uri.parse(
            'https://thawing-reef-30756.herokuapp.com/api/student_info/sign_up.php'),
        body: jsonEncode({
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password
        }));

    statusCode = response.statusCode;
    responseBody = response.body.toString();
  } catch (e) {
    print(e.toString());
  }

  return [statusCode, responseBody];
}



// void signUp(
//     {String? email,
//     String? password,
//     String? firstName,
//     String? lastName}) async {
//   try {
//     http.Response response = await http.post(
//         Uri.parse(
//             'https://thawing-reef-30756.herokuapp.com/api/student_info/sign_up.php'),
//         body: jsonEncode({
//           'first_name': firstName,
//           'last_name': lastName,
//           'email': email,
//           'password': password
//         }));

//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body.toString());
//       print(data);
//       print('SignUp successfully');
//       return data['message'];
//     } else {
//       print('failed');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }
