import 'package:flutter/material.dart';
import 'package:islami_app/features/home/home_screen.dart';
import 'package:islami_app/features/onboarding/onboarding_screen.dart';
import 'package:islami_app/features/sura_details/sura_details.dart';

abstract class RoutesManager {
  static const String homeScreen = "/homeScreen";
    static const String suraDetails = "/suraDetails";
      static const String onBoarding = "/onBoarding";
  static Map<String, WidgetBuilder> routes = {
    homeScreen :(_) => HomeScreen(),
    suraDetails:(_) => SuraDetails(),
    onBoarding: (_) => OnboardingScreen(),
    
  };
}
