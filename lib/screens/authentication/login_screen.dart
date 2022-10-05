import 'dart:convert';
import 'dart:ui';
// import 'package:myregistration/welcome.dart';

// import 'signup.dart';
import 'package:airkarece/screens/authentication/signup_screen.dart';

import 'loginApi.dart';
import 'package:airkarece/models/screen_models.dart';

import '../welcome/welcome_screen.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> authenticate() async {
    List? loginResponse;
    loginResponse = await login(
        email: emailController.text.toString(),
        password: passwordController.text.toString());
    var values = jsonDecode(loginResponse[1]);
    print(values['status']);

    if (loginResponse[0] == 200) {
      if (values['status'] == 422) {
        print((values['message']));
        return values["message"];
      } else {
        print((values['message']));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ));
      }
      return values["message"];
    } else {
      print('incorrect credentials');
      return values["Invalid Credentials"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Stack(children: [
            Positioned(
              top: 200,
              left: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(46, 39, 129, 239),
                  borderRadius: BorderRadius.all(
                    Radius.circular(150),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: -10,
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0x30cc33ff),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
            ),
            Positioned(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 80,
                  sigmaY: 80,
                ),
                child: Container(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    _logo(),
                    const SizedBox(
                      height: 30,
                    ),
                    _loginLabel(),
                    const SizedBox(
                      height: 50,
                    ),
                    _labelTextInput(
                      "Email",
                      "yourname@example.com",
                      false,
                      emailController,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    _labelTextInput(
                      "Password",
                      "yourpassword",
                      true,
                      passwordController,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    _loginBtn(
                      () async {
                        String message = await authenticate();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            action: SnackBarAction(
                              label: 'Ok',
                              onPressed: () {
                                // Code to execute.
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    _signUpLabel(
                        "Don't have an account?",
                        Color(
                          0xff909090,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MySignUp()),
                        );
                      },
                      child: _signUpLabel(
                          "Sign Up",
                          Color(
                            0xff164276,
                          )),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

Widget _signUpLabel(String label, Color textColor) {
  return Text(
    label,
    style: GoogleFonts.josefinSans(
      textStyle: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w800,
        fontSize: 18,
      ),
    ),
  );
}

Widget _loginBtn(VoidCallback onPressed) {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: const BoxDecoration(
      color: Color(0xFF7C4DFF),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        "Login",
        style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
      ),
    ),
  );
}

Widget _labelTextInput(
    String label, String hintText, bool isPassword, controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
                color: Color(0xff8fa1b6),
                fontWeight: FontWeight.w600,
                fontSize: 20)),
      ),
      TextField(
        controller: controller,
        obscureText: isPassword,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
                color: Color(0xffc5d2e1),
                fontWeight: FontWeight.w400,
                fontSize: 20),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffdfe8f3)),
          ),
        ),
      ),
    ],
  );
}

Widget _loginLabel() {
  return Center(
    child: Text(
      "Login",
      style: GoogleFonts.josefinSans(
        textStyle: const TextStyle(
          color: Color(0xff164276),
          fontWeight: FontWeight.w900,
          fontSize: 34,
        ),
      ),
    ),
  );
}

Widget _logo() {
  return Center(
    child: SizedBox(
      height: 200,
      width: 200,
      // child: SvgPicture.asset('images/login.svg'),
    ),
  );
}
