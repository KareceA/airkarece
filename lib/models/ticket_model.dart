// A class to maintain the ticket cart

import 'package:airkarece/models/flight.dart';
import 'package:flutter/cupertino.dart';

class TicketModel extends ChangeNotifier {
  final List<Flight> _flights = [];

  int get totalFlights => _flights.length;
  List<Flight> get flights => _flights;

  void addFlight(Flight flight) {
    _flights.add(flight);

    notifyListeners();
  }

  void deleteFlight(Flight flight) {
    _flights.remove(flight);

    notifyListeners();
  }

  void removeAll() {
    _flights.clear();

    notifyListeners();
  }
}
