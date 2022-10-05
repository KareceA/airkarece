
import 'package:airkarece/routes/routes.dart';
import 'package:airkarece/utils/app_config.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical! * 2,
                    horizontal: SizeConfig.blockSizeHorizontal! * 2),
                height: SizeConfig.blockSizeVertical! * 50,
                width: SizeConfig.blockSizeHorizontal! * 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 229, 246),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: "Fly anywhere in the world with \nthe ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 1.5,
                              height: 1.5),
                          children: [
                            TextSpan(
                              text: "AirKarece mobile app",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! * 4),
                    Center(
                      child: CircleAvatar(
                        radius: SizeConfig.safeBlockHorizontal! * 8,
                        backgroundImage:
                            const AssetImage('assets/images/image1.jpg'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: SizeConfig.blockSizeHorizontal! * 8,
                          backgroundImage:
                              const AssetImage('assets/images/image2.jpg'),
                        ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal! * 12),
                        CircleAvatar(
                          radius: SizeConfig.blockSizeHorizontal! * 10,
                          backgroundImage:
                              const AssetImage('assets/images/image3.jpg'),
                        ),
                      ],
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal! * 6,
                        backgroundImage:
                            const AssetImage('assets/images/image4.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 8),
              Container(
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical! * 0.5),
                color: const Color.fromARGB(255, 211, 241, 226),
                child: const Text(
                  "Flights",
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 2),
              const Text(
                "Tickets",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 0.5),
              const Text(
                "booking",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 2),
              InkWell(
                onTap: (() {
                  Navigator.of(context).pushNamed(homeViewRoute);
                }),
                child: Ink(
                  padding: EdgeInsets.all(SizeConfig.blockSizeVertical! * 0.1),
                  height: SizeConfig.blockSizeVertical! * 6.0,
                  width: SizeConfig.blockSizeHorizontal! * 40.0,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.blue,
                        Colors.red,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal! * 4),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal! * 3.0),
                    ),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: RichText(
        text: const TextSpan(
            text: 'Air',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
            children: [
              TextSpan(
                text: 'Karece',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
      // backgroundColor: Colors.transparent,
      // actions: [
      //   IconButton(
      //     icon: const Icon(
      //       Icons.sort_rounded,
      //       color: Colors.black,
      //     ),
      //     onPressed: () => {},
      //   )
      // ],
      elevation: 0,
    );
  }
}
