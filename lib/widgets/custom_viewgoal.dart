import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_notes_cubits/gets_cubit.dart';
import '../model/model.dart';
import 'custom_listitem.dart';
import 'custom_text.dart';
class CustomViewgoal extends StatelessWidget {
  const CustomViewgoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(10),
      child: Column(
        children: [
          CustomText(text: "All Goals",fontSize: 20,color: 0xff000000,),
          Expanded(
              child:BlocBuilder<GetsCubit,GetsState>(
                  builder: (context, state) {
                    List<GoalModel>AllNotes=  BlocProvider.of<GetsCubit>(context).allGoals??[];
                    return ListView.builder(
                      itemCount: AllNotes.length,
                        itemBuilder:(context, index) {

                           return CustomListItem(goalName:AllNotes[index].goaltype ,progress:AllNotes[index].goalvalue.toDouble() ,);
                        },
                    );
                  },
              )
          )
        ],)

    );
  }
}
