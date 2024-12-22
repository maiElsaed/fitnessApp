import 'package:fitnessapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_notes_cubits/gets_cubit.dart';
import '../model/model.dart';
import 'custom_form.dart';
import 'custom_listview.dart';
import 'custom_text.dart';

class CustomHome extends StatefulWidget {
  const CustomHome({super.key});
  @override
  State<CustomHome> createState() => _CustomHomeState();
}

class _CustomHomeState extends State<CustomHome> {
  @override
  void initState() {
    BlocProvider.of<GetsCubit>(context).getAllGoals();
  }
  late List<GoalModel> Goals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            text: 'Fitness Goal',
            color: 0xff000000,
            fontSize: 30,
          ),
          SizedBox(
            height: 20,
          ),
          CustomForm(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "goal type",color:0xff000000 ,fontSize:25 ,),
              CustomText(text: "target value",color:0xff000000 ,fontSize:25 ,),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          CustomListview()
          // ListView.builder(
          //     itemBuilder: (context, index) => ,)
        ],
      ),
    );
  }
}
