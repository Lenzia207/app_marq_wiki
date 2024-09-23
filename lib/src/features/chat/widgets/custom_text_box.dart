import 'package:app_marq_wiki/constants/app_color.dart';
import 'package:app_marq_wiki/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    required this.text,
    required this.alignment,
  });

  final String text;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: p10,
          horizontal: p20,
        ),
        padding: const EdgeInsets.all(p8),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(p10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(p10),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
