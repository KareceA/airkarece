import 'dart:convert';

import 'package:http/http.dart' as http;

// A class to model the flight details that will be used for the tickets

class Flights {
  final int flightId;
  final int userId;
  final int id;
  final String from;
  final String to;
  final String datetime;
  final String time;
  final String cost;
  final String status;
  final String type;

  const Flights({
    required this.flightId,
    required this.userId,
    required this.id,
    required this.from,
    required this.to,
    required this.datetime,
    required this.time,
    required this.cost,
    required this.status,
    required this.type,
  });

  factory Flights.fromJson(Map<String, dynamic> json) {
    return Flights(
      flightId: json["flight_id"] as int,
      userId: 1,
      id: json["id"] as int,
      from: json["from"] as String,
      to: json["to"] as String,
      datetime: json["datetime"] as String,
      time: json["time"] as String,
      cost: json["cost"] as String,
      status: json["status"] as String,
      type: "none",
    );
  }

  factory Flights.fromJsonForPost(Map<String, dynamic> json) {
    return Flights(
      flightId: 1,
      userId: json["user_id"] as int,
      id: json["id"] as int,
      from: json["from"] as String,
      to: json["to"] as String,
      datetime: json["datetime"] as String,
      time: json["time"] as String,
      cost: json["cost"] as String,
      status: "none",
      type: json["class"] as String,
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

  
  return parseFlights(response.body);
}

Future<Flights> bookFlights(String datetime, String time, String from,
    String to, String type, String cost, int userId) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'datetime': datetime,
      'time': time,
      'from': from,
      'to': to,
      'class': type,
      'cost': cost,
      'user_id': userId,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    
    return Flights.fromJsonForPost(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to Book Tickets.');
  }
}


List<Flights> parseFlights(String responsebody) {
  final parsed = jsonDecode(responsebody).cast<Map<String, dynamic>>();

  return parsed.map<Flights>((json) => Flights.fromJson(json)).toList();
}
