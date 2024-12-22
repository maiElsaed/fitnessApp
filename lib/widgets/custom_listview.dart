import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant.dart';
import '../cubits/get_notes_cubits/gets_cubit.dart';
import '../model/model.dart';
import 'custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomListview extends StatelessWidget {
  const CustomListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetsCubit,GetsState>(
        builder: (context, state) {
          List keys=GoalBox.keys.toList();
          List<GoalModel>AllNotes=  BlocProvider.of<GetsCubit>(context).allGoals??[];
          return Expanded(
              child: ListView.builder(
                  itemCount:AllNotes.length ,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10.h),
                      color: Color(0xfff8efcc),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text:AllNotes[index].goaltype,color:0xff000000 ,fontSize:18 ,),
                          CustomText(text:AllNotes[index].goalvalue.toString(),color:0xff000000 ,fontSize:18 ,),
                        ],
                      ),
                    );
                  },
              )
          );
        },
    );
  }
}
