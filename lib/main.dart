import 'package:flutter/material.dart';
import 'package:islami_app/config/theme_manager/theme_manager.dart';
import 'package:islami_app/core/prefs_manager/prefs_manager.dart';
import 'package:islami_app/core/routes_manager.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool seen = await PrefsManager.checkFirstTime();

  runApp(MyApp(seen));
}

class MyApp extends StatelessWidget {
  final bool seen;

  const MyApp(this.seen, {super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.light,
    debugShowCheckedModeBanner: false,
    routes: RoutesManager.routes,
        initialRoute: seen
          ? RoutesManager.homeScreen
          : RoutesManager.onBoarding,
    );
  }
}

