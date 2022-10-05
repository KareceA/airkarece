import 'package:airkarece/models/flights.dart';
import 'package:airkarece/routes/routes.dart';
import 'package:airkarece/utils/app_config.dart';
import 'package:flutter/material.dart';

class FlightsListScreen extends StatelessWidget {
  const FlightsListScreen({Key? key, required this.flights}) : super(key: key);

  final List<Flights> flights;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
          child: flights.isNotEmpty
              ? RichText(
                  text: TextSpan(
                    text: 'Availabile ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal! * 8,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'Flights',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal! * 8,
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  'No Flights Availabile',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal! * 8,
                      fontWeight: FontWeight.bold),
                ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
            child: SizedBox(
              width: SizeConfig.screenWidth,
              child: _buildFlightsLists(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFlightTile(Flights flight) => Container(
        padding: EdgeInsets.all(
          SizeConfig.blockSizeHorizontal! * 2,
        ),
        height: SizeConfig.blockSizeVertical! * 15,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 45, 45, 45),
            borderRadius: BorderRadius.circular(
              SizeConfig.safeBlockVertical! * 1,
            )),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                flight.from,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
                size: 19,
              ),
              Text(
                flight.to,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                flight.datetime,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Text(
                flight.time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Text(
                "${flight.status} class",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                flight.cost.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              Builder(builder: (context) {
                return TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        checkoutViewRoute,
                        arguments: {"flight": flight},
                      );
                    },
                    child: const Text(
                      "View More Details",
                      style: TextStyle(
                        color: Color.fromARGB(255, 242, 217, 247),
                      ),
                    ));
              })
            ],
          ),
        ]),
      );

  Widget _buildFlightsLists() => ListView.separated(
      itemBuilder: (context, index) {
        final flight = flights[index];
        return _buildFlightTile(flight);
      },
      separatorBuilder: ((context, index) {
        return Center(
          child: Container(
            padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical! * 2),
            width: SizeConfig.screenWidth,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  color: const Color.fromARGB(255, 242, 217, 247),
                  height: SizeConfig.blockSizeVertical! * 0.2,
                  width: SizeConfig.screenWidth! / 3),
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 242, 217, 247),
                radius: SizeConfig.blockSizeHorizontal! * 1.5,
              ),
              Container(
                  color: const Color.fromARGB(255, 242, 217, 247),
                  height: SizeConfig.blockSizeVertical! * 0.2,
                  width: SizeConfig.screenWidth! / 3),
            ]),
          ),
        );
      }),
      itemCount: flights.length);
}
