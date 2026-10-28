import 'package:flutter/material.dart';
import 'package:ostad_map/feature/home/presentation/pages/home_screen.dart';
import 'package:ostad_map/feature/home/presentation/provider/location_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => LocationProvider(), child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ostad google map practice',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      home: HomeScreen(),
    );
  }
}