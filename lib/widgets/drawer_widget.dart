import 'package:airkarece/routes/routes.dart';
import 'package:airkarece/utils/app_config.dart';

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
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
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical! * 5),
                ListTile(
                  leading: const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                  ),
                  title: const Text('Home'),
                  onTap: (() {
                    Navigator.of(context).pushNamed(homeViewRoute);
                  }),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.airplane_ticket,
                    color: Colors.black,
                  ),
                  title: const Text('Tickets'),
                  onTap: (() =>
                      Navigator.of(context).pushNamed(ticketViewRoute)),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: const Text('LogOut'),
              onTap: (() => Navigator.of(context).pushNamed(welcomeViewRoute)),
            ),
          ],
        ),
      ),
    );
  }
}
