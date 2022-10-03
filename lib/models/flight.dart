// A class to model the flight details that will be used for the tickets

class Flight {
  final String departure;
  final String arrival;
  final String date;
  final String time;
  final double cost;
  final String type;

  const Flight({
    required this.departure,
    required this.arrival,
    required this.date,
    required this.time,
    required this.cost,
    required this.type,
  });
}

const allFLights = [
  Flight(
      departure: "New York",
      arrival: "London",
      cost: 570,
      type: "Business",
      date: "5-10-22",
      time: "9:00am"),
  Flight(
      departure: "Derli",
      arrival: "Paris",
      cost: 686,
      type: "Business",
      date: "9-11-22",
      time: "7:00pm"),
  Flight(
      departure: "Accra",
      arrival: "Toronto",
      cost: 120,
      type: "Economy",
      date: "23-10-22",
      time: "12:00pm"),
  Flight(
      departure: "Soeul",
      arrival: "Accra",
      cost: 120,
      type: "Economy",
      date: "7-12-22",
      time: "10:00pm"),
  Flight(
      departure: "Vancouver",
      arrival: "Miami",
      cost: 120,
      type: "Economy",
      date: "16-11-22",
      time: "5:30pm"),
  Flight(
      departure: "Berlin",
      arrival: "Tokyo",
      cost: 732,
      type: "Business",
      date: "24-12-22",
      time: "11:00am"),
];
