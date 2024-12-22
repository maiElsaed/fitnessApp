import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {required this.text, required this.fontSize, required this.color});
  final String text;
  final double fontSize;
  final int color;
  //final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
        text,
        style: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: FontWeight.bold,
          color: Color(color),
        ),maxFontSize:35
    );
  }
}
