import 'package:airkarece/models/top_airlines.dart';
import 'package:airkarece/routes/routes.dart';
import 'package:airkarece/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:airkarece/widgets/drawer_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Airline> airlines = allAirlines;

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  var newFormat = DateFormat(" MMMM,dd");

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022, 8),
        lastDate: DateTime(2101));

    if (picked != null) {
      setState(() {
        selectedDate = picked;

        _dateController.text = newFormat.format(selectedDate);
      });
    }
  }

  @override
  void initState() {
    _dateController.text = newFormat.format(selectedDate);
    super.initState();
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const DrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5.0),
            child: RichText(
              text: TextSpan(
                  text: 'Flight ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeHorizontal! * 8.0,
                  ),
                  children: [
                    TextSpan(
                      text: 'search',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal! * 8.0,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 50.0,
            child: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal! * 5.0,
                  right: SizeConfig.blockSizeHorizontal! * 5.0),
              child: Form(
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _fromController,
                      decoration: const InputDecoration(
                        hintText: 'Departure',
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal! * 2.0,
                    ),
                    TextFormField(
                      controller: _toController,
                      decoration: const InputDecoration(
                        hintText: 'Arrival eg. Los Angeles',
                      ),
                    ),
                    // TextFormField(
                    //   controller: _dateController,
                    //   decoration: InputDecoration(
                    //     suffix: IconButton(
                    //       onPressed: () => _selectDate(context),
                    //       icon: const Icon(
                    //         Icons.calendar_month,
                    //         color: Colors.grey,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(height: 5.0),
          Center(
            child: InkWell(
              onTap: (() {
                _fromController.value.text.isNotEmpty &&
                        _toController.value.text.isNotEmpty
                    ? Navigator.of(context)
                        .pushNamed(flightAvailabilityViewRoute, arguments: {
                        "from": _fromController.text,
                        "to": _toController.text
                      })
                    : null;
              }),
              child: Ink(
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical! * 0.1),
                height: SizeConfig.blockSizeVertical! * 6.0,
                width: SizeConfig.blockSizeHorizontal! * 40.0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.red,
                  ]),
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal! * 3.0),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockSizeHorizontal! * 3.0),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 3.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal! * 5.0,
                right: SizeConfig.blockSizeHorizontal! * 5.0,
                top: SizeConfig.blockSizeHorizontal! * 3.0,
              ),
              height: SizeConfig.blockSizeVertical! * 35.0,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.blockSizeHorizontal! * 8),
                  topRight:
                      Radius.circular(SizeConfig.blockSizeHorizontal! * 8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: SizeConfig.blockSizeVertical! * 3.0,
                  // ),
                  RichText(
                    text: const TextSpan(
                        text: 'TOP-10 ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                            text: 'airlines',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 2.0,
                  ),
                  Expanded(child: _buildAirlinesList())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
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

  Widget _buildAirlineTile(Airline airline) => SizedBox(
      width: SizeConfig.blockSizeHorizontal! * 35,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: SizeConfig.blockSizeHorizontal! * 6.0,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 2.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    airline.flightName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    airline.flightPosition,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("⭐"),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 2.0,
              ),
              Text(
                airline.flightRating.toString(),
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ],
          ),
        ],
      ));

  Widget _buildAirlinesList() => ListView.separated(
        padding: const EdgeInsets.only(top: 0),
        itemBuilder: (context, index) {
          final airline = airlines[index];
          return _buildAirlineTile(airline);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: SizeConfig.blockSizeVertical! * 3.0,
          );
        },
        itemCount: airlines.length,
      );
}
