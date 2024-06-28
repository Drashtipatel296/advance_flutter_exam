import 'package:advance_flutter_exam/controller/api_provider.dart';
import 'package:advance_flutter_exam/controller/liked_provider.dart';
import 'package:advance_flutter_exam/screens/home/detail/liked_screen.dart';
import 'package:advance_flutter_exam/screens/home/home_screen.dart';
import 'package:advance_flutter_exam/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LikedProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
