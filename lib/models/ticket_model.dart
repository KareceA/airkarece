// A class to maintain the ticket cart

import 'package:airkarece/models/flights.dart';
import 'package:flutter/cupertino.dart';

class TicketModel extends ChangeNotifier {
  final List<Flights> _flights = [];

  int get totalFlights => _flights.length;
  List<Flights> get flights => _flights;

  void addFlight(Flights flight) {
    _flights.add(flight);

    notifyListeners();
  }

  void deleteFlight(Flights flight) {
    _flights.remove(flight);

    notifyListeners();
  }

  void removeAll() {
    _flights.clear();

    notifyListeners();
  }
}
