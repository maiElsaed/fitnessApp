import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomListItem extends StatelessWidget {
  final String goalName;
  final double progress; // Value between 0.0 and 1.0 (e.g., 0.75 for 75%)
  final String motivationalText;

  const CustomListItem({

    required this.goalName,
    required this.progress,
    this.motivationalText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xfff8efcc),
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text:goalName ,fontSize: 18,color: 0xff000000,),

            SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Color(0xFF32CD32), // Green progress bar
              minHeight: 10,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text:'${(progress * 100).toStringAsFixed(0)}% ' ,fontSize: 18,color:0xffc3c3c3 ,),

                if (progress == 1.0)
                  CustomText(text: motivationalText.isNotEmpty ? motivationalText : 'Great job!',color:0xFF32CD32 ,fontSize:16 ,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
