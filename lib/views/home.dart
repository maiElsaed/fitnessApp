import 'package:flutter/material.dart';

import '../widgets/custom_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static final id = "HomeView";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Material(
        color: Color(0xffF5FFFA),
        child: CustomHome(),
      ),
    );
  }
}
