import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_cubits/add_cubit.dart';
import '../cubits/add_cubits/add_cubit_state.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text, required this.action});

  VoidCallback action;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xffFF6347), borderRadius: BorderRadius.circular(10)),
        //child:textWidget("Sign Up",30),
        child: Align(
            alignment: Alignment.center,
            child: BlocBuilder<AddCubit, AddCubitState>(
              builder: (context, state) {

                if( state is SuccessState || state is initialState){
                  return CustomText(
                    text: text!,
                    fontSize: 30.sp,
                    color: 0xffffffff,
                  );
                }else if(state is LoadingState ){
                  return CircularProgressIndicator();
                }else{
                   return CustomText(
                    text: "oops, there was an error",
                    fontSize: 30.sp,
                    color: 0xffffffff,
                  );
                }
              },
            )

        ),
      ),
    );
  }
}
