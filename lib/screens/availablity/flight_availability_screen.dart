import 'package:airkarece/models/flights.dart';
import 'package:airkarece/screens/availablity/flights_list_screen.dart';
import 'package:airkarece/utils/app_config.dart';
import 'package:airkarece/widgets/drawer_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FlightAvailabilityScreen extends StatefulWidget {
  final String from;
  final String to;

  const FlightAvailabilityScreen(
      {Key? key, required this.from, required this.to})
      : super(key: key);

  @override
  State<FlightAvailabilityScreen> createState() =>
      _FlightAvailabilityScreenState();
}

class _FlightAvailabilityScreenState extends State<FlightAvailabilityScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const DrawerWidget(),
      appBar: _buildAppBar(),
      body: FutureBuilder<List<Flights>>(
        future: getFlights(http.Client(), widget.from, widget.to),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occured'),
            );
          } else if (snapshot.hasData) {
            return FlightsListScreen(flights: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      // backgroundColor: Colors.transparent,
      actions: [
        Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.sort_rounded,
              color: Colors.white,
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
}

class FlightsList {}
