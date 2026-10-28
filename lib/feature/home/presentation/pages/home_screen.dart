import 'package:flutter/material.dart';
import 'package:ostad_map/core/theme/app_color.dart';
import 'package:ostad_map/feature/home/widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColor.backGroundColor),
      appBar: HomeAppBar(),
    );
  }
}
