import 'package:app_marq_wiki/constants/app_color.dart';
import 'package:app_marq_wiki/constants/app_text.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.inputController,
    required this.onSubmitted,
    required this.onUploadFile,
  });

  final TextEditingController inputController;
  final VoidCallback onSubmitted;
  final VoidCallback onUploadFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.yellow,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.attach_file),
              color: Colors.white,
              onPressed: onUploadFile,
            ),
            Expanded(
              child: TextField(
                controller: inputController,
                style: const TextStyle(
                  color: AppColor.white,
                ),
                decoration: InputDecoration(
                  hintText: AppText.chatInputHint,
                  hintStyle: TextStyle(
                    color: AppColor.white.withValues(alpha: 0.6),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              color: AppColor.white,
              onPressed: onSubmitted,
            ),
          ],
        ),
      ),
    );
  }
}
