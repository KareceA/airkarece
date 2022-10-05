import 'package:airkarece/models/flights.dart';
import 'package:airkarece/models/ticket_model.dart';
import 'package:airkarece/utils/app_config.dart';
import 'package:airkarece/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketsScreen extends StatefulWidget {
  final Flights? flight;
  const TicketsScreen({Key? key, required this.flight}) : super(key: key);

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    int count = Provider.of<TicketModel>(context, listen: false).totalFlights;
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const DrawerWidget(),
      body: count > 0
          ? Padding(
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Purchased Tickets",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  Expanded(child: _buildTicketList()),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2,
                  ),
                  InkWell(
                    onTap: (() {
                      setState(() {
                        Provider.of<TicketModel>(context, listen: false)
                            .removeAll();
                      });
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
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 30.0,
                          ),
                          Text(
                            "Delete Tickets",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text(
                "No Tickets Purchased",
                style: TextStyle(fontSize: 20),
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
        Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.sort_rounded,
              color: Colors.black,
            ),
            onPressed: () => {
              Scaffold.of(context).openDrawer(),
            },
          );
        })
      ],
      elevation: 0,
    );
  }

  Widget _buildTicketTile(Flights flight) => Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 4),
              height: SizeConfig.screenHeight! / 2.5,
              width: SizeConfig.screenWidth! / 0.5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "TICKET NO.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              height: 1.5),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<TicketModel>(context, listen: false)
                                  .deleteFlight(flight);
                            });
                          },
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Flight Departing from:  ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.5,
                          height: 1.5),
                      children: [
                        TextSpan(
                          text: flight.from,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Flight Arriving at:  ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.5,
                          height: 1.5),
                      children: [
                        TextSpan(
                          text: flight.to,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Date of Depature:  ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.5,
                          height: 1.5),
                      children: [
                        TextSpan(
                          text: flight.datetime,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Time of Depature:  ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.5,
                          height: 1.5),
                      children: [
                        TextSpan(
                          text: flight.time,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Type of flight seat:  ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.5,
                          height: 1.5),
                      children: [
                        TextSpan(
                          text: flight.status,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Cost of flight ticket:  ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.5,
                          height: 1.5),
                      children: [
                        TextSpan(
                          text: "\$${flight.cost.toString()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildTicketList() => ListView.separated(
        itemBuilder: (context, index) {
          final flight =
              Provider.of<TicketModel>(context, listen: false).flights[index];
          return _buildTicketTile(flight);
        },
        separatorBuilder: ((context, index) {
          return SizedBox(
            height: SizeConfig.blockSizeVertical! * 4,
          );
        }),
        itemCount:
            Provider.of<TicketModel>(context, listen: false).totalFlights,
      );
}
