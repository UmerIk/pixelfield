import 'package:flutter/material.dart';
import 'package:test_task/utils/app_colors.dart';
import 'package:test_task/utils/app_text_styles.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.title, required this.description});

  final String title, description;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(color: AppColors.black2,
      ),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: AppTextStyles.ebGaramond(
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: AppColors.grey1,
              )
            ),
          ),
          Text(description,
            style: AppTextStyles.lato(
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey1,
                )
            ),
          ),
        ],
      ),
    );
  }
}
