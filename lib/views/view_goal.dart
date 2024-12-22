import 'package:flutter/material.dart';

import '../widgets/custom_listitem.dart';
import '../widgets/custom_viewgoal.dart';

class GoalView extends StatelessWidget {
  const GoalView({super.key});
  static final String id = "GoalView";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Material(
        child:CustomViewgoal(),
      ),
    );
  }
}
