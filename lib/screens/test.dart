  import 'package:airkarece/utils/app_config.dart';
import 'package:flutter/material.dart';
  

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: widget.key,
      backgroundColor: Colors.transparent,
      body: const Placeholder()
    );
  }
}
