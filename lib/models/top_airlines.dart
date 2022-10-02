class Airline {
  final String flightName;
  final String flightPosition;
  final double flightRating;

  const Airline({
    required this.flightName,
    required this.flightPosition,
    required this.flightRating,
  });
}

const allAirlines = [
  Airline(
      flightName: "Emirates", 
      flightPosition: "1st Place", 
      flightRating: 5.0),
  Airline(
      flightName: "Qatar Airways",
      flightPosition: "2nd Place",
      flightRating: 4.9),
  Airline(
      flightName: "Singapore Airlines",
      flightPosition: "3rd Place",
      flightRating: 4.8),
  Airline(
      flightName: "Korean Air", 
      flightPosition: "4th Place", 
      flightRating: 4.6),
  Airline(
      flightName: "Etihad Airways",
      flightPosition: "5th Place",
      flightRating: 4.5),
];
