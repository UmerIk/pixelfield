import 'package:flutter/material.dart';
import 'package:test_task/utils/app_colors.dart';
import 'package:test_task/utils/app_text_styles.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, required this.controller, required this.label, required this.obscureText, required this.keyboardType});

  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      style: AppTextStyles.lato(
          style: TextStyle(
              color: AppColors.grey1,
              fontSize: 16
          )
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppTextStyles.lato(
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 12
          )
        ),
        suffixIcon: !widget.obscureText ? null : IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.secondary,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
