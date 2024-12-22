import 'package:fitnessapp/model/model.dart';
import 'package:fitnessapp/views/home.dart';
import 'package:fitnessapp/views/view_goal.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constant.dart';
import 'cubits/add_cubits/add_cubit.dart';
import 'cubits/get_notes_cubits/gets_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(GoalModelAdapter());
  await Hive.openBox<GoalModel>(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(500, 640),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AddCubit(),
            ),
            BlocProvider(
              create: (context) => GetsCubit(),
            ),
          ],
          child: MaterialApp(
            initialRoute: GoalView.id,
            //home: LoginPage(),
            routes: {
              HomeView.id: (context) => HomeView(),
              GoalView.id: (context)=>GoalView(),
              // Registerpage.id:(context)=>Registerpage()
            },
          ),
        );
      },
    );
  }
}
