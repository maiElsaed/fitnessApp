import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_cubits/add_cubit.dart';
import '../cubits/get_notes_cubits/gets_cubit.dart';
import '../model/model.dart';
import 'custom_TextFormField.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
   String? goalType;
   String? goalvalue;
  bool check_login = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  bool _isLoad = false;

  String AlertText = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Goal type', fontSize: 20, color: 0xff000000),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: 'Fitness Goal type',
            type: "texts",
            onsaved: (type) {
                goalType=type;
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(text: 'target value', fontSize: 20, color: 0xff000000),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: 'target value',
            type: "number",
            onsaved: (value) {
                goalvalue=value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            text: "Add Goal",
            action: () async {
              if (formKey.currentState!.validate()){
                formKey.currentState!.save();
                var addCubit =
                    await BlocProvider.of<AddCubit>(context).addGoal(
                      GoalModel(
                        goaltype:goalType! ,
                        goalvalue: int.parse(goalvalue!),
                      ));
                BlocProvider.of<GetsCubit>(context).getAllGoals();
              } else {
                autovalidateMode= AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
