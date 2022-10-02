import 'package:airkarece/routes/routes.dart';
import 'package:airkarece/utils/app_config.dart';
import 'package:airkarece/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:airkarece/routes/router.dart' as router;

Future<void> main() async {
  // Bind all files to the app before the app starts. enables environment
  // variables to be bounded to app before the app starts
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Airkarece());
}

class Airkarece extends StatelessWidget {
  const Airkarece({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App Name
      title: AppConfig.appName,
      // App Theme
      theme: AirKareceTheme.lightTheme,

      debugShowCheckedModeBanner: false,

      // Make flutter aware of app routes using
      //router generator in router.dart file
      onGenerateRoute: router.generateRoute,

      // Initial Route
      initialRoute: welcomeViewRoute,
    );
  }
}
