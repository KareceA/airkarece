import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// A class to model the flight details that will be used for the tickets

class Flights {
  final int flightId;
  final int id;
  final String from;
  final String to;
  final String datetime;
  final String time;
  final String cost;
  final String status;

  const Flights({
    required this.flightId,
    required this.id,
    required this.from,
    required this.to,
    required this.datetime,
    required this.time,
    required this.cost,
    required this.status,
  });

  factory Flights.fromJson(Map<String, dynamic> json) {
    return Flights(
      flightId: json["flight_id"] as int,
      id: json["id"] as int,
      from: json["from"] as String,
      to: json["to"] as String,
      datetime: json["datetime"] as String,
      time: json["time"] as String,
      cost: json["cost"] as String,
      status: json["status"] as String,
    );
  }
}

Future<List<Flights>> getFlights(
    http.Client client, String from, String to) async {
  final body = {
    'from': from,
    'to': to,
  };
  final uri =
      Uri.https('sleepy-castle-56993.herokuapp.com', '/api/findFlight', body);
  final response = await client.get(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data);
  } else {
    print('failed');
  }

  return parseFlights(response.body);
}

List<Flights> parseFlights(String responsebody) {
  final parsed = jsonDecode(responsebody).cast<Map<String, dynamic>>();

  return parsed.map<Flights>((json) => Flights.fromJson(json)).toList();
}

