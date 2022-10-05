import 'package:airkarece/routes/routes.dart';
import 'package:airkarece/models/screen_models.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final Map arguments = (settings.arguments ?? {}) as Map;
  switch (settings.name) {
    case welcomeViewRoute:
      return PageTransition(
        child: const WelcomeScreen(),
        type: PageTransitionType.leftToRightWithFade,
      );

    case loginViewRoute:
      return PageTransition(
        child: const LoginScreen(),
        type: PageTransitionType.fade,
      );

    case signupViewRoute:
      return PageTransition(
        child: const SignupScreen(),
        type: PageTransitionType.fade,
      );

    case homeViewRoute:
      return PageTransition(
        child: const HomeScreen(),
        type: PageTransitionType.fade,
      );
    case checkoutViewRoute:
      return PageTransition(
        child: CheckoutScreen(
          flight: arguments["flight"],
        ),
        type: PageTransitionType.fade,
      );
    case availabilityViewRoute:
      return PageTransition(
        child: const AvailabilityScreen(),
        type: PageTransitionType.fade,
      );
    case ticketViewRoute:
      return PageTransition(
        child: TicketsScreen(
          flight: arguments["flight"],
        ),
        type: PageTransitionType.fade,
      );
    case flightAvailabilityViewRoute:
      return PageTransition(
        child: FlightAvailabilityScreen(
          from: arguments["from"],
          to: arguments["to"],
        ),
        type: PageTransitionType.fade,
      );
    default:
      return PageTransition(
        child: const TestScreen(),
        type: PageTransitionType.fade,
      );
  }
}
