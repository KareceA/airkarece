import 'package:airkarece/models/top_airlines.dart';
import 'package:airkarece/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
            child: RichText(
              text: TextSpan(
                  text: 'Flight ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.blockSizeHorizontal! * 8,
                  ),
                  children: [
                    TextSpan(
                      text: 'search',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal! * 8,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ),
          Container(
            height: SizeConfig.blockSizeHorizontal! * 50,
            child: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal! * 5,
                  right: SizeConfig.blockSizeHorizontal! * 5),
              child: Form(
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Departure',
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal! * 2,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Destination eg. Los Angeles',
                      ),
                    ),
                    // SizedBox(
                    //   height: SizeConfig.blockSizeHorizontal! * 2,
                    // ),
                    TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        suffix: IconButton(
                          onPressed: () => _selectDate(context),
                          icon: const Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal! * 5,
                right: SizeConfig.blockSizeHorizontal! * 5),
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 3),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  icon: const Icon(Icons.search),
                  label: const Text("Search"),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                OutlinedButton(
                  onPressed: () => {},
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(17.0),
                      side: const BorderSide(color: Colors.green)),
                  child: const Text(
                    "To corporate clients",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          Expanded(
            child: Container(
              height: SizeConfig.blockSizeVertical! * 35,
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
                children: [
                  const Text("TOP-10 AIRLINES"),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 5,
                  ),
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

  Widget _buildAirlineTile(Airline airline) => ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical! * 1,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.pinkAccent,
          radius: SizeConfig.blockSizeHorizontal! * 6,
        ),
      );
}
