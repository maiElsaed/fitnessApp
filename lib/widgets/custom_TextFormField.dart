import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.hintText,
    this.onChange,
    required this.type,
    required this.onsaved
  });

  String type;
  String hintText;
  final Function(String?)? onsaved;
  Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       onSaved: onsaved,
      keyboardType:type =="texts"? TextInputType.text:TextInputType.number,

      validator: (value) {
        if (value is Null || value.isEmpty) {
          return "this field required";
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        //hintText:"Email" ,
        label: Text(
          hintText,
          style: TextStyle(color: Color(0xffaeb4c2)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xffaeb4c2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xffaeb4c2),
          ),
        ),
      ),
    );
  }
}
