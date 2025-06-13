import 'package:flutter/material.dart';
import 'package:test_task/utils/app_colors.dart';
import 'package:test_task/utils/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero
      ),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(text,
              style: AppTextStyles.ebGaramond(
                style: TextStyle(
                  color: AppColors.black3,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
