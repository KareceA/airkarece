import 'package:airkarece/models/flight.dart';
import 'package:airkarece/models/screen_models.dart';
import 'package:airkarece/routes/routes.dart';
import 'package:airkarece/utils/app_config.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final Flight flight;
  const CheckoutScreen({Key? key, required this.flight}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
            child: Column(
              children: [
                Container(
                  height: SizeConfig.screenHeight! / 2.5,
                  width: SizeConfig.screenWidth! / 0.5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal! * 5),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2,
                ),
                InkWell(
                  onTap: (() {
                    _buildConfirmationScreen(context, widget.flight);
                  }),
                  child: Ink(
                    padding: EdgeInsets.all(
                      SizeConfig.blockSizeVertical! * 2,
                    ),
                    height: SizeConfig.blockSizeVertical! * 8,
                    width: SizeConfig.blockSizeHorizontal! * 55,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal! * 4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.airplane_ticket,
                          color: Colors.green,
                          size: 30.0,
                        ),
                        Text(
                          "Buy Ticket",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      // backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.sort_rounded,
            color: Colors.black,
          ),
          onPressed: () => {},
        )
      ],
      elevation: 0,
    );
  }

  Future _buildConfirmationScreen(BuildContext context, Flight flight) =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: ((context, setState) {
                return AlertDialog(
                  contentPadding:
                      EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal! * 5),
                  ),
                  title: const Text("Confirm Ticket Details"),
                  titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  content: SizedBox(
                    height: SizeConfig.screenHeight! / 2.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Departure:  ",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  letterSpacing: 1.5,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: flight.departure,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Arrival:  ",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  letterSpacing: 1.5,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: flight.arrival,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Date:  ",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  letterSpacing: 1.5,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: flight.date,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Time:  ",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  letterSpacing: 1.5,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: flight.time,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Flight Type:  ",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  letterSpacing: 1.5,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: "${flight.type} class",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Cost:  ",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  letterSpacing: 1.5,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: "\$${flight.cost.toString()}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    InkWell(
                      onTap: (() {
                        Navigator.of(context).pop();
                      }),
                      child: Ink(
                        padding: EdgeInsets.all(
                          SizeConfig.blockSizeVertical! * 2,
                        ),
                        height: SizeConfig.blockSizeVertical! * 8,
                        width: SizeConfig.blockSizeHorizontal! * 55,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              SizeConfig.blockSizeHorizontal! * 4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.green,
                              size: 30.0,
                            ),
                            Text(
                              "Confirm",
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            );
          });
}
